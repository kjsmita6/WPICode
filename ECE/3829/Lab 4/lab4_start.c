/* Author: Jennifer Stander
 * Course: ECE3829
 * Project: Lab 4
 * Description: Starting project for Lab 4.
 * Implements two functions
 * 1- reading switches and lighting their corresponding LED
 * 2 - It outputs a middle C tone to the AMP2
 * It also initializes the anode and segment of the 7-seg display
 * for future development
 */


// Header Inclusions
/* xparameters.h set parameters names
 like XPAR_AXI_GPIO_0_DEVICE_ID that are referenced in you code
 each hardware module as a section in this file.
 */
#include "xparameters.h"
/* each hardware module type as a set commands you can use to
 * configure and access it. xgpio.h defines API commands for your gpio modules
 */
#include "xgpio.h"
/* this defines the recommend types like u32 */
#include "xil_types.h"
#include "xil_printf.h"
#include "xstatus.h"
#include "sleep.h"
#include "xtmrctr.h"


void check_switches(u32 *sw_data, u32 *sw_data_old, u32 *sw_changes);
void update_LEDs(u32 led_data);
void update_amp2(u32 *amp2_data, u32 target_count, u32 *last_count);
void update_display(u32 seg_c, u32 seg_d, u32 *last_count);
void read_buttons(u32 *btn_data, u32 *btn_data_old, u32 *btn_changes);


// Block Design Details
/* Timer device ID
 */
#define TMRCTR_DEVICE_ID XPAR_TMRCTR_0_DEVICE_ID
#define TIMER_COUNTER_0 0

#define TCNT_DISP 800000

/* LED are assigned to GPIO (CH 1) GPIO_0 Device
 * DIP Switches are assigned to GPIO2 (CH 2) GPIO_0 Device
 */
#define GPIO0_ID XPAR_GPIO_0_DEVICE_ID
#define GPIO0_LED_CH 1
#define GPIO0_SW_CH 2
// 16-bits of LED outputs (not tristated)
#define GPIO0_LED_TRI 0x00000000
#define GPIO0_LED_MASK 0x0000FFFF
// 16-bits SW inputs (tristated)
#define GPIO0_SW_TRI 0x0000FFFF
#define GPIO0_SW_MASK 0x0000FFFF

/*  7-SEG Anodes are assigned to GPIO (CH 1) GPIO_1 Device
 *  7-SEG Cathodes are assined to GPIO (CH 2) GPIO_1 Device
 */
#define GPIO1_ID XPAR_GPIO_1_DEVICE_ID
#define GPIO1_ANODE_CH 1
#define GPIO1_CATHODE_CH 2
//4-bits of anode outputs (not tristated)
#define GPIO1_ANODE_TRI 0x00000000
#define GPIO1_ANODE_MASK 0x0000000F
//8-bits of cathode outputs (not tristated)
#define GPIO1_CATHODE_TRI 0x00000000
#define GPIO1_CATHODE_MASK 0x000000FF

#define GPIO2_ID XPAR_GPIO_2_DEVICE_ID
#define GPIO2_AMP2_CH 1
#define GPIO2_AMP2_TRI 0xFFFFFFF4
#define GPIO2_AMP2_MASK 0x00000001

#define GPIO2_BTN_CH 2
#define GPIO2_BTN_TRI 0xFFFFFFF0
#define GPIO2_BTN_MASK 0x0000000F

// Timer Device instance
XTmrCtr TimerCounter;

// GPIO Driver Device
XGpio device0;
XGpio device1;
XGpio device2;

// Target counts for each note, calculated from frequency with known clock period
#define target_count(freq) (1.0 / (2.0 * freq * 10e-9))
#define TCNT_C3 target_count(130.81)
#define TCNT_D3 target_count(146.83)
#define TCNT_E3 target_count(164.81)
#define TCNT_F3 target_count(174.61)
#define TCNT_G3 target_count(196)
#define TCNT_A3 target_count(220)
#define TCNT_B3 target_count(246.94)
#define TCNT_C4 target_count(261.63)
#define TCNT_D4 target_count(293.66)
#define TCNT_E4 target_count(329.63)
#define TCNT_F4 target_count(349.23)
#define TCNT_G4 target_count(392)
#define TCNT_A4 target_count(440)
#define TCNT_B4 target_count(493.88)
#define TCNT_C5 target_count(523.25)
#define TCNT_D5 target_count(587.33)

