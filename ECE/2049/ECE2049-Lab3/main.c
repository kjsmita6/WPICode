#include <msp430.h>
#include <stdlib.h>
#include <stdio.h>
#include <peripherals.h>
#include <math.h>

unsigned long long int timercount = 1416960000;

#define CALADC12_15V_30C  *((unsigned int *)0x1A1A)
#define CALADC12_15V_85C  *((unsigned int *)0x1A1C)

volatile unsigned int in_temp;

#pragma vector=TIMER2_A0_VECTOR
__interrupt void TimerA2_ISR(void)
{
    timercount++;
}

void runTimerA2(void)
{
    TA2CTL = TASSEL_1 + MC_1 + ID_0;
    TA2CCR0 = 327;
    TA2CCTL0 = CCIE;
}

void stopTimerA2(void)
{
    TA2CTL = MC_0;
    TA2CCTL0 &= ~CCIE;
}

void displayTime(long unsigned int inTime)
{
    long unsigned int years = (inTime/31536000);
    long unsigned int actYear = years+2019;
    char leapY;

    if((years%400)==0)
        leapY = 1;
    else if((years%100)==0)
        leapY = 0;
    else if((years%4)==0)
        leapY = 1;
    else
        leapY = 0;

    long unsigned int atime = (long)inTime - (years*31536000);
    long unsigned int tdays = atime/86400;


    /* Months
     *   1<Jan<31,   32<Feb<59,   60<Mar<90,
     *  91<Apr<120, 121<May<151, 152<Jun<181,
     * 182<Jul<212, 213<Aug<243, 244<Sep<273,
     * 274<Oct<304, 305<Nov<334, 335<Dec<365
     */
    tdays += 1;
    char month;
    unsigned long int day;
    switch (tdays)
    {
    case 1 ... 31:    //JANUARY
    month = 1;
    day = tdays;
    break;
    case 32 ... 59:   //FEBRUARY
    month = 2;
    day = tdays-31;
    break;
    case 60 ... 90:   //MARCH
    month = 3;
    if(leapY==1){
        day = tdays-31-29;
    }
    else {
        day = tdays-31-28;
    }
    break;
    case 91 ... 120:  //APRIL
    month = 4;
    if(leapY==1){
        day = tdays-31-29-31;
    }
    else {
        day = tdays-31-28-31;
    }
    break;
    case 121 ... 151:  //MAY
    month = 5;
    if(leapY==1){
        day = tdays-31-29-31-30;
    }
    else{
        day = tdays-31-28-31-30;
    }
    break;
    case 152 ... 181: //JUNE
    month = 6;
    if(leapY==1){
        day = tdays-31-29-31-30-31;
    }
    else{
        day = tdays-31-28-31-30-31;
    }
    break;
    case 182 ... 212: //JULY
    month = 7;
    if(leapY==1){
        day = tdays-31-28-31-30-31-30;
    }
    else{
        day = tdays-31-28-31-30-31-30;
    }
    break;
    case 213 ... 243: //AUGUST
    month = 8;
    if(leapY==1){
        day = tdays-31-28-31-30-31-30-31;
    }
    else{
        day = tdays-31-28-31-30-31-30-31;
    }
    break;
    case 244 ... 273:   //SEPTEMBER
    month = 9;
    if(leapY==1){
        day = tdays-31-28-31-30-31-30-31-31;
    }
    else{
        day = tdays-31-28-31-30-31-30-31-31;
    }
    break;
    case 274 ... 304:   //OCTOBER
    month = 10;
    if(leapY==1){
        day = tdays-31-28-31-30-31-30-31-31-30;
    }
    else{
        day = tdays-31-28-31-30-31-30-31-31-30;
    }
    break;
    case 305 ... 334:  //NOVEMBER
    month = 11;
    if(leapY==1){
        day = tdays-31-28-31-30-31-30-31-31-30-31;
    }
    else{
        day = tdays-31-28-31-30-31-30-31-31-30-31;
    }
    break;
    case 335 ... 365:  //DECEMBER
    month = 12;
    if(leapY==1){
        day = tdays-31-28-31-30-31-30-31-31-30-31;
    }
    else{
        day = tdays-31-28-31-30-31-30-31-31-30-31;
    }
    break;
    }

    char arr0[7];
    switch(month)
    {
    case 1:
        arr0[0] = 'J';
        arr0[1] = 'A';
        arr0[2] = 'N';
        break;
    case 2:
        arr0[0] = 'F';
        arr0[1] = 'E';
        arr0[2] = 'B';
        break;
    case 3:
        arr0[0] = 'M';
        arr0[1] = 'A';
        arr0[2] = 'R';
        break;
    case 4:
        arr0[0] = 'A';
        arr0[1] = 'P';
        arr0[2] = 'R';
        break;
    case 5:
        arr0[0] = 'M';
        arr0[1] = 'A';
        arr0[2] = 'Y';
        break;
    case 6:
        arr0[0] = 'J';
        arr0[1] = 'U';
        arr0[2] = 'N';
        break;
    case 7:
        arr0[0] = 'J';
        arr0[1] = 'U';
        arr0[2] = 'L';
        break;
    case 8:
        arr0[0] = 'A';
        arr0[1] = 'U';
        arr0[2] = 'G';
        break;
    case 9:
        arr0[0] = 'S';
        arr0[1] = 'E';
        arr0[2] = 'P';
        break;
    case 10:
        arr0[0] = 'O';
        arr0[1] = 'C';
        arr0[2] = 'T';
        break;
    case 11:
        arr0[0] = 'N';
        arr0[1] = 'O';
        arr0[2] = 'V';
        break;
    case 12:
        arr0[0] = 'D';
        arr0[1] = 'E';
        arr0[2] = 'C';
        break;
    }
    arr0[3] = '-';
    if(tdays < 10)
    {
        arr0[4] = '0';
        arr0[5] = day + 0x30;
    }
    else
    {
        arr0[4] = (day/10)+0x30;
        arr0[5] = (day%10)+0x30;
    }
    arr0[6] = '\0';

    tdays-=1;
    unsigned int hrs = atime - (tdays*86400);
    unsigned int hh = floor(hrs/3600);
    unsigned int min = hrs-(hh*3600);
    unsigned int mm = floor(min/60.0);
    unsigned int sec  = min-(mm*60);
    unsigned int ss = floor(sec);

    char arr1[9];

    if(hh < 10)
    {
        arr1[0] = '0';
        arr1[1] = hh+0x30;
    }
    else
    {
        arr1[0] = (hh/10)+0x30;
        arr1[1] = (hh%10)+0x30;
    }
    arr1[2] = ':';
    if(mm < 10)
    {
        arr1[3] = '0';
        arr1[4] = mm+0x30;
    }
    else
    {
        arr1[3] = (mm/10)+0x30;
        arr1[4] = (mm%10)+0x30;
    }
    arr1[5] = ':';
    if(ss < 10)
    {
        arr1[6] = '0';
        arr1[7] = ss+0x30;
    }
    else
    {
        arr1[6] = (ss/10)+0x30;
        arr1[7] = (ss%10)+0x30;
    }
    arr1[8] = '\0';//null terminator

    Graphics_drawStringCentered(&g_sContext, arr0, 7, 48, 15, OPAQUE_TEXT);
    Graphics_drawStringCentered(&g_sContext, arr1, 9, 48, 25, OPAQUE_TEXT);
    Graphics_flushBuffer(&g_sContext);
}



