/*
 * ECE 3849 Lab2 starter project
 *
 * Gene Bogdanov    9/13/2017
 */
/* XDCtools Header files */
#include <xdc/std.h>
#include <xdc/runtime/System.h>
#include <xdc/cfg/global.h>
#include <xdc/runtime/Timestamp.h>
#include <xdc/runtime/Types.h>


/* BIOS Header files */
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>

#include <stdint.h>
#include <stdbool.h>
#include <string.h>

#include "driverlib/fpu.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/adc.h"
#include "driverlib/timer.h"
#include "driverlib/gpio.h"

#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"
#include "inc/TM4C1294NCPDT.h"

#include "Crystalfontz128x128_ST7735.h"
#include "buttons.h"
#include "sampling.h"

#include <math.h>
#include "kiss_fft.h"
#include "_kiss_fft_guts.h"
#define PI 3.14159265358979f
#define NFFT 1024 // FFT length
#define KISS_FFT_CFG_SIZE (sizeof(struct kiss_fft_state)+sizeof(kiss_fft_cpx)*(NFFT-1))

#define ADC_BUFFER_SIZE 2048

#define CLOCK_PERIOD 1000
#define TIMESTAMP_CYCLES 4294.967295 // cycles per microsecond (4.294967295 GHz)
//#define TIMESTAMP_DEBUG 
#undef TIMESTAMP_DEBUG

uint32_t gSystemClock = 120000000; // [Hz] system clock frequency
volatile int gADCBufferIndex = ADC_BUFFER_SIZE - 1;
volatile uint16_t gADCBuffer[ADC_BUFFER_SIZE];
volatile uint16_t gWaveformBuffer[ADC_BUFFER_SIZE / 2];
volatile uint64_t gADCErrors = 0;
const uint32_t gVoltageScaleArr[] = { 100, 200, 500, 1000 };
volatile bool gRising = true;
volatile uint32_t gTriggerIdx = 64;
tContext sContext;
tRectangle rectFullScreen;

volatile uint32_t gVoltageScaleIdx = 3;

volatile bool mode = true; // true = oscilloscope, false = FFT

double task_button_latency = 0;

unsigned long task_button_missed_deadlines = 0;
unsigned long task_waveform_missed_deadlines = 0;

double task_button_response_time = 0;
double task_waveform_response_time = 0;

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

    BIOS_start();

    return 0;
}

// Button Task
void task0_func() {
    IntMasterEnable();
    while(1) {

        Semaphore_pend(sem_button, BIOS_WAIT_FOREVER);
        uint32_t t1 = Timestamp_get32();
        uint32_t t2 = Timestamp_get32();
        uint32_t overhead = t2 - t1;

#ifdef TIMESTAMP_DEBUG
        Types_FreqHz freq;
        Timestamp_getFreq(&freq);
#endif

        if(task_button_latency == 0) {
            task_button_latency = (Timestamp_get32() - overhead) / TIMESTAMP_CYCLES;
        }

        int start_ticks = Timestamp_get32();

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

        int end_ticks = Timestamp_get32();

        double real_time = (end_ticks - start_ticks - overhead) / TIMESTAMP_CYCLES;

        if(real_time > task_button_response_time) {
            task_button_response_time = real_time;
        }

        if(Semaphore_getCount(sem_button)) {
            task_button_missed_deadlines++;
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

        char str[50];
        GrContextForegroundSet(&sContext, ClrWhite);
        if(!mode) {
            snprintf(str, sizeof(str), "20 kHz 20 dBV");
        }
        else {
            snprintf(str, sizeof(str), "20 us %d mV", mV_div);
        }
        GrStringDraw(&sContext, str, -1, 0, 0, false);

        GrStringDraw(&sContext, mode ? "OSC" : "FFT", -1, 0, 120, false);
        GrFlush(&sContext);
    }
}

// Waveform task
void task3_func() {
    uint32_t i;
    while(1) {
        Semaphore_pend(sem_wave, BIOS_WAIT_FOREVER);

        uint32_t t1 = Timestamp_get32();
        uint32_t t2 = Timestamp_get32();
        uint32_t overhead = t2 - t1;

        uint32_t start = Timestamp_get32();

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

        uint32_t end = Timestamp_get32();
        double real_time = (end - start - overhead) / TIMESTAMP_CYCLES;
        if(real_time > task_waveform_response_time) {
            task_waveform_response_time = real_time;
        }

        if(Semaphore_getCount(sem_wave)) {
            task_waveform_missed_deadlines++;
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

// Clock interrupt
void clock0_int() {
    Semaphore_post(sem_button);
}
