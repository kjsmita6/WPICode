`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Worcester Polytechnic Institute
// Engineer: Kyle Smith
// 
// Create Date: 02/07/2021 04:35:51 PM
// Design Name: Lab 3
// Module Name: seven_seg
// Project Name: Lab 3
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: Shows 4 inputs on each seven-segment display on the board
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
    input clk_10MHz,        // 10 MHz clock
    input reset_n,          // active low reset
    output reg [6:0] disp, // output value to show on 7-seg display
    output reg [3:0] an1 // anode display values, determines which of 4 screens is on
    );
    
    // Decoder bit values
    parameter ZERO = 7'b1000000;
    parameter ONE = 7'b1111001;
    parameter TWO = 7'b0100100;
    parameter THREE = 7'b0110000;
    parameter FOUR = 7'b0011001;
    parameter FIVE = 7'b0010010;
    parameter SIX = 7'b0000010;
    parameter SEVEN = 7'b1111000;
    parameter EIGHT = 7'b0000000;
    parameter NINE = 7'b0010000;
    parameter A = 7'b0001000;
    parameter B = 7'b0000011;
    parameter C = 7'b1000110;
    parameter D = 7'b0100001;
    parameter E = 7'b0000110;
    parameter F = 7'b0001110;
    
    parameter C_MAX_COUNT = 16'd32768 - 1; // 100 ns * 32,768 = 3.28 ms (~305 Hz)
    
    reg [1:0] display; // which display to show 
    reg [15:0] count; // timer count
    reg [6:0] display_value; // value to show on the display
    
    always @ (posedge clk_10MHz) begin
        if (reset_n == 1'b0) begin
           count <= 15'b0;
           an1 <= 4'b1111;
        end
        else begin
             case (display)
                2'b00: begin
                    an1 <= 4'b1110;
                    disp <= display_value;
                end
                2'b01: begin
                    an1 <= 4'b1101;
                    disp <= display_value;
                end
                2'b10: begin
                    an1 <= 4'b1011;
                    disp <= display_value;
                end
                2'b11: begin
                    an1 <= 4'b0111;
                    disp <= display_value;
                end
            endcase
            if (count == C_MAX_COUNT) begin
                count <= 15'b0;
                display <= display + 2'b1;
            end
            else begin
                count <= count + 15'b1;
            end
        end
    end
    
    always @ (*) begin
        case (display)
            2'b00: begin
                case (input_D)
                    4'b0000: display_value = ZERO;
                    4'b0001: display_value = ONE;
                    4'b0010: display_value = TWO;
                    4'b0011: display_value = THREE;
                    4'b0100: display_value = FOUR;
                    4'b0101: display_value = FIVE;
                    4'b0110: display_value = SIX;
                    4'b0111: display_value = SEVEN;
                    4'b1000: display_value = EIGHT;
                    4'b1001: display_value = NINE;
                    4'b1010: display_value = A;
                    4'b1011: display_value = B;
                    4'b1100: display_value = C;
                    4'b1101: display_value = D;
                    4'b1110: display_value = E;
                    4'b1111: display_value = F;
                    default: display_value = ZERO;
                endcase
            end
            2'b01: begin
                case (input_C)
                    4'b0000: display_value = ZERO;
                    4'b0001: display_value = ONE;
                    4'b0010: display_value = TWO;
                    4'b0011: display_value = THREE;
                    4'b0100: display_value = FOUR;
                    4'b0101: display_value = FIVE;
                    4'b0110: display_value = SIX;
                    4'b0111: display_value = SEVEN;
                    4'b1000: display_value = EIGHT;
                    4'b1001: display_value = NINE;
                    4'b1010: display_value = A;
                    4'b1011: display_value = B;
                    4'b1100: display_value = C;
                    4'b1101: display_value = D;
                    4'b1110: display_value = E;
                    4'b1111: display_value = F;
                    default: display_value = ZERO;
                endcase
            end
            2'b10: begin
                case (input_B)
                    4'b0000: display_value = ZERO;
                    4'b0001: display_value = ONE;
                    4'b0010: display_value = TWO;
                    4'b0011: display_value = THREE;
                    4'b0100: display_value = FOUR;
                    4'b0101: display_value = FIVE;
                    4'b0110: display_value = SIX;
                    4'b0111: display_value = SEVEN;
                    4'b1000: display_value = EIGHT;
                    4'b1001: display_value = NINE;
                    4'b1010: display_value = A;
                    4'b1011: display_value = B;
                    4'b1100: display_value = C;
                    4'b1101: display_value = D;
                    4'b1110: display_value = E;
                    4'b1111: display_value = F;
                    default: display_value = ZERO;
                endcase
            end
            2'b11: begin
                case (input_A)
                    4'b0000: display_value = ZERO;
                    4'b0001: display_value = ONE;
                    4'b0010: display_value = TWO;
                    4'b0011: display_value = THREE;
                    4'b0100: display_value = FOUR;
                    4'b0101: display_value = FIVE;
                    4'b0110: display_value = SIX;
                    4'b0111: display_value = SEVEN;
                    4'b1000: display_value = EIGHT;
                    4'b1001: display_value = NINE;
                    4'b1010: display_value = A;
                    4'b1011: display_value = B;
                    4'b1100: display_value = C;
                    4'b1101: display_value = D;
                    4'b1110: display_value = E;
                    4'b1111: display_value = F;
                    default: display_value = ZERO;
                endcase
            end
        endcase
    end
endmodule
