`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Worcester Polytechnic Institute
// Engineer: Kyle Smith
// 
// Create Date: 02/22/2021 05:32:16 PM
// Design Name: Lab 3
// Module Name: controller_als
// Project Name: Lab 3
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: State machine controller for the ALS module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller_als
#(parameter SAMPLE_TERM_CNT_SIZE = 24, parameter SAMPLE_TERM_CNT = 10_000_000)( // default sample time of 1 second
    input clk_10MHz, // 10 MHZ clock
    input reset_n,  // active low reset
    input done,     // done flag from interface, signals conversion is complete
    output reg start    // start flag to interface, signals to start a conversion
    );
   
    localparam S_IDLE = 2'b00;
    localparam S_START = 2'b01;
    localparam S_WAIT = 2'b10;
    localparam S_DONE = 2'b11;
    
    reg [1:0] current_state;
    reg [1:0] next_state;
    reg [SAMPLE_TERM_CNT_SIZE - 1: 0] count;
    assign ready = count == SAMPLE_TERM_CNT ? 1'b1 : 1'b0;
   
    always @ (posedge clk_10MHz) begin
        if (reset_n == 1'b0) begin
            current_state <= S_IDLE;
            count <= 1'b0;
        end
        else begin
            current_state <= next_state;
            if (count == SAMPLE_TERM_CNT) begin
                count <= 1'b0;
            end
            else begin
                count <= count + 1'b1;
            end
        end
    end
    
    always @ (*) begin
        case (current_state)
            S_IDLE: begin
                start = 1'b0;
                if (ready == 1'b1) begin
                    next_state = S_START;
                end
                else begin
                    next_state = S_IDLE;
                end
            end
            S_START: begin
                start = 1'b1;
                next_state = S_WAIT;
            end
            S_WAIT: begin
                start = 1'b1;
                if (done != 1'b1) begin
                   next_state = S_WAIT;
                end
                else begin
                    next_state = S_DONE;
                end
            end
            S_DONE: begin
                start = 1'b0;
                next_state = S_IDLE;
            end
        endcase
    end
   
endmodule
