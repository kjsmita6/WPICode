/*
 * ECE 3849 Lab2 starter project
 *
 * Gene Bogdanov    9/13/2017
 */
/* XDCtools Header files */
#include <xdc/std.h>
#include <xdc/runtime/System.h>
#include <xdc/cfg/global.h>

/* BIOS Header files */
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/gates/GateTask.h>
#include <ti/sysbios/gates/GateHwi.h>
#include <ti/sysbios/utils/Load.h>

/* C Standard Library */
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>

/* Driverlib */
#include "driverlib/fpu.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/adc.h"
#include "driverlib/timer.h"
#include "driverlib/gpio.h"
#include "driverlib/udma.h"

/* Inc */
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"
#include "inc/TM4C1294NCPDT.h"

/* Project files */
#include "Crystalfontz128x128_ST7735.h"
#include "buttons.h"
#include "sampling.h"

/* KISS */
#include "kiss_fft.h"
#include "_kiss_fft_guts.h"

#define NFFT 1024 // FFT length
#define KISS_FFT_CFG_SIZE (sizeof(struct kiss_fft_state)+sizeof(kiss_fft_cpx)*(NFFT-1))

#define ADC_BUFFER_SIZE 2048

uint32_t gPhase = 0;
uint32_t gPhaseIncrement = 162818870;
GateHwi_Handle gateFreq;

extern uint8_t gPWMWaveformTable[PWM_WAVEFORM_TABLE_SIZE] = {0};

#pragma DATA_ALIGN(gDMAControlTable, 1024) // address alignment required
tDMAControlTable gDMAControlTable[64];     // uDMA control table (global)
extern volatile bool gDMAPrimary = true;
uint32_t gCPULoad = 0;
volatile double gFreq = 0;

uint32_t gSystemClock = 120000000; // [Hz] system clock frequency
extern volatile int gADCBufferIndex = ADC_BUFFER_SIZE - 1;
volatile uint16_t gADCBuffer[ADC_BUFFER_SIZE];
volatile uint16_t gWaveformBuffer[ADC_BUFFER_SIZE / 2];
volatile uint64_t gADCErrors = 0;
const uint32_t gVoltageScaleArr[] = { 100, 200, 500, 1000 };
volatile bool gRising = true;
volatile uint32_t gTriggerIdx = 64;
tContext sContext;
tRectangle rectFullScreen;
volatile uint32_t timer0_elapsed, timer0_periods;
volatile uint32_t gVoltageScaleIdx = 3;
//volatile uint32_t gTime = 8345;
//volatile uint32_t prev = 0;

volatile bool mode = true; // true = oscilloscope, false = FFT

/*
 *  ======== main ========
 */
int main(void)
{
    IntMasterDisable();

    Crystalfontz128x128_Init(); // Initialize the LCD display driver
    Crystalfontz128x128_SetOrientation(LCD_ORIENTATION_UP); // set screen orientation

    GrContextInit(&sContext, &g_sCrystalfontz128x128); // Initialize the grlib graphics context
    GrContextFontSet(&sContext, &g_sFontFixed6x8); // select font

    tRectangle rect = {0, 0, GrContextDpyWidthGet(&sContext)-1, GrContextDpyHeightGet(&sContext)-1};
    rectFullScreen = rect;

    PeripheralInit();
    gCPULoad = getCPULoad();
    //dma_init();
    //pwm_enable();

    BIOS_start();

    return 0;
}

void dma_init() {
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UDMA);
    uDMAEnable();
    uDMAControlBaseSet(gDMAControlTable);

    uDMAChannelAssign(UDMA_CH24_ADC1_0); // assign DMA channel 24 to ADC1 sequence 0
    uDMAChannelAttributeDisable(UDMA_SEC_CHANNEL_ADC10, UDMA_ATTR_ALL);

    // primary DMA channel = first half of the ADC buffer
    uDMAChannelControlSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT,
                          UDMA_SIZE_16 | UDMA_SRC_INC_NONE | UDMA_DST_INC_16 | UDMA_ARB_4);
    uDMAChannelTransferSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT,
                           UDMA_MODE_PINGPONG, (void*)&ADC1_SSFIFO0_R,
                           (void*)&gADCBuffer[0], ADC_BUFFER_SIZE/2);

    // alternate DMA channel = second half of the ADC buffer
    uDMAChannelControlSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT,
                          UDMA_SIZE_16 | UDMA_SRC_INC_NONE | UDMA_DST_INC_16 | UDMA_ARB_4);
    uDMAChannelTransferSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT,
                           UDMA_MODE_PINGPONG, (void*)&ADC1_SSFIFO0_R,
                           (void*)&gADCBuffer[ADC_BUFFER_SIZE/2], ADC_BUFFER_SIZE/2);

    uDMAChannelEnable(UDMA_SEC_CHANNEL_ADC10);
}

