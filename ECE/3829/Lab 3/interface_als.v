`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Worcester Polytechnic Institute
// Engineer: Kyle Smith
// 
// Create Date: 02/22/2021 05:01:27 PM
// Design Name: Lab 3
// Module Name: interface_als
// Project Name: Lab 3
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: Interface with the ALS module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module interface_als(
    input clk_10MHz, // 10 MHz clock
    input reset_n,  // active low reset
    input start,    // start flag from controller
    input miso,     // input bit from ALS
    output done,    // done flag to controller
    output reg sclk,    // serial clock to ALS
    output cs_n,        // active low chip select to ALS
    output reg [15:0] data_out  // output data bits
    );

    // SCLK Setup
    parameter C_TERM_COUNT = 3'd7; // 1.42 MHz SCLK
    parameter C_RISING_EDGE = 3'd0; // 50% duty cycle
    parameter C_FALLING_EDGE = 3'd4;
    
    reg [2:0] count;
    assign rising_edge = (count == C_RISING_EDGE ? 1'b1 : 1'b0);
    assign falling_edge = (count == C_FALLING_EDGE ? 1'b1 : 1'b0);
    
    // Sampling signals/count
    reg [4:0] num_samples = 5'b0;
    
    assign done = (num_samples == 5'd16 ? 1'b1 : 1'b0);
    assign cs_n = ~start;

    always @ (posedge clk_10MHz) begin
        if (reset_n == 1'b0) begin
            count <= 3'd0;
        end
        else begin
            if (count == C_TERM_COUNT) begin
                count <= 3'd0;
            end
            else begin
                count <= count + 3'd1;
            end
        end    
    end
    
    always @ (posedge clk_10MHz) begin
        if (reset_n == 1'b0) begin
            sclk <= 1'b0;
        end
        else begin
            if (rising_edge == 1'b1) begin
                sclk <= 1'b1;
            end
            else if (falling_edge == 1'b1) begin
                sclk <= 1'b0;
            end
        end
    end
    
    always @ (posedge clk_10MHz) begin
        if (num_samples == 5'd16) begin
            num_samples <= 5'd0;
        end
        if (reset_n == 1'b0) begin
            data_out <= 15'b0;
            num_samples <= 5'd0;
        end
        else begin
            if (rising_edge == 1'b1 && start == 1'b1) begin
//                if (num_samples == 5'd16) begin
//                    num_samples <= 5'd0;
//                end
//                else begin
                    data_out[15:0] <= { data_out[14:0], miso };
                    num_samples <= num_samples + 5'd1;
//                end
            end
            else begin
//                num_samples <= 5'd0;
                data_out <= data_out;
            end
        end
    end

endmodule
