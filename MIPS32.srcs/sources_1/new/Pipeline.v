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
    //取指连译码
    wire `InstrBus FD_Instr;
    
    //写回连寄存器
    wire WF_write_reg_ce;
    wire `RegBus WF_write_reg_addr;
    wire `DataBus WF_write_reg_data;
    
    //译码连执行
    wire  `DataBus DE_operand1;
    wire  `DataBus DE_operand2;
    wire  [2:0] DE_op_type;
    wire  [7:0] DE_sub_op_type;
    wire DE_write_reg_ce;
    wire `RegBus DE_write_reg_addr;
    wire DE_wb_ex;
    wire DE_wb_mem;
    
    //执行连访存
    wire EM_write_ce;
    wire `RegBus EM_write_addr;
    wire `DataBus EM_write_data;
    wire EM_wb_mem;
    
    //访存连写回
    wire MW_write_reg_ce;
    wire `RegBus MW_write_reg_addr;
    wire `DataBus MW_write_reg_data;
    
    //执行数据旁路
    wire ED_wb_ex;
    wire `RegBus ED_write_addr;
    wire `DataBus ED_write_data;
    
    //访存数据旁路
    wire MD_wb_mem;
    wire `RegBus MD_write_addr;
    wire `DataBus MD_write_data;
    
    Instr_Fetch Instr_Fetch0
    (
    	clk,reset,
    	FD_Instr
    );
    	
    Instr_Decode Instr_Decode0
    (
    	clk,reset,FD_Instr,WF_write_reg_ce,WF_write_reg_addr, WF_write_reg_data,
    	DE_operand1, DE_operand2, DE_op_type, DE_sub_op_type, DE_write_reg_ce, DE_write_reg_addr,DE_wb_ex, DE_wb_mem,
    	ED_wb_ex, ED_write_addr, ED_write_data,
    	MD_wb_mem,MD_write_addr, MD_write_data
    	
    );

    Instr_Execute Instr_Execute0
    (
    	clk,reset,DE_op_type, DE_sub_op_type,DE_operand1, DE_operand2,DE_write_reg_ce, DE_write_reg_addr,DE_wb_ex, DE_wb_mem,
    	EM_write_ce, EM_write_addr,EM_write_data,
    	ED_wb_ex, EM_wb_mem, ED_write_addr, ED_write_data
    );
    
    Instr_Mem Instr_Mem0
    (
    	reset,clk,EM_write_ce, EM_write_addr,EM_write_data,EM_wb_mem,
    	MW_write_reg_ce,MW_write_reg_addr, MW_write_reg_data,MD_wb_mem,MD_write_addr, MD_write_data
    );
    Instr_WB Instr_WB0
    (
    	reset,clk,MW_write_reg_ce, MW_write_reg_addr,MW_write_reg_data,
    	WF_write_reg_ce,WF_write_reg_addr, WF_write_reg_data
    );
endmodule
