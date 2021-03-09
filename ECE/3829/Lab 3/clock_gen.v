`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Worcester Polytechnic Institute
// Engineer: Kyle Smith
// 
// Create Date: 02/19/2021 01:31:00 PM
// Design Name: clock_gen
// Module Name: clock_gen
// Project Name: Lab 3
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: Generates a 10 MHz clock using clock wizard and synchronizes reset signal
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_gen(
    input clk, // input clock from board (100 MHz)
    input btnC, // center button for reset
    output reg reset_n, // active low, synchronized reset
    output clk_10MHz // 10 MHz output clock
    );
    
    wire reset_n_async;
    clk_wiz_0 clk_wiz_0i(.clk_in1(clk), .reset(btnC), .locked(reset_n_async), .clk_out1(clk_10MHz));
    
    reg reset_n_d;
    always @ (posedge clk_10MHz) begin
        reset_n_d <= reset_n_async;
        reset_n <= reset_n_d;
    end
    
endmodule
