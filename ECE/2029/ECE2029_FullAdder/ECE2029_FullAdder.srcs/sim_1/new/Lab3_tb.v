`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2019 09:18:53 AM
// Design Name: 
// Module Name: Lab3_tb
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


module Lab3_tb(

    );
    reg aa,bb,cc;
    wire out1,out2;
    Full_Adder U1(aa,bb,cc,out1,out2);
    initial begin
        aa=0;
        bb=0;
        cc=0;
        #100;
        aa=1;
        #100;
        aa=0;
        bb=1;
        #100;
        aa=1;
        #100;
        cc=1;
        #100;
        cc=0;
        #1000;
    end
endmodule
