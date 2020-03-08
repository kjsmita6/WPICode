/*
 * buttons.c
 *
 *  Created on: Aug 12, 2012, modified 9/8/2017
 *      Author: Gene Bogdanov
 *
 * ECE 3849 Lab button handling
 */
#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/timer.h"
#include "driverlib/interrupt.h"
#include "driverlib/adc.h"
#include "sysctl_pll.h"
#include "buttons.h"

// public globals
extern volatile uint32_t gButtons = 0; // debounced button state, one per bit in the lowest bits
// button is pressed if its bit is 1, not pressed if 0
uint32_t gJoystick[2] = {0};    // joystick coordinates

void PeripheralInit(void) {
    //    // initialize a general purpose timer for periodic interrupts
    //    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
    //    TimerDisable(TIMER0_BASE, TIMER_BOTH);
    //    TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC);
    //    TimerLoadSet(TIMER0_BASE, TIMER_A, (float)gSystemClock / BUTTON_SCAN_RATE - 0.5f);
    //    TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
    //    TimerEnable(TIMER0_BASE, TIMER_BOTH);
    //
    //    // initialize interrupt controller to respond to timer interrupts
    //    IntPrioritySet(INT_TIMER0A, BUTTON_INT_PRIORITY);
    //    IntEnable(INT_TIMER0A);

    // GPIO PJ0 and PJ1 = EK-TM4C1294XL buttons 1 and 2
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOJ);
    GPIOPinTypeGPIOInput(GPIO_PORTJ_BASE, GPIO_PIN_0 | GPIO_PIN_1);
    GPIOPadConfigSet(GPIO_PORTJ_BASE, GPIO_PIN_0 | GPIO_PIN_1, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);

    // analog input AIN13, at GPIO PD2 = BoosterPack Joystick HOR(X)
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
    GPIOPinTypeADC(GPIO_PORTD_BASE, GPIO_PIN_2);
    // analog input AIN17, at GPIO PK1 = BoosterPack Joystick VER(Y)
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOK);
    GPIOPinTypeADC(GPIO_PORTK_BASE, GPIO_PIN_1);

    // joystick select D4
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
    GPIOPinTypeGPIOInput(GPIO_PORTD_BASE, GPIO_PIN_4);
    GPIOPadConfigSet(GPIO_PORTD_BASE, GPIO_PIN_4, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);

    // BoosterPack button 1 H1
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOH);
    GPIOPinTypeGPIOInput(GPIO_PORTH_BASE, GPIO_PIN_1);
    GPIOPadConfigSet(GPIO_PORTH_BASE, GPIO_PIN_1, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);

    // BoosterPack button 2 K6
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOK);
    GPIOPinTypeGPIOInput(GPIO_PORTK_BASE, GPIO_PIN_6);
    GPIOPadConfigSet(GPIO_PORTK_BASE, GPIO_PIN_6, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);

    // initialize ADC0 peripheral
    SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC0);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC1);

    uint32_t pll_frequency = SysCtlFrequencyGet(CRYSTAL_FREQUENCY);
    uint32_t pll_divisor = (pll_frequency - 1) / (16 * ADC_SAMPLING_RATE) + 1; // round divisor up
//    gADCSamplingRate = pll_frequency / (16 * pll_divisor); // actual sampling rate may differ from ADC_SAMPLING_RATE
    ADCClockConfigSet(ADC0_BASE, ADC_CLOCK_SRC_PLL | ADC_CLOCK_RATE_FULL, pll_divisor); // only ADC0 has PLL clock divisor control

    // initialize ADC sampling sequence
    ADCSequenceDisable(ADC0_BASE, 0);
    ADCSequenceConfigure(ADC0_BASE, 0, ADC_TRIGGER_PROCESSOR, 0);
    ADCSequenceStepConfigure(ADC0_BASE, 0, 0, ADC_CTL_CH13);                             // Joystick HOR(X)
    ADCSequenceStepConfigure(ADC0_BASE, 0, 1, ADC_CTL_CH17 | ADC_CTL_IE | ADC_CTL_END);  // Joystick VER(Y)
    ADCSequenceEnable(ADC0_BASE, 0);

    // ADC1 = AIN3 (oscilloscope)
    ADCSequenceDisable(ADC1_BASE, 0);
    ADCSequenceConfigure(ADC1_BASE, 0, ADC_TRIGGER_ALWAYS, 0);
    ADCSequenceStepConfigure(ADC1_BASE, 0, 0, ADC_CTL_CH3 | ADC_CTL_IE | ADC_CTL_END);
    ADCSequenceEnable(ADC1_BASE, 0);
    ADCIntEnable(ADC1_BASE, 0);