uint32_t getCPULoad() {
    //    Load_Stat swiLoad;
    //    Load_Stat hwiLoad;
    //    Load_Stat taskLoad;
    //
    //    Bool swi = Load_getGlobalSwiLoad(&swiLoad);
    //    Bool hwi = Load_getGlobalHwiLoad(&hwiLoad);
    //    if(swi && hwi) {
    //        Task_Handle task = Task_Object_first();
    //        while(task) {
    //            Load_Stat temp;
    //            Load_getTaskLoad(task, &temp);
    //            if(taskLoad.totalTime <= temp.totalTime) {
    //                taskLoad.totalTime = temp.totalTime;
    //            }
    //            taskLoad.threadTime += temp.threadTime;
    //        }
    //
    //        if(swiLoad.totalTime == 0) {
    //            swiLoad.totalTime = 1;
    //        }
    //        if(hwiLoad.totalTime == 0) {
    //            hwiLoad.totalTime = 1;
    //        }
    //        if(taskLoad.totalTime == 0) {
    //            taskLoad.totalTime = 1;
    //        }
    //
    //        double swiLoad_double = ((double)swiLoad.threadTime) / ((double)swiLoad.totalTime);
    //        double hwiLoad_double = ((double)hwiLoad.threadTime) / ((double)hwiLoad.totalTime);
    //        double taskLoad_double = ((double)taskLoad.threadTime) / ((double)taskLoad.totalTime);
    //
    //        return swiLoad_double + hwiLoad_double + taskLoad_double;
    //    }
    //    return Load_getCPULoad();
    uint32_t i = 0;
    TimerIntClear(TIMER3_BASE, TIMER_TIMA_TIMEOUT);
    TimerEnable(TIMER3_BASE, TIMER_A);
    while(!(TimerIntStatus(TIMER3_BASE, false) & TIMER_TIMA_TIMEOUT)) {
        i++;
    }
    return i;
}

// Button Task
void task0_func() {
    IntMasterEnable();
    while(1) {
        Semaphore_pend(sem_button, BIOS_WAIT_FOREVER);

        uint32_t gpio_buttons =
                (~GPIOPinRead(GPIO_PORTJ_BASE, 0xff) & (GPIO_PIN_1 | GPIO_PIN_0)) | // EK-TM4C1294XL button 1 and 2
                ((~GPIOPinRead(GPIO_PORTH_BASE, 0xff) & GPIO_PIN_1) << 1) | // BoosterPack button 1
                ((~GPIOPinRead(GPIO_PORTK_BASE, 0xff) & GPIO_PIN_6) >> 3) | // BoosterPack button 2
                ((~GPIOPinRead(GPIO_PORTD_BASE, 0xff) & GPIO_PIN_4) << 0); // Joystick Select

        uint32_t old_buttons = gButtons;
        ButtonDebounce(gpio_buttons);
        ButtonReadJoystick();
        uint32_t presses = ~old_buttons & gButtons;
        presses |= ButtonAutoRepeat();

        int i;
        for(i = 0; i < 32; i++) {
            if(presses & (1 << i)) {
                Mailbox_post(mailbox_button, &i, BIOS_WAIT_FOREVER);
            }
        }
    }
}

// User Input Task
void task1_func() {
    while(1) {
        uint32_t presses = 0;
        Mailbox_pend(mailbox_button, &presses, BIOS_WAIT_FOREVER);
        if(presses != 0) {
            switch(presses) {
            case 1: // LaunchPad Button 2
                mode = !mode;
                Semaphore_post(sem_disp);
                break;
            case 4: // Joystick select
                gRising = !gRising;
                Semaphore_post(sem_disp);
                break;
            case 2: // BoosterPack Button 1
                gVoltageScaleIdx = gVoltageScaleIdx >= 3 ? 3 : gVoltageScaleIdx + 1;
                Semaphore_post(sem_disp);
                break;
            case 3: // BoosterPack Button 1
                gVoltageScaleIdx = gVoltageScaleIdx <= 0 ? 0 : gVoltageScaleIdx - 1;
                Semaphore_post(sem_disp);
                break;
            default:
                continue;
            }
        }
    }
}

