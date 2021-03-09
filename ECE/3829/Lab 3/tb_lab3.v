`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Worcester Polytechnic Institute
// Engineer: Kyle Smith
// 
// Create Date: 03/01/2021 09:37:47 AM
// Design Name: Lab 3
// Module Name: tb_lab3
// Project Name: Lab 3
// Target Devices: Basys-3
// Tool Versions: Vivado 2020.2
// Description: ALS interface testbench and sensor model
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_lab3(

    );
    
    parameter C_CLK_HALF_PERIOD = 50;
    reg clk_10MHz;
    reg btnC;
    assign reset_n = ~btnC;
    
    always begin
        # C_CLK_HALF_PERIOD clk_10MHz <= ~clk_10MHz;
    end
    
    wire sclk;
    wire cs_n;
    
    // 4 Different samples
    parameter C_SAMPLE_1 = 15'b000_11010010_0000;
    parameter C_SAMPLE_2 = 15'b000_01101111_0000;
    parameter C_SAMPLE_3 = 15'b000_11111111_0000;
    parameter C_SAMPLE_4 = 15'b000_10000001_0000;
    reg sdo;
    
    wire start;
    wire done;
    wire [15:0] sample;
    
    
    initial begin
        clk_10MHz = 1'b0;
        btnC = 1'b1;
        #100 btnC = 1'b0;
        #40;
        @ (posedge start);
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        #400
        if (sample != C_SAMPLE_1) begin
            $display("FAIL: Expected %h, Actual %h", C_SAMPLE_1, sample);
        end
        else begin
            $display("PASS: Sample 1 %h", sample);
        end

        @ (posedge start);
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        #400
        if (sample != C_SAMPLE_2) begin
            $display("FAIL: Expected %h, Actual %h", C_SAMPLE_2, sample);
        end
        else begin
            $display("PASS: Sample 2 %h", sample);
        end
        
        @ (posedge start);
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        #400
        if (sample != C_SAMPLE_3) begin
            $display("FAIL: Expected %h, Actual %h", C_SAMPLE_3, sample);
        end
        else begin
            $display("PASS: Sample 3 %h", sample);
        end
        
        @ (posedge start);
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 1;
        @ (negedge sclk);
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        @ (negedge sclk);
        #40
        sdo = 0;
        #400
        if (sample != C_SAMPLE_4) begin
            $display("FAIL: Expected %h, Actual %h", C_SAMPLE_4, sample);
        end
        else begin
            $display("PASS: Sample 4 %h", sample);
        end
        

        #32_000_000
        $stop;
    end
    
    controller_als #(.SAMPLE_TERM_CNT(10_000), .SAMPLE_TERM_CNT_SIZE(14)) state(.clk_10MHz(clk_10MHz), .reset_n(reset_n), .start(start), .done(done));
    interface_als uuti(.clk_10MHz(clk_10MHz), .reset_n(reset_n), .start(start), .miso(sdo), .done(done), .sclk(sclk), .cs_n(cs_n), .data_out(sample));
    
endmodule