void displayTemp(float inAvgTempC)
{
    float inAvgTempF = (inAvgTempC * 1.80) + 32.0;

    char arr[12];

    arr[0] = (((char)inAvgTempC)/10)+0x30; //10ths place
    arr[1] = (((char)inAvgTempC)%10)+0x30; //1s place
    arr[2] = '.';
    char i = floor(inAvgTempC*10.0);
    arr[3] = (i%10)+0x30;
    arr[4] = 'C';
    arr[5] = '/';
    arr[6] = (((char)inAvgTempF)/10)+0x30; //10ths place
    arr[7] = (((char)inAvgTempF)%10)+0x30; //1s place
    arr[8] = '.';
    char j = floor(inAvgTempF*10.0);
    arr[9] = (i%10)+0x30;
    arr[10] = 'F';
    arr[11] = '\0';

    Graphics_drawStringCentered(&g_sContext, arr, AUTO_STRING_LENGTH, 48, 35, OPAQUE_TEXT);
    Graphics_flushBuffer(&g_sContext);
}

void wheel(void) {
    REFCTL0 &= ~REFMSTR;    // Reset REFMSTR to hand over control of
    // internal reference voltages to
    // ADC12_A control registers
    ADC12CTL0 = ADC12SHT0_9 | ADC12REFON | ADC12ON;     // Internal ref = 1.5V
    ADC12CTL1 = ADC12SHP;                               // Enable sample timer
    P6SEL |= BIT0;

    // Using ADC12MEM0 to store reading
    ADC12MCTL0 = ADC12SREF_0 + ADC12INCH_0;    // ADC i/p ch A10 = temp sense
    // ACD12SREF_1 = internal ref = 1.5v
    ADC12MCTL1 = ADC12SREF_1 + ADC12INCH_10 + ADC12EOS;
    __delay_cycles(100);                    // delay to allow Ref to settle

    ADC12CTL0 |= ADC12ENC;                  // Enable conversion

    // Use calibration data stored in info memory
    ADC12CTL0 &= ~ADC12SC;  // clear the start bit
    ADC12CTL0 |= ADC12SC;   // Sampling and conversion start
    // Single conversion (single channel)

    // Poll busy bit waiting for conversion to complete
    while (ADC12CTL1 & ADC12BUSY)
        __no_operation();
    unsigned int wheel = ADC12MEM0 + 1;      // Read in results of conversion
    BuzzerOn(wheel);
}

