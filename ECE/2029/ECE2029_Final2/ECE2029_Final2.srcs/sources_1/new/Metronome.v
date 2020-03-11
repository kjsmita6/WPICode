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
    input [7:0]sw,                                             
    output [3:0]an,
    output reg [15:0]led,
    output [6:0]Seg
    );
   
    wire bpm = 45 / (sw / 60); // number of ticks between beats
    
    wire clk_out;
    bcd_disp u0(clk, sw, an, Seg); 
    slowclock U2(clk, clk_out);
    reg acc = 0;
    
    always @(posedge clk_out)
    begin
        if(acc == bpm)
        begin
           /* led[0] = 1;
            led[1] = 1;
            led[2] = 1;
            led[3] = 1;
            led[4] = 1;
            led[5] = 1;
            led[6] = 1;
            led[7] = 1;
            led[8] = 1;
            led[9] = 1;
            led[10] = 1;
            led[11] = 1;
            led[12] = 1;
            led[13] = 1;
            led[14] = 1;
            led[15] = 1;*/
            led = 65536;
            //led = ~led;

            acc = 0;
        end
       else
        begin
            
                       /* led[0] = 0;
                       
                        led[1] = 0;
                        led[2] = 0;
                        led[3] = 0;
                        led[4] = 0;
                        led[5] = 0;
                        led[6] = 0;
                        led[7] = 0;
                        led[8] = 0;
                        led[9] = 0;
                        led[10] = 0;
                        led[11] = 0;
                        led[12] = 0;
                        led[13] = 0;
                        led[14] = 0;
                        led[15] = 0;*/
                        led = 0;
        end
         acc = acc + 1;
    end
    /*
    always @(negedge clk_out)
    begin
          if(bcc != bpm)
            begin
                bcc <= bcc + 1;
                
                            led[0] <= 1;
                            led[1] <= 1;
                            led[2] <= 1;
                            led[3] <= 1;
                            led[4] <= 1;
                            led[5] <= 1;
                            led[6] <= 1;
                            led[7] <= 1;
                            led[8] <= 1;
                            led[9] <= 1;
                            led[10] <= 1;
                            led[11] <= 1;
                            led[12] <= 1;
                            led[13] <= 1;
                            led[14] <= 1;
                            led[15] <= 1;
                //led = ~led;
    
                //bcc <= 0;
            end
           else
            begin
                acc <= 0;
                 led[0] <= 0;
                                       led[1] <= 0;
                                       led[2] <= 0;
                                       led[3] <= 0;
                                       led[4] <= 0;
                                       led[5] <= 0;
                                       led[6] <= 0;
                                       led[7] <= 0;
                                       led[8] <= 0;
                                       led[9] <= 0;
                                       led[10] <= 0;
                                       led[11] <= 0;
                                       led[12] <= 0;
                                       led[13] <= 0;
                                       led[14] <= 0;
                                       led[15] <= 0;
            end
    end
        */                                                                                                                                                                                                                                  
endmodule
