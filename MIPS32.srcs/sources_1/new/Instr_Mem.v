`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 23:12:48
// Design Name: 
// Module Name: Instr_Mem
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


module Instr_Mem(
	input reset,
	input clk,
	input i_write_reg_ce,
	input `RegBus i_write_reg_addr,
	input `DataBus i_write_reg_data,
	input i_wb_mem,
	
	input i_we_hi,
	input i_we_lo,
	input `DataBus i_hi_data,
	input `DataBus i_lo_data,
	
	output o_write_reg_ce,
	output `RegBus o_write_reg_addr,
	output `DataBus o_write_reg_data,
	output  o_wb_mem,
	output `RegBus o_wb_addr,
	output `DataBus o_wb_data,
	
	output  o_we_hi,
	output  o_we_lo,
	output  `DataBus o_hi_data,
	output  `DataBus o_lo_data,
	output  `DataBus o_E_hi_data,
	output  `DataBus o_E_lo_data,
	output  o_E_we_hi,
	output  o_E_we_lo
    );
    wire write_reg_ce;
    wire `RegBus write_reg_addr;
    wire `DataBus write_reg_data;
    wire MMW_we_hi;
    wire MMW_we_lo;
    wire`DataBus MMW_hi_data;
    wire`DataBus MMW_lo_data;
    assign o_E_hi_data = MMW_hi_data;
    assign o_E_lo_data = MMW_lo_data;
    assign o_E_we_hi = i_we_hi;
    assign o_E_we_lo = i_we_lo;
    
    
    MEM MEM0(reset, i_write_reg_ce,i_write_reg_addr, i_write_reg_data,i_wb_mem,i_we_hi, i_we_lo, i_hi_data,i_lo_data, 
    			write_reg_ce, write_reg_addr,write_reg_data, o_wb_mem, o_wb_addr, o_wb_data, MMW_we_hi, MMW_we_lo, MMW_hi_data, MMW_lo_data);
    MEM_WB MEM_WB0(reset,clk,  
    			   write_reg_ce, write_reg_addr, write_reg_data,
    			   MMW_we_hi, MMW_we_lo, MMW_hi_data, MMW_lo_data,
    				o_write_reg_ce, o_write_reg_addr, o_write_reg_data, 
    				o_we_hi, o_we_lo, o_hi_data,o_lo_data);
endmodule
