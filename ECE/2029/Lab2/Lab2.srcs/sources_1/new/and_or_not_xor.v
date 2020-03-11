`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2019 08:16:20 AM
// Design Name: 
// Module Name: and_or_not_xor
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


module and_or_not_xor(
    input A,
    input B,
    input C,
    output outNAND,
    output outNOR,
    output outXNOR,
    output bufferC
    );
    
    assign outNAND = ~(A & B);
    assign outNOR = ~(A | B);
    assign outXNOR = ~(A ^ B);
    assign bufferC = ~(~C);
endmodule