// Display Task
void task2_func() {
    int i;
    while(1) {
        Semaphore_pend(sem_disp, BIOS_WAIT_FOREVER);
        uint32_t mV_div = gVoltageScaleArr[gVoltageScaleIdx];

        GrContextForegroundSet(&sContext, ClrBlack);
        GrRectFill(&sContext, &rectFullScreen); // fill screen with black

        GrContextForegroundSet(&sContext, ClrBlue);
        for(i = -3; i <= 3; i++) {
            GrLineDrawV(&sContext, 64 + i * 20, 0, 128);
        }
        for(i = -3; i <= 3; i++) {
            GrLineDrawH(&sContext, 0, 128, 64 + i * 20);
        }

        if (!mode) {
            GrContextForegroundSet(&sContext, ClrOrange);
        }
        else {
            GrContextForegroundSet(&sContext, ClrYellow);
        }

        for(i = 0; i < 127; i++) {
            GrLineDraw(&sContext, i, gWaveformBuffer[i], i + 1, gWaveformBuffer[i + 1]);
        }

        GrContextForegroundSet(&sContext, ClrWhite);
        GrStringDraw(&sContext, gRising ? "UP" : "DOWN", -1, 90, 0, false);

        char str[64];
        GrContextForegroundSet(&sContext, ClrWhite);
        if(!mode) {
            snprintf(str, sizeof(str), "20 kHz 20 dBV");
        }
        else {
            snprintf(str, sizeof(str), "20 us %d mV", mV_div);
        }
        GrStringDraw(&sContext, str, -1, 0, 0, false);

        // GrStringDraw(&sContext, mode ? "OSC" : "FFT", -1, 0, 120, false);

        uint32_t cpuLoad = getCPULoad();
        double cpu_load_curr = 1.0 - (double)cpuLoad / gCPULoad;
        //gCPULoad = cpuLoad;
        snprintf(str, sizeof(str), "CPU: %.2lf%% -- %s", cpu_load_curr * 100.0, mode ? "OSC" : "FFT");
        GrStringDraw(&sContext, str, -1, 0, 110, false);

        snprintf(str, sizeof(str), "f = %.3f Hz", gFreq);
        GrStringDraw(&sContext, str, -1, 0, 120, false);

        GrFlush(&sContext);
    }
}

// Waveform task
void task3_func() {
    uint32_t i;
    while(1) {
        Semaphore_pend(sem_wave, BIOS_WAIT_FOREVER);

        if(!mode) {
            for (i = 0; i < 1024; i++) {
                gWaveformBuffer[i] = gADCBuffer[ADC_BUFFER_WRAP(gADCBufferIndex - 1024 + i)];
            }
        }
        else {
            int idx = findTrigger(20, gVoltageScaleArr[gVoltageScaleIdx], gRising);
            if(idx == -1) {
                idx = gADCBufferIndex - 64;
            }
            for(i = 0; i < 128; i++) {
                gWaveformBuffer[i] = gADCBuffer[ADC_BUFFER_WRAP(idx - 64 + i)];
            }
        }
        Semaphore_post(sem_proc);
    }
}

// Processing task
void task4_func() {
    int i;
    static char kiss_fft_cfg_buffer[KISS_FFT_CFG_SIZE];
    size_t buffer_size = KISS_FFT_CFG_SIZE;
    kiss_fft_cfg cfg;
    static kiss_fft_cpx in[NFFT], out[NFFT];
    cfg = kiss_fft_alloc(NFFT, 0, kiss_fft_cfg_buffer, &buffer_size);
    static float w[NFFT];
    for (i = 0; i < NFFT; i++) {
        w[i] = 0.42f- 0.5f * cosf(2*PI*i/(NFFT-1)) + 0.08f * cosf(4*PI*i/(NFFT-1));
    }

    while(1) {
        Semaphore_pend(sem_proc, BIOS_WAIT_FOREVER);

        if(!mode) {
            for (i = 0; i < NFFT; i++) {
                in[i].r = (gWaveformBuffer[i] * 3.3f / 4096.f) * w[i];
                in[i].i = 0;
            }
            kiss_fft(cfg, in, out);
            for (i = 0; i < NFFT; i++) {
                float mag = log10f(sqrtf(out[i].r * out[i].r + out[i].i * out[i].i));
                gWaveformBuffer[i] = 84 - (int)roundf(20.f * mag);
            }
        }

        else {
            for(i = 0; i < 128; i++) {
                gWaveformBuffer[i] = scale_voltage(gWaveformBuffer[i], gVoltageScaleArr[gVoltageScaleIdx]);
            }
        }

        Semaphore_post(sem_disp);
        Semaphore_post(sem_wave);
    }
}

