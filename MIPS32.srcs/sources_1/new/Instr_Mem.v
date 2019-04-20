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
	output o_write_reg_ce,
	output `RegBus o_write_reg_addr,
	output `DataBus o_write_reg_data
    );
    wire write_reg_ce;
    wire `RegBus write_reg_addr;
    wire `DataBus write_reg_data;
    
    MEM MEM0(reset, i_write_reg_ce,i_write_reg_addr, i_write_reg_data, 
    			write_reg_ce, write_reg_addr,write_reg_data );
    MEM_WB MEM_WB0(reset,clk,  write_reg_ce, write_reg_addr, write_reg_data,
    				o_write_reg_ce, o_write_reg_addr, o_write_reg_data);
endmodule
