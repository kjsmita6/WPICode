`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Kyle Smith
// 
// Create Date: 02/07/2021 04:19:45 PM
// Design Name: Lab 2
// Module Name: debouncer
// Project Name: Lab 2
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: Uses a 25 MHz timer to debounce button/switch inputs
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncer(
    input in, // input signal to debounce
    input clk_25MHz, // input 25 MHz clock
    input reset_n, // active low reset
    output reg out // debounced output
    );
    
    parameter C_MAX_COUNT = 18'd250_000 - 1; // 40 ns period * 250,000 = 10 ms
    reg [17:0] count;
    
    always @ (posedge clk_25MHz or negedge reset_n) begin
        if (reset_n == 1'b0 || out == in) begin
           count <= 18'b0;
        end
        else begin
            if (count == C_MAX_COUNT) begin
                out <= in;
            end
            else begin
                count <= count + 18'b1;
            end
        end
    end
    
endmodule
