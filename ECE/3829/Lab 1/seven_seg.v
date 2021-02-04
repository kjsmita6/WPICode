`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Kyle Smith
// 
// Create Date: 01/28/2021 12:46:07 PM
// Design Name: seven_seg
// Module Name: seven_seg
// Project Name: Lab 1
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: Sets the values of the 7-seg display (input from input_select)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seven_seg(
    input [3:0] input_A, // value to show on A screen
    input [3:0] input_B, // value to show on B screen
    input [3:0] input_C, // value to show on C screen
    input [3:0] input_D, // value to show on D screen
    input [3:0] input_buttons, // 4 push buttons
    output reg [6:0] disp, // output value to show on 7-seg display
    output reg [3:0] an1 // anode display values, determines which of 4 screens is on
    );
    
    // Maps a number to the bits needed to show this number on 7-seg display
    parameter ZERO = 7'b0000001;
    parameter ONE = 7'b1001111;
    parameter TWO = 7'b0010010;
    parameter THREE = 7'b0000110;
    parameter FOUR = 7'b1001100;
    parameter FIVE = 7'b0100100;
    parameter SIX = 7'b0100000;
    parameter SEVEN = 7'b0001111;
    parameter EIGHT = 7'b0000000;
    parameter NINE = 7'b0000100;
    parameter A = 7'b0001000;
    parameter B = 7'b1100000;
    parameter C = 7'b0110001;
    parameter D = 7'b1000010;
    parameter E = 7'b0110000;
    parameter F = 7'b0111000;
    
    always @ (*) begin
        case (input_buttons)
            4'b0001: an1 = 4'b0111; // left button
            4'b0010: an1 = 4'b1011; // up button
            4'b0100: an1 = 4'b1101; // right button
            4'b1000: an1 = 4'b1110; // down button
            default: an1 = 4'b1111; // turn off all displays
        endcase
        
        case (input_buttons)
            4'b0001: 
                case (input_A)
                    4'b0000: disp = ZERO;
                    4'b0001: disp = ONE;
                    4'b0010: disp = TWO;
                    4'b0011: disp = THREE;
                    4'b0100: disp = FOUR;
                    4'b0101: disp = FIVE;
                    4'b0110: disp = SIX;
                    4'b0111: disp = SEVEN;
                    4'b1000: disp = EIGHT;
                    4'b1001: disp = NINE;
                    4'b1010: disp = A;
                    4'b1011: disp = B;
                    4'b1100: disp = C;
                    4'b1101: disp = D;
                    4'b1110: disp = E;
                    4'b1111: disp = F;
                    default: disp = ZERO;
                endcase
           4'b0010: 
                case (input_B)
                    4'b0000: disp = ZERO;
                    4'b0001: disp = ONE;
                    4'b0010: disp = TWO;
                    4'b0011: disp = THREE;
                    4'b0100: disp = FOUR;
                    4'b0101: disp = FIVE;
                    4'b0110: disp = SIX;
                    4'b0111: disp = SEVEN;
                    4'b1000: disp = EIGHT;
                    4'b1001: disp = NINE;
                    4'b1010: disp = A;
                    4'b1011: disp = B;
                    4'b1100: disp = C;
                    4'b1101: disp = D;
                    4'b1110: disp = E;
                    4'b1111: disp = F;
                endcase
            4'b0100: 
                case (input_C)
                    4'b0000: disp = ZERO;
                    4'b0001: disp = ONE;
                    4'b0010: disp = TWO;
                    4'b0011: disp = THREE;
                    4'b0100: disp = FOUR;
                    4'b0101: disp = FIVE;
                    4'b0110: disp = SIX;
                    4'b0111: disp = SEVEN;
                    4'b1000: disp = EIGHT;
                    4'b1001: disp = NINE;
                    4'b1010: disp = A;
                    4'b1011: disp = B;
                    4'b1100: disp = C;
                    4'b1101: disp = D;
                    4'b1110: disp = E;
                    4'b1111: disp = F;
                endcase
            4'b1000: 
                case (input_D)
                    4'b0000: disp = ZERO;
                    4'b0001: disp = ONE;
                    4'b0010: disp = TWO;
                    4'b0011: disp = THREE;
                    4'b0100: disp = FOUR;
                    4'b0101: disp = FIVE;
                    4'b0110: disp = SIX;
                    4'b0111: disp = SEVEN;
                    4'b1000: disp = EIGHT;
                    4'b1001: disp = NINE;
                    4'b1010: disp = A;
                    4'b1011: disp = B;
                    4'b1100: disp = C;
                    4'b1101: disp = D;
                    4'b1110: disp = E;
                    4'b1111: disp = F;
                endcase
            default: disp = ZERO;
        endcase    
    end
endmodule
