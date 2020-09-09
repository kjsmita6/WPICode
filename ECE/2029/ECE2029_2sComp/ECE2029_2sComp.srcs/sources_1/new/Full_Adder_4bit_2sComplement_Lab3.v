`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2019 09:42:52 AM
// Design Name: 
// Module Name: Full_Adder_4bit_2sComplement_Lab3
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


module Full_Adder_4bit_2sComplement_Lab3(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum,
    output OF_S,
    output C_MSB
    );
    wire [3:0] C_Out;
    wire [3:0] Sum;
    
    Full_Adder U0(A[0], B[0], 0, Sum[0], C_Out[0]);
    Full_Adder U1(A[1], B[1], C_Out[0], Sum[1], C_Out[1]);
    Full_Adder U2(A[2], B[2], C_Out[1], Sum[2], C_Out[2]);
    Full_Adder U3(A[3], B[3], C_Out[2], Sum[3], C_Out[3]);
    assign OF_S = ~A[3] & ~B[3] & C_Out[2] | A[3] & B[3] & ~C_Out[2];
    assign C_MSB = C_Out[3];
endmodule