// Target counts for flat/sharp notes
#define TCNT_CS3 target_count(138.59)
#define TCNT_Eb3 target_count(155.56)
#define TCNT_FS3 target_count(185)
#define TCNT_GS3 target_count(207.65)
#define TCNT_Bb3 target_count(233.08)
#define TCNT_CS4 target_count(277.18)
#define TCNT_Eb4 target_count(311.13)
#define TCNT_FS4 target_count(369.99)
#define TCNT_GS4 target_count(415.30)
#define TCNT_Bb4 target_count(466.16)
#define TCNT_CS5 target_count(554.37)
#define TCNT_Eb5 target_count(622.25)

// Seven segment display bits for A-G
#define SEG_A 0b0001000
#define SEG_B 0b0000011
#define SEG_C 0b1000110
#define SEG_D 0b0100001
#define SEG_E 0b0000110
#define SEG_F 0b0001110
#define SEG_G 0b0000010
#define SEG_S 0b0010010
#define SEG_NONE 0b1111111


// IP Tutorial  Main
int main() {
	u32 sw_data = 0;
	u32 sw_data_old = 0;
	// bit[3] = SHUTDOWN_L and bit[1] = GAIN, bit[0] = Audio Input
	u32 amp2_data = 0x8;
	u32 target_count = 0xffffffff;
	u32 last_count = 0;
	u32 last_count_disp = 0;
	u32 sw_changes = 0;
	u32 btn_changes = 0;
	u32 btn_data = 0;
	u32 btn_data_old = 0;

	XStatus status;


	//Initialize timer
	status = XTmrCtr_Initialize(&TimerCounter, XPAR_TMRCTR_0_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("Initialization Timer failed\n\r");
		return 1;
	}
	//Make sure the timer is working
	status = XTmrCtr_SelfTest(&TimerCounter, TIMER_COUNTER_0);
	if (status != XST_SUCCESS) {
		xil_printf("Initialization Timer failed\n\r");
		return 1;
	}
	//Configure the timer to Autoreload
	XTmrCtr_SetOptions(&TimerCounter, TIMER_COUNTER_0, XTC_AUTO_RELOAD_OPTION);
	//Initialize your timer values
	//Start your timer
	XTmrCtr_Start(&TimerCounter, TIMER_COUNTER_0);



	// Initialize the GPIO devices
	status = XGpio_Initialize(&device0, GPIO0_ID);
	if (status != XST_SUCCESS) {
		xil_printf("Initialization GPIO_0 failed\n\r");
		return 1;
	}
	status = XGpio_Initialize(&device1, GPIO1_ID);
	if (status != XST_SUCCESS) {
		xil_printf("Initialization GPIO_1 failed\n\r");
		return 1;
	}
	status = XGpio_Initialize(&device2, GPIO2_ID);
	if (status != XST_SUCCESS) {
		xil_printf("Initialization GPIO_2 failed\n\r");
		return 1;
	}

	// Set directions for data ports tristates, '1' for input, '0' for output
	XGpio_SetDataDirection(&device0, GPIO0_LED_CH, GPIO0_LED_TRI);
	XGpio_SetDataDirection(&device0, GPIO0_SW_CH, GPIO0_SW_TRI);
	XGpio_SetDataDirection(&device1, GPIO1_ANODE_CH, GPIO1_ANODE_TRI);
	XGpio_SetDataDirection(&device1, GPIO1_CATHODE_CH, GPIO1_CATHODE_TRI);
	XGpio_SetDataDirection(&device2, GPIO2_AMP2_CH, GPIO2_AMP2_TRI);
	XGpio_SetDataDirection(&device2, GPIO2_BTN_CH, GPIO2_BTN_TRI);

	xil_printf("Demo initialized successfully\n\r");

	XGpio_DiscreteWrite(&device2, GPIO2_AMP2_CH, amp2_data);

	// On startup, play B flat major scale, each note 1/2 second apart
	u32 notes = 0;
	u32 last_count_startup = 0;
	u32 terminal_count = TCNT_Bb3;
	u32 seg_c = SEG_B;
	u32 seg_d = SEG_B;
	while (notes < 8) {
		update_display(seg_c, seg_d, &last_count_disp);
		u32 current_count = XTmrCtr_GetValue(&TimerCounter, TIMER_COUNTER_0);
		if (current_count - last_count_startup > 50000000) {
			notes++;
			switch (notes) {
			case 1:
				terminal_count = TCNT_C4;
				seg_c = SEG_C;
				seg_d = SEG_NONE;
				break;
			case 2:
				terminal_count = TCNT_D4;
				seg_c = SEG_D;
				seg_d = SEG_NONE;
				break;
			case 3:
				terminal_count = TCNT_Eb4;
				seg_c = SEG_E;
				seg_d = SEG_B;
				break;
			case 4:
				terminal_count = TCNT_F4;
				seg_c = SEG_F;
				seg_d = SEG_NONE;
				break;
			case 5:
				terminal_count = TCNT_G4;
				seg_c = SEG_G;
				seg_d = SEG_NONE;
				break;
			case 6:
				terminal_count = TCNT_A4;
				seg_c = SEG_A;
				seg_d = SEG_NONE;
				break;
			case 7:
				terminal_count = TCNT_Bb4;
				seg_c = SEG_B;
				seg_d = SEG_B;
				break;
			}
			last_count_startup = current_count;
		}
		update_amp2(&amp2_data, terminal_count, &last_count);
	}

	seg_c = SEG_NONE;
	seg_d = SEG_NONE;

	// Check the status of switches and buttons forever to determine which note is played
	// If button is 0x4 (right) = note is sharp, 0x2 (left) = note is flat, normal note otherwise
	while (1) {
		check_switches(&sw_data, &sw_data_old, &sw_changes);
		read_buttons(&btn_data, &btn_data_old, &btn_changes);
		update_LEDs(sw_data);
		if (sw_changes | btn_changes) {
			switch (sw_data) {
			case 0x1:
				if (btn_data == 0x4) {
					target_count = TCNT_CS3;
					update_display(SEG_C, SEG_S, &last_count_disp);
					seg_c = SEG_C;
					seg_d = SEG_S;
				} else {
					target_count = TCNT_C3;
					update_display(SEG_C, SEG_NONE, &last_count_disp);
					seg_c = SEG_C;
					seg_d = SEG_NONE;
				}
				break;
			case 0x2:
				if (btn_data == 0x2) {
					target_count = TCNT_CS3;
					update_display(SEG_C, SEG_S, &last_count_disp);
					seg_c = SEG_C;
					seg_d = SEG_S;
				} else if (btn_data == 0x4) {
					target_count = TCNT_Eb3;
					update_display(SEG_E, SEG_B, &last_count_disp);
					seg_c = SEG_E;
					seg_d = SEG_B;
				} else {
					target_count = TCNT_D3;
					update_display(SEG_D, SEG_NONE, &last_count_disp);
					seg_c = SEG_D;
					seg_d = SEG_NONE;
				}
				break;
			case 0x4:
				if (btn_data == 0x2) {
					target_count = TCNT_Eb3;
					update_display(SEG_E, SEG_B, &last_count_disp);
					seg_c = SEG_E;
					seg_d = SEG_B;
				} else {
					target_count = TCNT_E3;
					update_display(SEG_E, SEG_NONE, &last_count_disp);
					seg_c = SEG_E;
					seg_d = SEG_NONE;
				}
				break;
			case 0x8:
				if (btn_data == 0x4) {
					target_count = TCNT_FS3;
					update_display(SEG_F, SEG_S, &last_count_disp);
					seg_c = SEG_F;
					seg_d = SEG_S;
				} else {
					target_count = TCNT_F3;
					update_display(SEG_F, SEG_NONE, &last_count_disp);
					seg_c = SEG_F;
					seg_d = SEG_NONE;
				}
				break;
			case 0x10:
				if (btn_data == 0x2) {
					target_count = TCNT_FS3;
					update_display(SEG_F, SEG_S, &last_count_disp);
					seg_c = SEG_F;
					seg_d = SEG_S;
				} else if (btn_data == 0x4) {
					target_count = TCNT_GS3;
					update_display(SEG_G, SEG_S, &last_count_disp);
					seg_c = SEG_G;
					seg_d = SEG_S;
				} else {
					target_count = TCNT_G3;
					update_display(SEG_G, SEG_NONE, &last_count_disp);
					seg_c = SEG_G;
					seg_d = SEG_NONE;
				}
				break;
			case 0x20:
				if (btn_data == 0x2) {
					target_count = TCNT_GS3;
					update_display(SEG_G, SEG_S, &last_count_disp);
					seg_c = SEG_G;
					seg_d = SEG_S;
				} else if (btn_data == 0x4) {
					target_count = TCNT_Bb3;
					update_display(SEG_B, SEG_B, &last_count_disp);
					seg_c = SEG_B;
					seg_d = SEG_B;
				} else {
					target_count = TCNT_A3;
					update_display(SEG_A, SEG_NONE, &last_count_disp);
					seg_c = SEG_A;
					seg_d = SEG_NONE;
				}
				break;
			case 0x40:
				if (btn_data == 0x2) {
					target_count = TCNT_Bb3;
					update_display(SEG_B, SEG_B, &last_count_disp);
					seg_c = SEG_B;
					seg_d = SEG_B;
				} else {
					target_count = TCNT_B3;
					update_display(SEG_B, SEG_NONE, &last_count_disp);
					seg_c = SEG_B;
					seg_d = SEG_NONE;
				}
				break;
			case 0x80:
				if (btn_data == 0x4) {
					target_count = TCNT_CS4;
					seg_c = SEG_C;
					seg_d = SEG_S;
				} else {
					target_count = TCNT_C4;
					seg_c = SEG_C;
					seg_d = SEG_NONE;
				}
				break;
			case 0x100:
				if (btn_data == 0x2) {
					target_count = TCNT_CS4;
					seg_c = SEG_C;
					seg_d = SEG_S;
				} else if (btn_data == 0x4) {
					target_count = TCNT_Eb4;
					seg_c = SEG_E;
					seg_d = SEG_B;
				} else {
					target_count = TCNT_D4;
					seg_c = SEG_D;
					seg_d = SEG_NONE;
				}
				break;
			case 0x200:
				if (btn_data == 0x2) {
					target_count = TCNT_Eb4;
					seg_c = SEG_E;
					seg_d = SEG_B;
				} else {
					target_count = TCNT_E4;
					seg_c = SEG_E;
					seg_d = SEG_NONE;
				}
				break;
			case 0x400:
				if (btn_data == 0x4) {
					target_count = TCNT_FS4;
					seg_c = SEG_F;
					seg_d = SEG_S;
				} else {
					target_count = TCNT_F4;
					seg_c = SEG_F;
					seg_d = SEG_NONE;
				}
				break;
			case 0x800:
				if (btn_data == 0x2) {
					target_count = TCNT_FS4;
					seg_c = SEG_F;
					seg_d = SEG_S;
				} else if (btn_data == 0x4) {
					target_count = TCNT_GS4;
					seg_c = SEG_G;
					seg_d = SEG_S;
				} else {
					target_count = TCNT_G4;
					seg_c = SEG_G;
					seg_d = SEG_NONE;
				}
				break;
			case 0x1000:
				if (btn_data == 0x2) {
					target_count = TCNT_GS4;
					seg_c = SEG_G;
					seg_d = SEG_S;
				} else if (btn_data == 0x4) {
					target_count = TCNT_Bb4;
					seg_c = SEG_B;
					seg_d = SEG_B;
				} else {
					target_count = TCNT_A4;
					seg_c = SEG_A;
					seg_d = SEG_NONE;
				}
				break;
			case 0x2000:
				if (btn_data == 0x2) {
					target_count = TCNT_Bb4;
					seg_c = SEG_B;
					seg_d = SEG_B;
				} else {
					target_count = TCNT_B4;
					seg_c = SEG_B;
					seg_d = SEG_NONE;
				}
				break;
			case 0x4000:
				if (btn_data == 0x4) {
					target_count = TCNT_CS5;
					seg_c = SEG_C;
					seg_d = SEG_S;
				} else {
					target_count = TCNT_C5;
					seg_c = SEG_C;
					seg_d = SEG_NONE;
				}
				break;
			case 0x8000:
				if (btn_data == 0x2) {
					target_count = TCNT_CS5;
					seg_c = SEG_C;
					seg_d = SEG_S;
				} else if (btn_data == 0x4) {
					target_count = TCNT_Eb5;
					seg_c = SEG_E;
					seg_d = SEG_B;
				} else {
					target_count = TCNT_D5;
					seg_c = SEG_D;
					seg_d = SEG_NONE;
				}
				break;
			default:
				target_count = 0x0;
				seg_c = SEG_NONE;
				seg_d = SEG_NONE;
			}
		}
		update_amp2(&amp2_data, target_count, &last_count);
		update_display(seg_c, seg_d, &last_count_disp);
	}
}

