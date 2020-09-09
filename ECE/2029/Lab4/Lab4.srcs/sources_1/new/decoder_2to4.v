`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2019 08:20:21 AM
// Design Name: 
// Module Name: decoder_2to4
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


module decoder_2to4(
    input[1:0] en,
    output reg[3:0] an
    );
    always @(en) begin
        case (en)
            0: an = 4'b1110;
            1: an = 4'b1101;
            2: an = 4'b1011;
            3: an = 4'b0111; // left bit = 1 to turn LED off
        endcase
    end
endmodule
