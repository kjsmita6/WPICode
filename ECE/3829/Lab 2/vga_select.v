`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Kyle Smith
// 
// Create Date: 02/07/2021 04:38:53 PM
// Design Name: Lab 2
// Module Name: vga_select
// Project Name: Lab 2
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: VGA select module, displays different things depending on select/move inputs
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga_select(
    input [1:0] select,     // switches to select mode
    input move,             // button to create a moving box
    input clk_25MHz,        // 25 MHz clock
    input reset_n,          // active-low reset
    input [10:0] hcount,    // horizontal counter for VGA
    input [10:0] vcount,    // vertical counter for VGA
    input blank,            // blank bit for VGA
    output reg [11:0] rgb   // output RGB colors to VGA
    );
    
    // The following are the RGB color codes that are used. Each has 4 red bits, 4 green bits, and 4 blue bits - in that order.
    parameter WHITE = 12'b1111_1111_1111;
    parameter BLACK = 12'b0000_0000_0000;
    parameter RED = 12'b1111_0000_0000;
    parameter GREEN = 12'b0000_1111_0000;
    parameter BLUE = 12'b0000_0000_1111;
    parameter PURPLE = 12'b1111_0000_1111;
    
    // Maximum screen dimensions
    parameter MAX_WIDTH = 10'd639;
    parameter MAX_HEIGHT = 9'd479;

    parameter CLK_MAX_CNT = 24'd12_500_000 - 1; // 40 ns * 12,500,000 = 0.5 seconds (2 Hz)
    reg [23:0] count;
    reg [9:0] blockPos = 10'b0;
    reg backwards = 1'b0;

    always @ (posedge clk_25MHz or negedge reset_n) begin
        if (reset_n == 1'b0) begin
            count <= 24'b0;
            blockPos <= 10'b0;
            backwards <= 1'b0;
        end
        else begin
            if (backwards == 1'b0 && blockPos >= MAX_WIDTH) begin
                backwards <= 1'b1;
            end
            else if (backwards == 1'b1 && blockPos <= 0) begin
                backwards <= 1'b0;
            end
            if (count == CLK_MAX_CNT) begin
                count <= 24'b0;
                if (move == 1'b1) begin
                    if (backwards == 1'b0) begin
                        blockPos <= blockPos + 10'd16;
                    end
                    else begin
                        blockPos <= blockPos - 10'd16;
                    end
                end
            end
            else begin
                count <= count + 24'b1;
            end
        end
    end

    always @ (*) begin
        if (blank == 1'b0) begin
            if (move == 1'b1) begin
                if ((vcount > MAX_HEIGHT / 2 - 8 && vcount < MAX_HEIGHT / 2 + 8)) begin
                    if ((backwards == 1'b0 && hcount > blockPos && hcount < blockPos + 16) || (backwards == 1'b1 && hcount < blockPos && hcount > blockPos - 16)) begin
                        rgb <= WHITE;
                    end
                    else begin
                        rgb <= BLACK;
                    end
                end
                else begin
                    rgb <= BLACK;
                end
            end
            else begin
                case (select)
                    2'b00: rgb <= BLUE; // whole screen is blue
                    2'b01:
                    begin
                        if (hcount[5] == 1'b1) begin // 32 pixel wide strips, alternating green and purple
                            rgb <= GREEN;
                        end
                        else begin
                            rgb <= PURPLE;
                        end
                    end
                    2'b10:
                    begin
                        if (hcount > MAX_WIDTH - 9'd64 && vcount > MAX_HEIGHT - 9'd64) begin // 64x64 red square in bottom right corner
                            rgb <= RED;
                        end
                        else begin
                            rgb <= BLACK;
                        end
                    end
                    2'b11:
                    begin
                        if (hcount < 10'd16) begin // 16 pixel wide white strip on left side of screen
                            rgb <= WHITE;
                        end
                        else begin
                            rgb <= BLACK;
                        end
                    end 
                endcase
            end
        end
        else begin
            rgb <= BLACK;
        end
    end
    
endmodule