// Frequency task
void task5_func() {
    while(1) {
        Semaphore_pend(sem_freq, BIOS_WAIT_FOREVER);
        //gCPULoad = getCPULoad();
        //IArg key = GateHwi_enter(gateFreq);
        gFreq = (10000.f * timer0_elapsed) / (timer0_periods + 0.0);
        timer0_elapsed = 0;
        timer0_periods = 0;
        //GateHwi_leave(gateFreq, key);
    }
}

// ADC HWI
void m3Hwi0_int() {
    ADC1_ISC_R = ADC_ISC_IN0;
    if (ADC1_OSTAT_R & ADC_OSTAT_OV0) {
        gADCErrors++;
        ADC1_OSTAT_R = ADC_OSTAT_OV0;
    }
    gADCBufferIndex = ADC_BUFFER_WRAP(gADCBufferIndex + 1);
    gADCBuffer[gADCBufferIndex] = ADC1_SSFIFO0_R;
}

// DMA
//void m3Hwi0_int() {
//    ADCIntClearEx(ADC1_BASE, ADC_INT_DMA_SS0); // clear the ADC1 sequence 0 DMA interrupt flag // ADC_ISC_DMAIN0? // ADC_INT_DMA_SS0?
//
//    // Check the primary DMA channel for end of transfer, and restart if needed.
//    if (uDMAChannelModeGet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT) ==
//            UDMA_MODE_STOP) {
//        uDMAChannelTransferSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT,
//                               UDMA_MODE_PINGPONG, (void*)&ADC1_SSFIFO0_R,
//                               (void*)&gADCBuffer[0], ADC_BUFFER_SIZE/2); // restart the primary channel (same as setup)
//        gDMAPrimary = false;    // DMA is currently occurring in the alternate buffer
//    }
//
//    // Check the alternate DMA channel for end of transfer, and restart if needed.
//    // Also set the gDMAPrimary global.
//    if (uDMAChannelModeGet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT) ==
//            UDMA_MODE_STOP) {
//        uDMAChannelTransferSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT,
//                               UDMA_MODE_PINGPONG, (void*)&ADC1_SSFIFO0_R,
//                               (void*)&gADCBuffer[ADC_BUFFER_SIZE/2], ADC_BUFFER_SIZE/2); // restart the alternate channel (same as setup)
//        gDMAPrimary = true;    // DMA is currently occurring in the primary buffer
//    }
//
//    // The DMA channel may be disabled if the CPU is paused by the debugger.
//    if (!uDMAChannelIsEnabled(UDMA_SEC_CHANNEL_ADC10)) {
//        uDMAChannelEnable(UDMA_SEC_CHANNEL_ADC10);  // re-enable the DMA channel
//    }
//}

void m3Hwi1_int() {
    TIMER0_ICR_R = TIMER_ICR_CAECINT | TIMER_ICR_CAMCINT; // changed | to &
    static uint32_t prev = 0;
    uint32_t current = TimerValueGet(TIMER0_BASE, TIMER_A);
    //IArg key = GateHwi_enter(gateFreq);
    timer0_elapsed = current - prev;
    timer0_periods++;
    //GateHwi_leave(gateFreq, key);
    prev = current;
}

// Interrupt vector 26, priority 0
void m3Hwi2_int() {
    PWM0_0_ISC_R = PWM_ISC_INTPWM0; // clear PWM interrupt flag
    gPhase += gPhaseIncrement;

    PWM0_0_CMPB_R = 1 + gPWMWaveformTable[gPhase >> (32 - PWM_WAVEFORM_INDEX_BITS)];
}

// Clock interrupt
void clock0_int() {
    Semaphore_post(sem_button);
}

void clock1_int() {
    //Semaphore_post(sem_freq);
}
