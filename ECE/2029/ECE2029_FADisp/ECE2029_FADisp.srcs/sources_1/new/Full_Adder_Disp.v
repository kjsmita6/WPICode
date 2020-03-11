`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2019 10:24:05 AM
// Design Name: 
// Module Name: Full_Adder_Disp
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


module Full_Adder_Disp(
    input [3:0] A,
    input [3:0] B,
    output [6:0] Seg,
    output OF,
    output An0
    );
    
    wire [3:0] Sum;
    
    Full_Adder_4bit_2sComplement_Lab3 FA(A, B, Sum, OF);
    Seven_seg_Disp(Sum, Seg);
endmodule
