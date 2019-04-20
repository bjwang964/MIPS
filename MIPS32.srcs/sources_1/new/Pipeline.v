`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 23:39:11
// Design Name: 
// Module Name: Pipeline
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


module Pipeline(
    input clk,
    input reset
    );
    wire `InstrBus FD_Instr;
    
    wire MW_write_reg_ce;
    wire `RegBus MW_write_reg_addr;
    wire `DataBus MW_write_reg_data;
    
    wire  `DataBus DE_operand1;
    wire  `DataBus DE_operand2;
    wire  [2:0] DE_op_type;
    wire  [7:0] DE_sub_op_type;
    wire DE_write_reg_ce;
    wire `RegBus DE_write_reg_addr;
    
    wire EM_write_ce;
    wire `RegBus EM_write_addr;
    wire `DataBus EM_write_data;
    
    Instr_Fetch Instr_Fetch0
    (
    	clk,reset,
    	FD_Instr
    );
    	
    Instr_Decode Instr_Decode0
    (
    	clk,reset,FD_Instr,MW_write_reg_ce,MW_write_reg_addr, MW_write_reg_data,
    	DE_operand1, DE_operand2, DE_op_type, DE_sub_op_type, DE_write_reg_ce, DE_write_reg_addr
    );
    
    Instr_Execute Instr_Execute0
    (
    	clk,reset,DE_op_type, DE_sub_op_type,DE_operand1, DE_operand2,DE_write_reg_ce, DE_write_reg_addr,
    	EM_write_ce, EM_write_addr,EM_write_data
    );
    
    Instr_Mem Instr_Mem0
    (
    	clk,reset,EM_write_ce, EM_write_addr,EM_write_data,
    	MW_write_reg_ce,MW_write_reg_addr, MW_write_reg_data
    );
endmodule
