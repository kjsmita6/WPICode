`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2019 08:11:12 AM
// Design Name: 
// Module Name: slowclock
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


module slowclock(
    input clk_in,
    output reg clk_out
    );
    
    reg[25:0] period_count = 0;
    always @ (posedge clk_in)
        if(period_count != 111000000 - 1)
            begin
                period_count <= period_count + 1;
                clk_out <= 0;
            end
        else
            begin
                period_count <= 0;
                clk_out <= 1;
            end
endmodule
