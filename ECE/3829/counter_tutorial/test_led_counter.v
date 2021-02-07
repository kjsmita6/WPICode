`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 03:44:12 PM
// Design Name: 
// Module Name: test_led_counter
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


module test_led_counter(

    );
    
    reg btnC;
    reg clk_100m;
    wire [15:0] led;
    
    parameter C_CLK_HALF_PERIOD = 5;
    
    always begin
        # C_CLK_HALF_PERIOD clk_100m <= ~clk_100m;
    end
    
    initial begin
        clk_100m = 1'b0;
        btnC = 1'b1;
        # 2000 btnC = 1'b0;
        
        # 200000
        $stop;
    end
    
    counter_top uuti(.clk(clk_100m), .btnC(btnC), .led(led));
    
    defparam uuti.led_counteri.C_MAX_COUNT = 100;
    
    
endmodule
