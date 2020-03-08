#include <stdint.h>
#include <stdbool.h>
#include "driverlib/fpu.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/adc.h"
#include "driverlib/timer.h"
#include "Crystalfontz128x128_ST7735.h"
#include "buttons.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "sampling.h"
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"

uint32_t gSystemClock; // [Hz] system clock frequency
volatile uint32_t gTime = 8345; // time in hundredths of a second

const uint32_t mV_divs[] = { 1000, 500, 200, 100 }; // 4 disivions
const uint32_t us_divs[] = { 100000, 50000, 20000, 10000, 5000, 1000, 500, 100, 50, 20 }; // 10 divisions

uint32_t cpu_load(void) {
    uint32_t i = 0;
    TimerIntClear(TIMER3_BASE, TIMER_TIMA_TIMEOUT);
    TimerEnable(TIMER3_BASE, TIMER_A);
    while(!(TimerIntStatus(TIMER3_BASE, false) & TIMER_TIMA_TIMEOUT)) {
        i++;
    }
    return i;
}

int main(void)
{
    IntMasterDisable();

    // Enable the Floating Point Unit, and permit ISRs to use it
    FPUEnable();
    FPULazyStackingEnable();

    // Initialize the system clock to 120 MHz
    gSystemClock = SysCtlClockFreqSet(SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_480, 120000000);

    Crystalfontz128x128_Init(); // Initialize the LCD display driver
    Crystalfontz128x128_SetOrientation(LCD_ORIENTATION_UP); // set screen orientation

    tContext sContext;
    GrContextInit(&sContext, &g_sCrystalfontz128x128); // Initialize the grlib graphics context
    GrContextFontSet(&sContext, &g_sFontFixed6x8); // select font

    tRectangle rectFullScreen = {0, 0, GrContextDpyWidthGet(&sContext)-1, GrContextDpyHeightGet(&sContext)-1};

    //setupADC();
    //ButtonInit();
    PeripheralInit();
    uint32_t initial_cpu_load = cpu_load();


    IntMasterEnable();


    int us_div_index = 9;
    int mV_div_index = 0;
    bool rising = true;
    int default_index = 64;
    int i;
    char str[50];

    while (true) {
        uint32_t us_div = us_divs[us_div_index];
        uint32_t mV_div = mV_divs[mV_div_index];


        int button = 0;
        while(stack_read(&gBtnStack, &button, 1) > 0) {
            switch(button) {
            case 4:
                rising = !rising;
                break;
            case 5:
                us_div_index = us_div_index >= 9 ? 9 : us_div_index + 1;
                ADCSequenceConfigure(ADC1_BASE, 0, us_div_index == 9 ? ADC_TRIGGER_ALWAYS : ADC_TRIGGER_PROCESSOR, 0);
                TimerLoadSet(TIMER1_BASE, TIMER_A, gSystemClock / (1000000 / us_divs[us_div_index]) - 1);
                if(us_div_index < 9) {
                    IntEnable(INT_TIMER1A);
                }
                else {
                    IntDisable(INT_TIMER1A);
                }
                break;
            case 6:
                us_div_index = us_div_index <= 0 ? 0 : us_div_index - 1;
                ADCSequenceConfigure(ADC1_BASE, 0, us_div_index == 9 ? ADC_TRIGGER_ALWAYS : ADC_TRIGGER_PROCESSOR, 0);
                TimerLoadSet(TIMER1_BASE, TIMER_A, gSystemClock / (1000000 / us_divs[us_div_index]) - 1);
                if(us_div_index < 9) {
                    IntEnable(INT_TIMER1A);
                }
                else {
                    IntDisable(INT_TIMER1A);
                }
                break;
            case 7:
                mV_div_index = mV_div_index >= 3 ? 3 : mV_div_index + 1;
                break;
            case 8:
                mV_div_index = mV_div_index <= 0 ? 0 : mV_div_index - 1;
                break;
            default:
                break;
            }
        }


        uint32_t cpu_load_curr_func = cpu_load();
        float cpu_load_curr = 1.0 - (float)cpu_load_curr_func / initial_cpu_load;

        GrContextForegroundSet(&sContext, ClrBlack);
        GrRectFill(&sContext, &rectFullScreen); // fill screen with black

        int index = findTrigger(us_div, mV_div, rising);
        if(index != -1) {
            default_index = index;
        }
        GrContextForegroundSet(&sContext, ClrBlue);
        for(i = -3; i <= 3; i++) {
            GrLineDrawV(&sContext, 64 + i * 20, 0, 128);
        }
        for(i = -3; i <= 3; i++) {
            GrLineDrawH(&sContext, 0, 128, 64 + i * 20);
        }

        GrContextForegroundSet(&sContext, ClrYellow);
        for(i = -64; i < 64; i++) {
            GrLineDraw(&sContext, 64 + i, scale_voltage(gADCBuffer[default_index + i], mV_div), 65 + i, scale_voltage(gADCBuffer[default_index + i + 1], mV_div));
        }

        GrContextForegroundSet(&sContext, index != -1 ? ClrWhite : ClrRed);
        GrStringDraw(&sContext, rising ? "UP" : "DOWN", -1, 90, 0, false);

        GrContextForegroundSet(&sContext, ClrWhite);
        snprintf(str, sizeof(str), "%d %cs %d mV", us_div < 1000 ? us_div : us_div / 1000, us_div < 1000 ? 'u' : 'm', mV_div);
        GrStringDraw(&sContext, str, -1, 0, 0, false);

        snprintf(str, sizeof(str), "CPU Load: %.1f%%", cpu_load_curr * 100.0);
        GrStringDraw(&sContext, str, -1, 0, 120, false);

        GrFlush(&sContext); // flush the frame buffer to the LCD
    }
}

