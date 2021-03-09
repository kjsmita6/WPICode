`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 03:26:57 PM
// Design Name: 
// Module Name: counter_top
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


module counter_top(
    input clk,
    input btnC,
    output [15:0] led
    );
    
    wire clk_10MHz;
    wire reset_n;
    
    clk_wiz_0 clk_wiz_oi(.clk_10MHz(clk_10MHz), .reset(btnC), .locked(reset_n), .clk_in1(clk));
    
    led_counter led_counteri(.clk(clk_10MHz), .reset_n(reset_n), .led_out(led[15:0]));
endmodule