//    IntPrioritySet(INT_ADC1SS0, 0);
//    IntEnable(INT_ADC1SS0);
    //
    //    // CPU load timer
    //    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER3);
    //    TimerDisable(TIMER3_BASE, TIMER_BOTH);
    //    TimerConfigure(TIMER3_BASE, TIMER_CFG_ONE_SHOT);
    //    TimerLoadSet(TIMER3_BASE, TIMER_A, gSystemClock/100 - 1);
    //
    //    // time div timer
    //    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER1);
    //    TimerDisable(TIMER1_BASE, TIMER_BOTH);
    //    TimerConfigure(TIMER1_BASE, TIMER_CFG_PERIODIC);
    //    TimerIntEnable(TIMER1_BASE, TIMER_TIMA_TIMEOUT);
    //    TimerEnable(TIMER1_BASE, TIMER_BOTH);
    //
    //    IntPrioritySet(INT_TIMER1A, 1);
}

// update the debounced button state gButtons
void ButtonDebounce(uint32_t buttons)
{
    int32_t i, mask;
    static int32_t state[BUTTON_COUNT]; // button state: 0 = released
    // BUTTON_PRESSED_STATE = pressed
    // in between = previous state
    for (i = 0; i < BUTTON_COUNT; i++) {
        mask = 1 << i;
        if (buttons & mask) {
            state[i] += BUTTON_STATE_INCREMENT;
            if (state[i] >= BUTTON_PRESSED_STATE) {
                state[i] = BUTTON_PRESSED_STATE;
                gButtons |= mask; // update debounced button state
            }
        }
        else {
            state[i] -= BUTTON_STATE_DECREMENT;
            if (state[i] <= 0) {
                state[i] = 0;
                gButtons &= ~mask;
            }
        }
    }
}

// sample joystick and convert to button presses
void ButtonReadJoystick(void)
{
    ADCProcessorTrigger(ADC0_BASE, 0);          // trigger the ADC sample sequence for Joystick X and Y
    while(!ADCIntStatus(ADC0_BASE, 0, false));  // wait until the sample sequence has completed
    ADCSequenceDataGet(ADC0_BASE, 0, gJoystick);// retrieve joystick data
    ADCIntClear(ADC0_BASE, 0);                  // clear ADC sequence interrupt flag

    // process joystick movements as button presses using hysteresis
    if (gJoystick[0] > JOYSTICK_UPPER_PRESS_THRESHOLD) gButtons |= 1 << 5; // joystick right in position 5
    if (gJoystick[0] < JOYSTICK_UPPER_RELEASE_THRESHOLD) gButtons &= ~(1 << 5);

    if (gJoystick[0] < JOYSTICK_LOWER_PRESS_THRESHOLD) gButtons |= 1 << 6; // joystick left in position 6
    if (gJoystick[0] > JOYSTICK_LOWER_RELEASE_THRESHOLD) gButtons &= ~(1 << 6);

    if (gJoystick[1] > JOYSTICK_UPPER_PRESS_THRESHOLD) gButtons |= 1 << 7; // joystick up in position 7
    if (gJoystick[1] < JOYSTICK_UPPER_RELEASE_THRESHOLD) gButtons &= ~(1 << 7);

    if (gJoystick[1] < JOYSTICK_LOWER_PRESS_THRESHOLD) gButtons |= 1 << 8; // joystick down in position 8
    if (gJoystick[1] > JOYSTICK_LOWER_RELEASE_THRESHOLD) gButtons &= ~(1 << 8);
}

