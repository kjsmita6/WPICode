`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Kyle Smith
// 
// Create Date: 01/28/2021 12:46:07 PM
// Design Name: input_select
// Module Name: input_select
// Project Name: Lab 1
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: Determines what is dispalyed on the 7-segment display (depends on the value of select)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module input_select(
    input [1:0] select, // mode selection, sw[15:14]
    input [13:0] sw1, // 14 switch inputs
    output reg [3:0] display_A, // A screen display value
    output reg [3:0] display_B, // B screen display value
    output reg [3:0] display_C, // C screen display value
    output reg [3:0] display_D // D screen display value
    );

    wire [4:0] sum = sw1[7:4] + sw1[3:0];
    wire [7:0] product = sw1[7:4] * sw1[3:0];
    
    always @ (*) begin
        case (select)
            2'b00: display_A = sw1[13:12];
            2'b01: display_A = 4'b0111;
            2'b10: display_A = sw1[7:4];
            2'b11: display_A = sw1[7:4];
        endcase
        
        case (select)
            2'b00: display_B = sw1[11:8];
            2'b01: display_B = 4'b0000;
            2'b10: display_B = sw1[3:0];
            2'b11: display_B = sw1[3:0];
        endcase
        
        case (select)
            2'b00: display_C = sw1[7:4];
            2'b01: display_C = 4'b0101;
            2'b10: display_C = sum[4];
            2'b11: display_C = product[7:4];
        endcase
        
        case (select)
            2'b00: display_D = sw1[3:0];
            2'b01: display_D = 4'b0101;
            2'b10: display_D = sum[3:0];
            2'b11: display_D = product[3:0];
        endcase
    end
endmodule
