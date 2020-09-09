/************** ECE2049 DEMO CODE ******************/
/**************  13 March 2019   ******************/
/***************************************************/

#include <msp430.h>

/* Peripherals.c and .h are where the functions that implement
 * the LEDs and keypad, etc are. It is often useful to organize
 * your code by putting like functions together in files.
 * You include the header associated with that file(s)
 * into the main file of your project. */
#include "peripherals.h"
#include <stdlib.h>
#include <time.h>

// Function Prototypes
void swDelay(char numLoops);
void clock_on();
void clock_off();

// Declare globals here
unsigned long int timer_cnt;
unsigned long int leap_cnt;
unsigned long int timer_on;

struct note {
    int pitch;      // frequency in hertz
    int duration;   // duration in milliseconds
    char led;       // which led is lit
    char button;
};

enum Leds {
    First = BIT0,
    Second = BIT6,
    Third = BIT2,
    Fourth = BIT4,
    None = BIT1
};

enum notes {
    Rest = 32768,
    C4 = 261,
    Cs4 = 277,
    D4 = 293,
    Eb4 = 311,
    E4 = 330,
    F4 = 349,
    Fs4 = 370,
    G4 = 392,
    Gs4 = 415,
    A4 = 440,
    Bb = 466,
    B5 = 494,
    C5 = 523,
    Cs5 = 554,
    D5 = 587,
    Eb5 = 622,
    E5 = 659,
    F5 = 698,
    Fs5 = 740,
    G5 = 784,
    Ab5 = 831,
    A6 = 880
};

enum buttons {
    FirstB = BIT0,
    SecondB = BIT6,
    ThirdB = BIT2,
    FourthB = BIT4,
    NoneB = BIT1
};

void configure_buttons() {
    P7SEL &= ~(BIT0 | BIT4);
    P3SEL &= ~BIT6;
    P2SEL &= ~BIT2;

    P7DIR |= ~(BIT0 | BIT4);
    P3DIR |= ~BIT6;
    P2DIR |= ~BIT2;

    P7REN |= BIT0 | BIT4;
    P3REN |= BIT6;
    P2REN |= BIT2;

    P7OUT |= BIT0 | BIT4;
    P3OUT |= BIT6;
    P2OUT |= BIT2;
}

unsigned char button_state() {
    unsigned char state = 0;

    if(!(P7IN & BIT0)) {
        state |= BIT0;
    }
    if(!(P3IN & BIT6)) {
        state |= BIT6;
    }
    if(!(P2IN & BIT2)) {
        state |= BIT2;
    }
    if(!(P7IN & BIT4)) {
        state |= BIT4;
    }

    P7IN &= ~BIT0;
    P7IN &= ~BIT4;
    P2IN &= ~BIT2;
    P3IN &= ~BIT6;
    /*
    char S1 = ~P7IN & BIT0;
    char S2 = ~P3IN & BIT6;
    char S3 = ~P2IN & BIT2;
    char S4 = ~P7IN & BIT4;

    return S1 | S2 | S3 | S4;*/
    return state;
}

void configUserLED(unsigned char in) {
    P1SEL &= ~BIT0;
    P1DIR |= BIT0;

    P4SEL &= ~BIT7;
    P4DIR |= BIT7;

    P1OUT &= ~BIT0;
    P4OUT &= ~BIT7;

    if(in == BIT0) {
        P1OUT |= BIT0;
    }
    if(in == BIT1) {
        P4OUT |= BIT7;
    }
    if(in == BIT0 | BIT1) {
        P1OUT |= BIT0;
        P4OUT |= BIT7;
    }
    if(in == 0) {
        P1OUT &= ~BIT0;
        P4OUT &= ~BIT7;
    }
}

// Main
void main(void)


