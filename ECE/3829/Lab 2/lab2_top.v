`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Kyle Smith
// 
// Create Date: 02/07/2021 10:50:53 PM
// Design Name: Lab 2
// Module Name: lab2_top
// Project Name: Lab 2
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: Top module for lab 2
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab2_top(
    input clk,              // input clock signal from board
    input btnC,             // center button for reset
    input btnL,             // left button for move function
    input [1:0] sw,         // 2 switches for VGA select
    output [3:0] an,        // anode bits for 7-segment displays (determiens which of 4 displays is on)
    output [6:0] seg,       // cathode bits for 7 segment display (determines what is displayed)
    output [3:0] vgaRed,    // red color bits for VGA
    output [3:0] vgaGreen,  // green color bits for VGA
    output [3:0] vgaBlue,   // blue color bits for VGA
    output Hsync,           // horizontal synch bit for VGA
    output Vsync            // vertical synch bit for VGA
    );
    
     // Maps a number to the bits needed to show this number on 7-seg display, display is active low (0 = segment on)
    parameter ZERO = 7'b1000000;
    parameter ONE = 7'b1111001;
    parameter TWO = 7'b0100100;
    parameter THREE = 7'b0110000;
    parameter FOUR = 7'b0011001;
    parameter FIVE = 7'b0010010;
    parameter SIX = 7'b0000010;
    parameter SEVEN = 7'b1111000;
    parameter EIGHT = 7'b0000000;
    parameter NINE = 7'b0010000;
    parameter A = 7'b0001000;
    parameter B = 7'b0000011;
    parameter C = 7'b1000110;
    parameter D = 7'b0100001;
    parameter E = 7'b0000110;
    parameter F = 7'b0001110;
    
    wire clk_25MHz;
    wire reset_n;
    wire [2:0] debounced;
    wire hs;
    wire vs;
    wire [10:0] hcount;
    wire [10:0] vcount;
    wire blank;
    
    clk_wiz_0 clk_wiz_0i(.clk_25MHz(clk_25MHz), .reset(btnC), .locked(reset_n), .clk_in1(clk));
    seven_seg seven_segi(.input_A(SEVEN), .input_B(ZERO), .input_C(FIVE), .input_D(FIVE), .clk_25MHz(clk_25MHz), .reset_n(reset_n),
                        .disp(seg), .an1(an));
    
    debouncer debounceri(.in(sw[1]), .clk_25MHz(clk_25MHz), .reset_n(reset_n), .out(debounced[2]));
    debouncer debounceri2(.in(sw[0]), .clk_25MHz(clk_25MHz), .reset_n(reset_n), .out(debounced[1]));
    debouncer debounceri3(.in(btnL), .clk_25MHz(clk_25MHz), .reset_n(reset_n), .out(debounced[0]));
    
    wire [11:0] rgb;
    vga_controller_640_60 vga_controlleri(.rst(~reset_n), .pixel_clk(clk_25MHz),
                                        .HS(Hsync), .VS(Vsync), .hcount(hcount), .vcount(vcount), .blank(blank));
    vga_select vga_selecti(.select(debounced[2:1]), .move(debounced[0]), .clk_25MHz(clk_25MHz), .reset_n(reset_n), .hcount(hcount), .vcount(vcount), .blank(blank), .rgb(rgb));
    assign vgaRed = rgb[11:8];
    assign vgaGreen = rgb[7:4];
    assign vgaBlue = rgb[3:0];
    
endmodule