// autorepeat button presses if a button is held long enough
uint32_t ButtonAutoRepeat(void)
{
    static int count[BUTTON_AND_JOYSTICK_COUNT] = {0}; // autorepeat counts
    int i;
    uint32_t mask;
    uint32_t presses = 0;
    for (i = 0; i < BUTTON_AND_JOYSTICK_COUNT; i++) {
        mask = 1 << i;
        if (gButtons & mask)
            count[i]++;     // increment count if button is held
        else
            count[i] = 0;   // reset count if button is let go
        if (count[i] >= BUTTON_AUTOREPEAT_INITIAL &&
                (count[i] - BUTTON_AUTOREPEAT_INITIAL) % BUTTON_AUTOREPEAT_NEXT == 0)
            presses |= mask;    // register a button press due to auto-repeat
    }
    return presses;
}

// ISR for scanning and debouncing buttons
void ButtonISR(void) {
    TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT); // clear interrupt flag

    // read hardware button state
    uint32_t gpio_buttons =
            ~GPIOPinRead(GPIO_PORTJ_BASE, 0xff) & (GPIO_PIN_1 | GPIO_PIN_0); // EK-TM4C1294XL buttons in positions 0 and 1

    gpio_buttons |= ~GPIOPinRead(GPIO_PORTD_BASE, 0xff) & GPIO_PIN_4; // Joystick
    gpio_buttons |= (~GPIOPinRead(GPIO_PORTH_BASE, 0xff) << 1) & GPIO_PIN_2;
    gpio_buttons |= (~GPIOPinRead(GPIO_PORTK_BASE, 0xff) >> 3) & GPIO_PIN_3;

    uint32_t old_buttons = gButtons;    // save previous button state
    ButtonDebounce(gpio_buttons);       // Run the button debouncer. The result is in gButtons.
    ButtonReadJoystick();               // Convert joystick state to button presses. The result is in gButtons.
    uint32_t presses = ~old_buttons & gButtons;   // detect button presses (transitions from not pressed to pressed)
    presses |= ButtonAutoRepeat();      // autorepeat presses if a button is held long enough

    //    static bool tic = false;
    //    static bool running = true;

    /*
    if (presses & 0x1) { // EK-TM4C1294XL button 1 pressed
        running = !running;
    }
    if(presses & 0x2) {
        gTime = 0;
    }
     */
    //    if (running) {
    //        if (tic) gTime++; // increment time every other ISR call
    //        tic = !tic;
    //    }

    int i;
    for(i = 0; i < 32; i++) {
        if(presses & 1 << i) {
            stack_write(&gBtnStack, &i, 1);
        }
    }
}
//
//void stack_init(struct stack_t *s, char *buf, int size) {
//    s->buf = buf;
//    s->head = 0;
//    s->tail = 0;
//    s->size = size;
//}
//
//int stack_read(struct stack_t *s, void *buf, int bytes) {
//    int i;
//    char *p = buf;
//    for(i = 0; i < bytes; i++) {
//        if(s->tail != s->head) {
//            *p++ = s->buf[s->tail++];
//            if(s->tail == s->size) {
//                s->tail = 0;
//            }
//        }
//        else {
//            return i;
//        }
//    }
//    return bytes;
//}
//
//int stack_write(struct stack_t *s, void *buf, int bytes) {
//    int i;
//    char *p = buf;
//    for(i = 0; i < bytes; i++) {
//        if(s->head + 1 == s->tail || (s->head + 1 == s->size && s->tail == 0)) {
//            return i;
//        }
//        else {
//            s->buf[s->head++] = *p++;
//            if(s->head == s->size) {
//                s->head = 0;
//            }
//        }
//    }
//    return bytes;
//}
