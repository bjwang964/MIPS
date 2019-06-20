`timescale 1ns / 1ps
`include "TestDefine.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/19 23:28:25
// Design Name: 
// Module Name: TestBench_Execute
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


module TestBench_Execute(

    );
     reg clk;
       reg reset;
       reg [2:0] op_type;
       reg [7:0] sub_op_type;
       reg `DataBus operand1;
       reg `DataBus operand2;
       reg write_reg_ce;
       reg `RegBus write_reg_addr;
       
       wire o_write_ce;
       wire  `RegBus o_write_addr;
       wire  `DataBus o_write_data;


       initial
       begin
           clk = 0;
           reset = `ResetDisable;
         	op_type = `Logic;
         	sub_op_type = `Or;
         	operand1 = 0;
         	operand2 = 1;
         	write_reg_ce = `ResetDisable;
         	write_reg_addr = `NonAddr;
         	
         	#5
         	clk = ~clk;
         	#10
         	clk = ~clk;
         	#10
         	op_type = 0;
         	sub_op_type = 0;
         	operand1 = 584;
         	operand2 = 66;
       end
       
	Instr_Execute Instr_Execute0(
		clk,
		reset,
		op_type,
		sub_op_type,
		operand1,
		operand2,
		write_reg_ce,
		write_reg_addr,
		o_write_ce,
		o_write_addr,
		o_write_data
		);
       
endmodule
