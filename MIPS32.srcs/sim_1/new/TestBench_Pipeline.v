`timescale 1ns / 1ps
`include "TestDefine.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 23:50:29
// Design Name: 
// Module Name: TestBench_Pipeline
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


module TestBench_Pipeline(

    );
    reg reset;
    reg clk;
    initial
    begin
    	clk = 0;
    	reset = `ResetDisable;
    	#10
    	clk = ~clk;
    	#10
    	clk = ~clk;
    	#10
    	clk = ~clk;
    	#10
    	clk = ~clk;
    	#10
    	clk = ~clk;
    	#10
    	clk = ~clk;
    	#10
    	clk = ~clk;
    	#10
    	clk = ~clk;
    	#10
    	clk = ~clk;
    	#10
    	clk = ~clk;
//    	#10
//    	clk = ~clk;
//    	#10
//    	clk = ~clk;
    end
    
    Pipeline Pipeline0(clk, reset);
endmodule