{
    srand(time(NULL));
    timer_cnt = 0;
    leap_cnt = 0;
    timer_on = 0;
    int song_length = 3;
    struct note song[] = { { .duration = 150, .pitch = Fs4, .led = First, .button = FirstB },   { .duration = 100, .pitch = B5, .led = Second, .button = SecondB },     { .duration = 50, .pitch = B5, .led = Second, .button = SecondB },
                           { .duration = 250, .pitch = B5, .led = Second, .button = SecondB },  { .duration = 50, .pitch = Rest, .led = None, .button = NoneB },        { .duration = 50, .pitch = B5, .led = Second, .button = SecondB },
                           { .duration = 50, .pitch = Cs5 , .led = Third, .button = ThirdB },
                           { .duration = 50, .pitch = Eb5, .led = Fourth, .button = FourthB },  { .duration = 100, .pitch = Eb5, .led = Fourth, .button = FourthB },    { .duration = 50, .pitch = Gs4, .led = First, .button = FirstB },
                           { .duration = 200, .pitch = Gs4, .led = First, .button = FirstB },   { .duration = 50, .pitch = Gs4, .led = First, .button = FirstB },       { .duration = 50, .pitch = Bb, .led = Second, .button = SecondB },
                           { .duration = 50, .pitch = B5, .led = Third, .button = ThirdB },     { .duration = 100, .pitch = B5, .led = Third, .button = ThirdB },       { .duration = 50, .pitch = Fs4, .led = First, .button = FirstB },
                           { .duration = 150, .pitch = Fs4, .led = First, .button = FirstB },   { .duration = 150, .pitch = Fs4, .led = First, .button = FirstB },      { .duration = 50, .pitch = A4, .led = Fourth, .button = FourthB },
                           { .duration = 50, .pitch = Gs4, .led = Third, .button = ThirdB },    { .duration = 50, .pitch = Fs4, .led = Second, .button = SecondB },     { .duration = 300, .pitch = E4, .led = First, .button = FirstB } };
    WDTCTL = WDTPW | WDTHOLD;    // Stop watchdog timer. Always need to stop this!!
    _BIS_SR(GIE); // enable interrupts

    initLeds();
    configDisplay();
    configKeypad();

    // *** Intro Screen ***
    Graphics_clearDisplay(&g_sContext); // Clear the display

    Graphics_drawStringCentered(&g_sContext, "MSP430 Hero", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
    Graphics_drawStringCentered(&g_sContext, "Press *", AUTO_STRING_LENGTH, 48, 45, TRANSPARENT_TEXT);
    Graphics_drawStringCentered(&g_sContext, "to start", AUTO_STRING_LENGTH, 48, 55, TRANSPARENT_TEXT);
    // Draw a box around everything because it looks nice
    Graphics_Rectangle box = {.xMin = 5, .xMax = 91, .yMin = 5, .yMax = 91 };
    Graphics_drawRectangle(&g_sContext, &box);
    Graphics_flushBuffer(&g_sContext);

    clock_on();
    int state = 0;
    unsigned char state1 = 0;
    unsigned char state2 = 0;
    int errors = 0;

    while(1) {
        switch(state) {
        case 0:
            // Menu
            //Graphics_clearDisplay(&g_sContext); // Clear the display

            setLeds(None);
            // Write some text to the display
            Graphics_drawStringCentered(&g_sContext, "MSP430 Hero", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
            Graphics_drawStringCentered(&g_sContext, "Press *", AUTO_STRING_LENGTH, 48, 45, TRANSPARENT_TEXT);
            Graphics_drawStringCentered(&g_sContext, "to start", AUTO_STRING_LENGTH, 48, 55, TRANSPARENT_TEXT);
            // Draw a box around everything because it looks nice
            Graphics_Rectangle box = {.xMin = 5, .xMax = 91, .yMin = 5, .yMax = 91 };
            Graphics_drawRectangle(&g_sContext, &box);
            Graphics_flushBuffer(&g_sContext);
            state1 = getKey();
            if(state1 == '*') {
                state = 1;
            }
            break;
        case 1:
            // Game
            Graphics_clearDisplay(&g_sContext); // Clear the display
            timer_on = timer_cnt;
            configUserLED(0);
            while (timer_cnt < (timer_on + 200)) {
                Graphics_drawStringCentered(&g_sContext, "3", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
                configUserLED(3);
                Graphics_flushBuffer(&g_sContext);
            }

            Graphics_clearDisplay(&g_sContext); // Clear the display
            timer_on = timer_cnt;
            configUserLED(0);
            while (timer_cnt < (timer_on + 200)) {

                Graphics_drawStringCentered(&g_sContext, "2", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
                configUserLED(2);
                Graphics_flushBuffer(&g_sContext);
            }

            Graphics_clearDisplay(&g_sContext); // Clear the display
            timer_on = timer_cnt;
            configUserLED(0);
            while (timer_cnt < (timer_on + 200)) {

                Graphics_drawStringCentered(&g_sContext, "1", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
                configUserLED(1);
                Graphics_flushBuffer(&g_sContext);
            }

            Graphics_clearDisplay(&g_sContext); // Clear the display
            timer_on = timer_cnt;
            configUserLED(0);
            while (timer_cnt < (timer_on + 200)) {

                Graphics_drawStringCentered(&g_sContext, "GO", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
                Graphics_flushBuffer(&g_sContext);
            }

            /*
            int i;
            clock_on();
            for(i = 0; i < 11; i++) {
                BuzzerOn(song[i].pitch);
                setLeds(song[i].led);
                TA2CCR0 = 32768 * (song[i].duration / 1000.0);
                swDelay(1);
            }
            setLeds(None);
            BuzzerOff();*/
            int i = 0;

            char *buttons = (char *)malloc(song_length * sizeof(char));
            for(i = 0; i < song_length; i++) {
                char currKey = getKey();
                char button = 0;
                if(currKey == '#') {
                    state = 0;
                    break;
                }
                timer_on = timer_cnt;
                while(timer_cnt < (timer_on + song[i].duration)) {
                    BuzzerOn(song[i].pitch);
                    setLeds(song[i].led);
                }
                button = button_state();
                if(button) {
                    configUserLED(BIT0 | BIT1);
                    buttons[i] = button;
                }
                else {
                    buttons[i] = NoneB;
                }

                configUserLED(0);
                if(button != song[i].button) {
                    errors++;
                    //BuzzerOn(song[i].pitch + song[i].pitch * rand());
                }
                BuzzerOff();
                button = 0;
                setLeds(None);
                timer_on = timer_cnt;
                while(timer_cnt < timer_on + 50);
                configUserLED(0);
            }

            if(state == 0) {
                Graphics_clearDisplay(&g_sContext);
                break;
            }
            /*
            for(i = 0; i < song_length; i++) {
                if(buttons[i] != song[i].button) {
                    errors++;
                }
            }
*/
            if(errors >= 2) {
                state = 2;
            }
            else {
                state = 3;
            }
            break;
        case 2:
            Graphics_clearDisplay(&g_sContext); // Clear the display
            Graphics_drawStringCentered(&g_sContext, "You Lose!!!!! >:(", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
            setLeds(errors);
            BuzzerOff();
            Graphics_flushBuffer(&g_sContext);
            swDelay(3);
            state = 0;
            errors = 0;
            Graphics_clearDisplay(&g_sContext); // Clear the display
            break;
        case 3:
            // Wi
            Graphics_clearDisplay(&g_sContext); // Clear the display
            Graphics_drawStringCentered(&g_sContext, "You Win!!!!! :D", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
            Graphics_flushBuffer(&g_sContext);
            BuzzerOff();
            swDelay(3);
            state = 0;
            errors = 0;
            Graphics_clearDisplay(&g_sContext); // Clear the display
            break;
        }
        /*
        BuzzerOff();
        if(state & (~P7IN & BIT0)) {
            configUserLED(BIT0);
        }
        if(state & (~P3IN & BIT6)) {
            configUserLED(BIT1);
        }
        if(state & (~P2IN & BIT2)) {
            configUserLED(BIT0 | BIT1);
        }*/
        /*
        if(state1 & (~P7IN & BIT4)) {
            int i;
            clock_on();
            for(i = 0; i < 11; i++) {
                BuzzerOn(song[i].pitch);
                setLeds(song[i].led);
                TA2CCR0 = 32768 * (song[i].duration / 1000.0);
                swDelay(1);
            }
            setLeds(None);
            BuzzerOff();
        }*/
    }
}


void swDelay(char numLoops)
{
    // This function is a software delay. It performs
    // useless loops to waste a bit of time
    //
    // Input: numLoops = number of delay loops to execute
    // Output: none
    //
    // smj, ECE2049, 25 Aug 2013

    volatile unsigned int i,j;  // volatile to prevent removal in optimization
    // by compiler. Functionally this is useless code

    for (j=0; j<numLoops; j++)
    {
        i = 50000 ;                 // SW Delay
        while (i > 0)               // could also have used while (i)
            i--;
    }
}

void clock_on() {
    TA2CTL = TASSEL_1 + ID_0 + MC_1;
    TA2CCR0 = 163; // 163
    TA2CCTL0 = CCIE;
}

void clock_off() {
    TA2CTL = MC_0;
    TA2CCTL0 &= ~CCIE;
}

#pragma vector=TIMER2_A0_VECTOR
__interrupt void TimerA2_ISR(void) {
    if(leap_cnt < 1024) {
        timer_cnt++;
        leap_cnt++;
    }
    else {
        timer_cnt += 2;
        leap_cnt = 0;
    }
}
