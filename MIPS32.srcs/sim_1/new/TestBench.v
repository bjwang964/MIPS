`timescale 1ns / 1ps
`include "TestDefine.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/04 20:56:11
// Design Name: 
// Module Name: test_bench
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


module TestBench( );
	reg i_clk;
	reg i_reset;
	reg i_write_reg_ce;
	reg `RegBus i_write_reg_addr;
	reg `DataBus i_write_reg_data;
	
	
	wire `InstrBus FD_Instr;
	wire  `DataBus DE_operand1;
	wire  `DataBus DE_operand2;
	wire  [2:0] DE_op_type;
	wire  [7:0] DE_sub_op_type;
	wire DE_write_reg_ce;
	wire `RegBus DE_write_reg_addr;
	wire o_write_ce;
	wire  `RegBus o_write_addr;
	wire  `DataBus o_write_data;

    
    initial
    begin
    	i_clk = 0;
    	i_reset = `ResetDisable;
    	i_write_reg_ce = 0;
    	i_write_reg_addr = 0;
    	i_write_reg_data = 0;
    	
    	#20
    	i_clk = ~i_clk;
    	#20
    	i_clk = ~i_clk;
    	#20
    	i_clk = ~i_clk;
    	#20
    	i_clk = ~i_clk;
    	#20
    	i_clk = ~i_clk;
    	#20
    	i_clk = ~i_clk;
    end
    
    Instr_Fetch Instr_Fetch1(
     i_clk,
     i_reset,
     FD_Instr
    );
    Instr_Decode Instr_Decode1(
     i_clk,
     i_reset,
      FD_Instr,
     i_write_reg_ce,
      i_write_reg_addr,
      i_write_reg_data,
	   DE_operand1,
        DE_operand2,
         DE_op_type,
         DE_sub_op_type,
       DE_write_reg_ce,
        DE_write_reg_addr
    );
    
    	Instr_Execute Instr_Execute1(
    	 i_clk,
    	i_reset,
    	DE_op_type,
    	DE_sub_op_type,
    	DE_operand1,
    	DE_operand2,
    	DE_write_reg_ce,
    	DE_write_reg_addr,
    	o_write_ce,
    	o_write_addr,
    	o_write_data
    	);
    

   
endmodule