void read_buttons(u32 *btn_data, u32 *btn_data_old, u32 *btn_changes) {
	*btn_data = XGpio_DiscreteRead(&device2, GPIO2_BTN_CH);
	*btn_data &= GPIO2_BTN_MASK;
	*btn_changes = 0;
	if (btn_data_old != btn_data) {
		*btn_changes = *btn_data ^ *btn_data_old;
		*btn_data_old = *btn_data;
	}
}

void update_display(u32 seg_c, u32 seg_d, u32 *last_count) {
	u32 current_count = XTmrCtr_GetValue(&TimerCounter, TIMER_COUNTER_0);
	u32 seg;
	static u32 an = 0xe;
	// Rotate an and seg bits to show multiple values on the display
	if ((current_count - *last_count) > TCNT_DISP) {
		if (an == 0xe) {
			an = 0xd;
			seg = seg_c;
		} else if (an == 0xd) {
			an = 0xe;
			seg = seg_d;
		}
		*last_count = current_count;
	}
	an &= GPIO1_ANODE_MASK;
	seg &= GPIO1_CATHODE_MASK;

	XGpio_DiscreteWrite(&device1, GPIO1_ANODE_CH, an);
	XGpio_DiscreteWrite(&device1, GPIO1_CATHODE_CH, seg);
}