void main(void)
{
    WDTCTL = WDTPW + WDTHOLD;      // Stop WDT
    configKeypad();
    initLeds();
    configDisplay();
    _BIS_SR(GIE); // enable interrupts
    //Graphics_clearDisplay(&g_sContext);
    volatile float temperatureDegC;
    volatile float temperatureDegF;
    volatile float degC_per_bit;
    volatile unsigned int bits30, bits85;



    REFCTL0 &= ~REFMSTR;    // Reset REFMSTR to hand over control of
    // internal reference voltages to
    // ADC12_A control registers

    ADC12CTL0 = ADC12SHT0_9 | ADC12REFON | ADC12ON | ADC12MSC;     // Internal ref = 1.5V
    ADC12CTL1 = ADC12SHP + ADC12CONSEQ_1;                  // Enable sample timer

    // Using ADC12MEM0 to store reading
    ADC12MCTL0 = ADC12SREF_0 + ADC12INCH_0;  // ADC i/p ch A10 = temp sense
    ADC12MCTL1 = ADC12SREF_1 + ADC12INCH_10 + ADC12EOS;
    // ACD12SREF_1 = internal ref = 1.5v

    __delay_cycles(100);                    // delay to allow Ref to settle
    ADC12CTL0 |= ADC12ENC;              // Enable conversion

    // Use calibration data stored in info memory
    bits30 = CALADC12_15V_30C;
    bits85 = CALADC12_15V_85C;
    degC_per_bit = ((float)(85.0 - 30.0))/((float)(bits85-bits30));



    runTimerA2();
    while(1) {
        //wheel();
        float temps = 0;
        int i = 0;
        displayTime(timercount / 100);
        for(i; i < 10; i++) {
            displayTime(timercount / 100);
            int timer_cnt = timercount;
            while(timercount < timer_cnt + 100) {
                __no_operation();
            }
            ADC12CTL0 &= ~ADC12SC;  // clear the start bit
            ADC12CTL0 |= ADC12SC;       // Sampling and conversion start
            // Single conversion (single channel)

            // Poll busy bit waiting for conversion to complete
            while (ADC12CTL1 & ADC12BUSY)
                __no_operation();
            in_temp = ADC12MEM1;      // Read in results if conversion

            //int buzzer = ADC12MEM0;
            BuzzerOn(ADC12MEM0);
            // Temperature in Celsius. See the Device Descriptor Table section in the
            // System Resets, Interrupts, and Operating Modes, System Control Module
            // chapter in the device user's guide for background information on the
            // used formula.
            temps += (float)((long)in_temp - CALADC12_15V_30C) * degC_per_bit +30.0;

        }
        float avgTemp = temps / 10.0;
        displayTemp(avgTemp);
    }
}
