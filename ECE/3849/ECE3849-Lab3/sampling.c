#include <sysctl_pll.h>
#include <driverlib/adc.h>
#include <driverlib/sysctl.h>
#include <inc/tm4c1294ncpdt.h>
#include <driverlib/gpio.h>
#include <driverlib/interrupt.h>
#include <driverlib/timer.h>
#include <buttons.h>
#include <inc/hw_memmap.h>
#include <inc/hw_ints.h>
#include "sampling.h"
#include <math.h>
#include <ti/sysbios/gates/GateTask.h>
#include <driverlib/udma.h>

#define ADC_BUFFER_SIZE 2048

extern volatile int gADCBufferIndex;
extern volatile uint16_t gADCBuffer[ADC_BUFFER_SIZE - 1];
extern volatile bool gRising;

static float vScale = 0;
GateTask_Handle gateTask;
extern volatile bool gDMAPrimary;

/*
void setupADC(void) {
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);
    GPIOPinTypeADC(GPIO_PORTE_BASE, GPIO_PIN_0);          // GPIO setup for analog input AIN3

    SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC0); // initialize ADC peripherals
    SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC1);
    // ADC clock
    uint32_t pll_frequency = SysCtlFrequencyGet(CRYSTAL_FREQUENCY);
    uint32_t pll_divisor = (pll_frequency - 1) / (16 * ADC_SAMPLING_RATE) + 1; //round up
    ADCClockConfigSet(ADC0_BASE, ADC_CLOCK_SRC_PLL | ADC_CLOCK_RATE_FULL, pll_divisor);
    ADCClockConfigSet(ADC1_BASE, ADC_CLOCK_SRC_PLL | ADC_CLOCK_RATE_FULL, pll_divisor);
    ADCSequenceDisable(ADC1_BASE, 0);      // choose ADC1 sequence 0; disable before configuring
    ADCSequenceConfigure(ADC1_BASE, 0, ADC_TRIGGER_ALWAYS, 0);    // specify the "Always" trigger
    ADCSequenceStepConfigure(ADC1_BASE, 0, 0, ADC_CTL_IE | ADC_CTL_END | ADC_CTL_CH3);// in the 0th step, sample channel 3 (AIN3)
                                  // enable interrupt, and make it the end of sequence
    ADCSequenceEnable(ADC1_BASE, 0);       // enable the sequence.  it is now sampling
    ADCIntEnable(ADC1_BASE, 0);            // enable sequence 0 interrupt in the ADC1 peripheral
    IntPrioritySet(INT_ADC1SS0, 0);          // set ADC1 sequence 0 interrupt priority
    IntEnable(INT_ADC1SS0);               // enable ADC1 sequence 0 interrupt in int. controller

    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER1);
    TimerDisable(TIMER1_BASE, TIMER_BOTH);
    TimerConfigure(TIMER1_BASE, TIMER_CFG_PERIODIC);
    TimerIntEnable(TIMER1_BASE, TIMER_TIMA_TIMEOUT);
    TimerEnable(TIMER1_BASE, TIMER_BOTH);

    IntPrioritySet(INT_TIMER1A, 1);
}
*/
//
//void ADC_ISR(void)
//{
//    ADC1_ISC_R = ADC_ISC_IN0; // clear ADC1 sequence0 interrupt flag in the ADCISC register
//    if (ADC1_OSTAT_R & ADC_OSTAT_OV0) { // check for ADC FIFO overflow
//        gADCErrors++;                   // count errors
//        ADC1_OSTAT_R = ADC_OSTAT_OV0;   // clear overflow condition
//    }
//    gADCBuffer[
//               getADCBufferIndex() = ADC_BUFFER_WRAP(getADCBufferIndex() + 1)
//               ] = ADC1_SSFIFO0_R;               // read sample from the ADC1 sequence 0 FIFO
//}

//void ADC_TRIGGER_ISR(void) {
//    TimerIntClear(TIMER1_BASE, TIMER_TIMA_TIMEOUT);
//    ADCProcessorTrigger(ADC1_BASE, 0);
//}

//int32_t getADCBufferIndex(void)
//{
//    int32_t index;
//    IArg key = GateTask_enter(gateTask);
//    if (gDMAPrimary) {  // DMA is currently in the primary channel
//        index = ADC_BUFFER_SIZE/2 - 1 -
//                uDMAChannelSizeGet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT);
//    }
//    else {              // DMA is currently in the alternate channel
//        index = ADC_BUFFER_SIZE - 1 -
//                uDMAChannelSizeGet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT);
//    }
//    GateTask_leave(gateTask, key);
//    return index;
//}

int findTrigger(uint32_t us_div, uint32_t mV_div, bool rising) {
    int value = 2050;
    int i;
    int tolerance = (mV_div / 20) * 7/4;

    for(i = 64; i < ADC_BUFFER_SIZE / 2; i++) {
        int index = ADC_BUFFER_WRAP(gADCBufferIndex - i);
        if(gADCBuffer[index] > (value - tolerance) && gADCBuffer[index] < (value + tolerance)) {
            if((rising && (gADCBuffer[index - 3] < gADCBuffer[index + 3])) || (!gRising && (gADCBuffer[index - 3] > gADCBuffer[index + 3]))) {
                return index;
            }
        }
    }
    return -1;
}

int scale_voltage(uint16_t sample, uint32_t mV_div) {
    static uint32_t old = 0;
    if(old != mV_div) {
        vScale = ((float)3300 * 20) / ((1 << 12) * mV_div);
        old = mV_div;
    }
    return 64 - (int)roundf(vScale * ((int)sample - 2050));
}
