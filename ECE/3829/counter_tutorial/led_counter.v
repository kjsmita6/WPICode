`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 03:29:11 PM
// Design Name: 
// Module Name: led_counter
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


module led_counter(
    input clk,
    input reset_n,
    output reg [15:0] led_out
    );
    
    parameter C_MAX_COUNT = 10_000_000 - 1;
    
    wire update_ena;
    reg [23:0] count_value;
    
    assign update_ena = count_value == C_MAX_COUNT;
    
    always @ (posedge clk) begin
        if (reset_n == 1'b0 || count_value == C_MAX_COUNT) begin
            count_value <= 24'd0;
        end
        else begin
            count_value <= count_value + 24'd1;
        end
    end
    
    always @ (posedge clk) begin
        if (reset_n == 1'b0) begin
            led_out[15:0] <= 16'b1;
        end
        else if (update_ena == 1'b1) begin
            led_out[15:0] <= {led_out[14:0], led_out[15]};
        end
    end
    
endmodule
