`timescale 1ns / 1ps
`include "TestDefine.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/19 22:26:56
// Design Name: 
// Module Name: TestBench_Fetch
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


module TestBench_Fetch(

    );
	reg clk;
	reg reset;
	wire `InstrBus Instr;
	
	initial
	begin
		clk = 0;
		reset = `ResetDisable;
		#5
		clk = ~clk;
		#10
		clk = ~clk;
	end
	Instr_Fetch Instr_Fetch0(
		clk,
		reset,
		Instr
	);
endmodule