// reads the value of the input switches and outputs if there were changes from last time
void check_switches(u32 *sw_data, u32 *sw_data_old, u32 *sw_changes) {
	*sw_data = XGpio_DiscreteRead(&device0, GPIO0_SW_CH);
	*sw_data &= GPIO0_SW_MASK;
	*sw_changes = 0;
	if (sw_data != sw_data_old) {
		// When any bswitch is toggled, the LED values are updated
		//  and report the state over UART.
		*sw_changes = *sw_data ^ *sw_data_old;
		*sw_data_old = *sw_data;
	}
}

// writes the value of led_data to the LED pins
void update_LEDs(u32 led_data) {
	led_data = (led_data) & GPIO0_LED_MASK;
	XGpio_DiscreteWrite(&device0, GPIO0_LED_CH, led_data);
}

// if the current count is - last_count > target_count toggle the amp2 output
void update_amp2(u32 *amp2_data, u32 target_count, u32 *last_count) {
	u32 current_count = XTmrCtr_GetValue(&TimerCounter, TIMER_COUNTER_0);
	if ((current_count - *last_count) > target_count) {
		// toggling the LSB of amp2 data
		*amp2_data = ((*amp2_data & 0x01) == 0) ? (*amp2_data | 0x1) : (*amp2_data & 0xe);
		XGpio_DiscreteWrite(&device2, GPIO2_AMP2_CH, *amp2_data );
		*last_count = current_count;
	}
}
