`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Worcester Polytechnic Institute
// Engineer: Kyle Smith
// 
// Create Date: 02/19/2021 01:53:05 PM
// Design Name: lab3_top
// Module Name: lab3_top
// Project Name: Lab 3
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: Lab 3 top module, connects inputs and outputs to the modules
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab3_top(
    input clk, // input clock from board
    input btnC, // center pushbutton for reset
    input JA1, // not connected
    input JA2, // MISO
    output JA0, // chip select (_n)
    output JA3, // serial clock
    output [6:0] seg, // 7 segment display cathodes
    output [3:0] an // 7 segment display anodes 
    );
    
    wire clk_10MHz;
    wire reset_n;
    wire [15:0] data_in;

    wire done;
    wire start;
    
    clock_gen clock_geni(.clk(clk), .btnC(btnC), .reset_n(reset_n), .clk_10MHz(clk_10MHz));
    
    controller_als controller_alsi(.clk_10MHz(clk_10MHz), .reset_n(reset_n), .done(done), .start(start));
    interface_als interface_alsi(.clk_10MHz(clk_10MHz), .reset_n(reset_n), .start(start), .miso(JA2), .done(done), .sclk(JA3), .cs_n(JA0), .data_out(data_in));
    
    seven_seg seven_segi(.input_A(4'b0101), .input_B(4'b0101), .input_C(data_in[11:8]), .input_D(data_in[7:4]), .clk_10MHz(clk_10MHz), .reset_n(reset_n), .an1(an), .disp(seg));
    
endmodule
