`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Kyle Smith
// 
// Create Date: 02/07/2021 04:35:51 PM
// Design Name: Lab 2
// Module Name: seven_seg
// Project Name: Lab 2
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
    input [6:0] input_A, // value to show on A screen
    input [6:0] input_B, // value to show on B screen
    input [6:0] input_C, // value to show on C screen
    input [6:0] input_D, // value to show on D screen
    input clk_25MHz,        // 25 MHz clock
    input reset_n,          // active low reset
    output reg [6:0] disp, // output value to show on 7-seg display
    output reg [3:0] an1 // anode display values, determines which of 4 screens is on
    );
    
    parameter C_MAX_COUNT = 18'd131_072 - 1; // 40 ns * 131,072 = 5.24 ms (~190 Hz)
    
    reg [1:0] display; // which display to show 
    reg [17:0] count; // timer count
    
    always @ (posedge clk_25MHz or negedge reset_n) begin
        if (reset_n == 1'b0) begin
           count <= 18'b0;
           an1 <= 4'b1111;
        end
        else begin
             case (display)
                2'b00: begin
                    an1 <= 4'b1110;
                    disp <= input_D;
                end
                2'b01: begin
                    an1 <= 4'b1101;
                    disp <= input_C;
                end
                2'b10: begin
                    an1 <= 4'b1011;
                    disp <= input_B;
                end
                2'b11: begin
                    an1 <= 4'b0111;
                    disp <= input_A;
                end
            endcase
            if (count == C_MAX_COUNT) begin
                count <= 18'b0;
                display <= display + 2'b1;
            end
            else begin
                count <= count + 18'b1;
            end
        end
    end
endmodule
