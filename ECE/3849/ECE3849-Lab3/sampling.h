#ifndef __SAMPLING_H
#define __SAMPLING_H

#include <stdint.h>
#include <stdbool.h>
                           // size must be a power of 2
#define ADC_BUFFER_WRAP(i) ((i) & (ADC_BUFFER_SIZE - 1)) // index wrapping macro

int findTrigger(uint32_t us_div, uint32_t mV_div, bool rising);
int scale_voltage(uint16_t sample, uint32_t mV_div);
int32_t getADCBufferIndex(void);

#endif
