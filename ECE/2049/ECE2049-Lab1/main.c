/************** ECE2049 DEMO CODE ******************/
/**************  20 March 2019   ******************/
/***************************************************/

#include <msp430.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
/* Peripherals.c and .h are where the functions that implement
 * the LEDs and keypad, etc are. It is often useful to organize
 * your code by putting like functions together in files.
 * You include the header associated with that file(s)
 * into the main file of your project. */
#include "peripherals.h"

void playSequence(int length, int *num);
int checkInput(int length, int playSeq[], int numSeq[]);
void gameOver(void);
void countdown(void);
int *generateSequence(int length);

int main(void)
{
    srand(time(NULL));
    WDTCTL = WDTPW | WDTHOLD;
    initLeds();
    configDisplay();
    configKeypad();

    Graphics_clearDisplay(&g_sContext); // Clear the display

    // Write some text to the display
    // Graphics_drawStringCentered(&g_sContext, "SIMON", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
    Graphics_Rectangle box = {.xMin = 5, .xMax = 91, .yMin = 5, .yMax = 91 };
    Graphics_drawRectangle(&g_sContext, &box);
    Graphics_flushBuffer(&g_sContext);

    int *numberSequence = (int *)malloc(32 * sizeof(int));
    int *gameSequence = (int *)malloc(32 * sizeof(int));
    unsigned char currKey = 0;
    int state = 0;
    int gameLost = 1;
    int numLeds = 4;
    int acc = 0;
    int restart = 0;
    while(1)
    {
        switch (state)
        {
        case 0: // Display welcome screen
            BuzzerOff();
            Graphics_drawRectangle(&g_sContext, &box);
            Graphics_drawStringCentered(&g_sContext, "SIMON", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
            Graphics_flushBuffer(&g_sContext);
            currKey = getKey();
            if(currKey == '*')
            {
                countdown();
                state = 1;
            }
            break;
        case 1: // Play Sequence
            gameSequence = generateSequence(numLeds);
            Graphics_clearDisplay(&g_sContext); // Clear the display
            Graphics_drawStringCentered(&g_sContext, "WAIT", AUTO_STRING_LENGTH, 48, 45, TRANSPARENT_TEXT);
            Graphics_drawRectangle(&g_sContext, &box);
            Graphics_flushBuffer(&g_sContext);
            playSequence(numLeds, gameSequence);
            state = 2;
            break;
        case 2: // Check Player Input
            Graphics_clearDisplay(&g_sContext); // Clear the display
            Graphics_drawStringCentered(&g_sContext, "GO", AUTO_STRING_LENGTH, 48, 45, TRANSPARENT_TEXT);
            Graphics_drawRectangle(&g_sContext, &box);
            Graphics_flushBuffer(&g_sContext);
            while(acc < numLeds) {
                //swDelay(4);
                currKey = getKey();
                if(currKey) {
                    Graphics_clearDisplay(&g_sContext);
                    Graphics_drawStringCentered(&g_sContext, "GO", AUTO_STRING_LENGTH, 48, 45, TRANSPARENT_TEXT);
                    Graphics_drawRectangle(&g_sContext, &box);
                    Graphics_flushBuffer(&g_sContext);
                    switch(currKey) {
                    case '1':
                        Graphics_drawStringCentered(&g_sContext, "1", AUTO_STRING_LENGTH, 15, 60, TRANSPARENT_TEXT);
                        Graphics_drawRectangle(&g_sContext, &box);
                        break;
                    case '2':
                        Graphics_drawStringCentered(&g_sContext, "2", AUTO_STRING_LENGTH, 30, 60, TRANSPARENT_TEXT);
                        Graphics_drawRectangle(&g_sContext, &box);
                        break;
                    case '3':
                        Graphics_drawStringCentered(&g_sContext, "3", AUTO_STRING_LENGTH, 45, 60, TRANSPARENT_TEXT);
                        Graphics_drawRectangle(&g_sContext, &box);
                        break;
                    case '4':
                        Graphics_drawStringCentered(&g_sContext, "4", AUTO_STRING_LENGTH, 60, 60, TRANSPARENT_TEXT);
                        Graphics_drawRectangle(&g_sContext, &box);
                        break;
                    case '#':
                        numLeds = 4;
                        state = 0;
                        restart = 1;
                        Graphics_clearDisplay(&g_sContext); // Clear the display
                        break;
                    default:
                        Graphics_drawStringCentered(&g_sContext, "ERROR", AUTO_STRING_LENGTH, 45, 60, TRANSPARENT_TEXT);
                        Graphics_drawRectangle(&g_sContext, &box);
                        swDelay(4);
                        state = 0;
                        gameLost = 1;
                        numLeds = 4;
                        acc = 0;
                        break;
                    }
                    if(restart) {
                        break;
                    }
                    Graphics_flushBuffer(&g_sContext);

                    numberSequence[acc] = currKey - 0x30;
                    //gameLost = checkInput(acc, gameSequence, numberSequence);
                    acc++;

                }
                swDelay(1);
            }
            if(restart) {
                break;
            }
            gameLost = checkInput(numLeds, gameSequence, numberSequence);
            if(gameLost == 0)
            {
                numLeds++;
                Graphics_clearDisplay(&g_sContext); // Clear the display
                Graphics_drawStringCentered(&g_sContext, "YOU WIN!!! :D", AUTO_STRING_LENGTH, 48, 45, TRANSPARENT_TEXT);
                Graphics_drawStringCentered(&g_sContext, "Next Round", AUTO_STRING_LENGTH, 48, 60, TRANSPARENT_TEXT);
                Graphics_drawRectangle(&g_sContext, &box);
                Graphics_flushBuffer(&g_sContext);
                swDelay(4);
                Graphics_clearDisplay(&g_sContext);
                countdown();
                acc = 0;
                state = 1;
            }
            else {
                state = 3;
            }
            break;
        case 3:
            gameOver();
            swDelay(4);
            state = 0;
            gameLost = 0;
            numLeds = 4;
            acc = 0;
            break;
        }
    }
    return EXIT_SUCCESS;
}

int *generateSequence(int length) {
    int bits[4];
    bits[0] = BIT4;
    bits[1] = BIT3;
    bits[2] = BIT2;
    bits[3] = BIT1;

    int *leds = (int *)malloc(length * sizeof(int));

    int i;
    for(i = 0; i < length; i++) {
        leds[i] = bits[rand() % 3];
    }
    return leds;
}

void playSequence(int length, int *sequence) {
    int i;
    for(i = 0; i < length; i++) {
        P6OUT |= sequence[i];
        swDelay(1);
        initLeds();
        swDelay(1);
    }
}

int checkInput(int length, int playSeq[], int numSeq[])
{
    //Get player input and store in int array
    //Go through numSeq comparing it with the player sequence
    int lost = 0;
    int i;
    for(i = 0; i < length; i++) {
        if(playSeq[i] == 4) {
            playSeq[i] = 1;
        }
        else if(playSeq[i] == 2) {
            playSeq[i] = 2;
        }
        else if(playSeq[i] == 8) {
            playSeq[i] = 3;
        }
        else if(playSeq[i] == 16) {
            playSeq[i] = 4;
        }
        if(playSeq[i] != numSeq[i]) {
            lost = 1;
            break;
        }
    }
    return lost;

    //If any two don't match up then set int bool to false
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

void gameOver(void) {
    Graphics_Rectangle box = {.xMin = 5, .xMax = 91, .yMin = 5, .yMax = 91 };
    Graphics_clearDisplay(&g_sContext); // Clear the display
    Graphics_drawStringCentered(&g_sContext, "You lose >:(", AUTO_STRING_LENGTH, 48, 45, TRANSPARENT_TEXT);
    Graphics_drawRectangle(&g_sContext, &box);
    BuzzerOn();
    Graphics_flushBuffer(&g_sContext);
    swDelay(4);
    Graphics_clearDisplay(&g_sContext); // Clear the display
}

void countdown(void) {
    Graphics_Rectangle box = {.xMin = 5, .xMax = 91, .yMin = 5, .yMax = 91 };
    Graphics_clearDisplay(&g_sContext); // Clear the display
    Graphics_drawStringCentered(&g_sContext, "3", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
    Graphics_drawRectangle(&g_sContext, &box);
    Graphics_flushBuffer(&g_sContext);

    swDelay(2);
    Graphics_clearDisplay(&g_sContext); // Clear the display

    Graphics_drawStringCentered(&g_sContext, "2", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
    Graphics_drawRectangle(&g_sContext, &box);
    Graphics_flushBuffer(&g_sContext);

    swDelay(2);
    Graphics_clearDisplay(&g_sContext); // Clear the display

    Graphics_drawStringCentered(&g_sContext, "1", AUTO_STRING_LENGTH, 48, 15, TRANSPARENT_TEXT);
    Graphics_drawRectangle(&g_sContext, &box);
    Graphics_flushBuffer(&g_sContext);

    swDelay(2);
    Graphics_clearDisplay(&g_sContext); // Clear the display
}

