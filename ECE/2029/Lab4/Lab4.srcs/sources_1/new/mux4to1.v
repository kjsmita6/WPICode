`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2019 08:15:36 AM
// Design Name: 
// Module Name: mux4to1
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


module mux4to1(
    input[3:0] A,
    input[3:0] B,
    input[3:0] C, // ??
    input[3:0] D,
    input[1:0] sel,
    output[3:0] Y
    );
    
    assign Y = (sel == 0) ? A : (sel == 1) ? B : (sel == 2) ? C : D;
endmodule
