`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2019 09:10:51 AM
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );
    
    assign Sum = (~A & ~B & Cin) | (~A & B & ~Cin) | ( A & ~B & ~Cin) | ( A & B & Cin);
    assign Cout = (A & Cin) | (B & Cin) | (A & B);
endmodule
