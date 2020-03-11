`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 09:25:33 AM
// Design Name: 
// Module Name: tb_metronome
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


module tb_metronome(

    );
    
    reg clk;
    reg [7:0]sw;
    wire [3:0]an;
    wire [15:0]led;
    wire [6:0]seg;
    wire clk_out;
    
    slowclock U0(clk, clk_out);
    
    Metronome U1(clk_out, sw, an, led, seg);
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end
    
    initial begin
        sw = 60;
        #10000;
        sw = 120;
        #10000;
        sw = 255;
        
        #10000;
    end
endmodule
