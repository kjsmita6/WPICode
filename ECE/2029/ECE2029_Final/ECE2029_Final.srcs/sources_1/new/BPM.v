`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 10:04:49 AM
// Design Name: 
// Module Name: BPM
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


module BPM(
input clk_in,
input bpm,
input [0:5]sw,
    output reg bpm_out

    );
binary_to_bcd U0(sw, ONES, TENS, HUNDREDS);
    reg[20:0] period_count = 0;
    always @ (posedge clk_in)
        if(period_count != (100000000 / (60/(ONES+TENS))))
            begin
                period_count <= period_count + 1;
                bpm_out <= 0;
            end
            
        else
            begin
                period_count <= 0;
                bpm_out <= 1;
            end
endmodule
