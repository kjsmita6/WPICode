`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Kyle Smith
// 
// Create Date: 01/28/2021 04:17:42 PM
// Design Name: lab1_top
// Module Name: lab1_top
// Project Name: Lab 1
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: Top module for lab 1
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab1_top(
        input [3:0] buttons, // 4 push buttons (not incl. center button)
        input [15:0] sw, // 16 flip switches
        output [3:0] an, // 7-seg display anodes
        output [6:0] seg, // 7-seg display pins
        output [15:0] led // 16 leds
    );
    
    //always @ (sw)
        assign led = sw;
    
    wire [3:0] display_A;
    wire [3:0] display_B;
    wire [3:0] display_C;
    wire [3:0] display_D;
    
    input_select J1(.select(sw[15:14]), .sw1(sw[13:0]), .display_A(display_A), .display_B(display_B), .display_C(display_C), .display_D(display_D));
    seven_seg J2(.input_A(display_A), .input_B(display_B), .input_C(display_C), .input_D(display_D), .input_buttons(buttons), .disp(seg), .an1(an));
        
endmodule
