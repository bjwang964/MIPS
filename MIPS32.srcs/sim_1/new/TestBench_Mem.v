`timescale 1ns / 1ps
`include "TestDefine.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 21:24:50
// Design Name: 
// Module Name: TestBench_Mem
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


module TestBench_Mem(

    );
    reg reset;
	reg clk;
    reg i_write_reg_ce;
    reg `RegBus i_write_reg_addr;
    reg `DataBus i_write_reg_data;
    wire o_write_reg_ce;
    wire `RegBus o_write_reg_addr;
    wire `DataBus o_write_reg_data;
    
    initial
    begin
    	i_write_reg_ce = 0;
    	i_write_reg_addr = 1;
    	i_write_reg_data = 1;
    	reset = `ResetDisable;
    	clk = 0;
    	#10
    	clk = ~clk;
    	
    	
    	#10
    	clk = ~clk;
    end
    
    Instr_Mem Instr_Mem0
    (
    reset,
	clk,
	i_write_reg_ce,
	 i_write_reg_addr,
       i_write_reg_data,
      o_write_reg_ce,
      o_write_reg_addr,
       o_write_reg_data
    );
endmodule
