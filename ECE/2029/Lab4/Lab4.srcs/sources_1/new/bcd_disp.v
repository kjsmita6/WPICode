`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2019 08:35:38 AM
// Design Name: 
// Module Name: bcd_disp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bcd_disp(
                input clk,
                input [7:0] sw,
                output [3:0] an,
                output [6:0] Seg);
                
       parameter zero = 4'b0000;
       wire clk_out;
       wire [3:0] mux_out;
       wire [1:0] counter_out;
       wire [3:0] ones, tens;
       wire [1:0] hundreds;
       
       binary_to_bcd u0 (sw, ones, tens, hundreds);
       
       mux4to1 u1 (ones, tens, hundreds, zero, counter_out, mux_out);
       
       slowclock u2 (clk, clk_out);
       
       counter u3 (clk_out, counter_out);
       
       decoder_2to4 u4 (counter_out, an);
       seven_seg_disp u5 (mux_out, Seg);
endmodule
