`timescale 1ns / 1ps
`include "Define.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/19 16:20:54
// Design Name: 
// Module Name: Instr_Execute
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


module Instr_Execute(
	input clk,
	input reset,
    input [2:0] op_type,
    input [7:0] sub_op_type,
    input `DataBus operand1,
    input `DataBus operand2,
    input write_reg_ce,
    input `RegBus write_reg_addr,
    input i_wb_ex,
    input i_wb_mem,
    
    input i_we_hi,
    input i_we_lo,
    input `DataBus i_hi_data,
    input `DataBus i_lo_data,
    input `DataBus mem_hi_data,
    input `DataBus mem_lo_data,
    input mem_wb_hi,
    input mem_wb_lo,
    
    output o_write_ce,
    output `RegBus o_write_addr,
    output `DataBus o_write_data,   
    output o_wb_ex,
    output o_wb_mem,
    
    output `RegBus o_wb_addr,
    output `DataBus o_wb_data,
    
    output  o_we_hi,
    output  o_we_lo,
    output `DataBus o_hi_data,
    output `DataBus o_lo_data
    );
    wire EX_EXMEM_write_ce;
    wire `RegBus EX_EXMEM_write_addr;
    wire `DataBus EX_EXMEM_write_data;
    
    wire  EX_EXMEM_we_hi;
    wire  EX_EXMEM_we_lo;
    wire `DataBus EX_EXMEM_hi_data;
    wire `DataBus EX_EXMEM_lo_data;
    
    EX EX0(reset, op_type, sub_op_type, operand1, operand2, write_reg_ce, write_reg_addr,i_wb_ex, i_we_hi, i_we_lo,
    	   i_hi_data, i_lo_data, mem_hi_data, mem_lo_data, mem_wb_hi, mem_wb_lo,
    	   EX_EXMEM_write_ce, EX_EXMEM_write_addr, EX_EXMEM_write_data,
    	   o_wb_ex, o_wb_addr, o_wb_data,
    	   EX_EXMEM_we_hi, EX_EXMEM_we_lo, EX_EXMEM_hi_data, EX_EXMEM_lo_data);
    EX_MEM EX_MEM0(clk, reset,
    			   EX_EXMEM_write_ce, EX_EXMEM_write_addr, EX_EXMEM_write_data, i_wb_mem, EX_EXMEM_we_hi, EX_EXMEM_we_lo, EX_EXMEM_hi_data, EX_EXMEM_lo_data,
    			   o_write_ce, o_write_addr, o_write_data, o_wb_mem, o_we_hi, o_we_lo, o_hi_data, o_lo_data);
    
endmodule
