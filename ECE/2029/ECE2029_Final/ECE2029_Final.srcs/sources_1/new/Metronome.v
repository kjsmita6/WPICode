`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 07:53:08 AM
// Design Name: 
// Module Name: Metronome
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


module Metronome(
    input clk,
    input [5:0]sw,                                             
    output [3:0]an,
    output reg [15:0]led,
    output [6:0]Seg
    );
   
    wire bpm;
    assign bpm = 100000000 / (60 / sw);
    
    //wire bpm_out;
    wire clk_out;
    slowclock U2(clk, clk_out);
    reg acc = 0;
    //BPM U3(clk, sw, bpm_out);
    bcd_disp u0(clk, sw, an, Seg);
    always @(posedge clk_out)
    begin
        acc <= acc + 1;
        if(acc == bpm)
        begin
            led[0] <= 1;
            led[1] <= 1;
            led[2] <= 1;
            led[3] <= 1;
            //led = ~led;

            acc <= 0;
        end
       else
        begin
            led[0] <= 0;
            led[1] <= 0;
            led[2] <= 0;
            led[3] <= 0;
        end
    end
endmodule
