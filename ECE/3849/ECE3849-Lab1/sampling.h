#ifndef __SAMPLING_H
#define __SAMPLING_H

#include <stdint.h>
#include <stdbool.h>

#define ADC_BUFFER_SIZE 2048                             // size must be a power of 2
#define ADC_BUFFER_WRAP(i) ((i) & (ADC_BUFFER_SIZE - 1)) // index wrapping macro
extern volatile int32_t gADCBufferIndex;  // latest sample index
extern volatile uint16_t gADCBuffer[ADC_BUFFER_SIZE];           // circular buffer
extern volatile uint32_t gADCErrors;

void setupADC(void);
int findTrigger(uint32_t us_div, uint32_t mV_div, bool rising);
int scale_voltage(uint16_t sample, uint32_t mV_div);

#endif
