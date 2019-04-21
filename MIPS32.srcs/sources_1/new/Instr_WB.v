`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 23:10:37
// Design Name: 
// Module Name: Instr_WB
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


module Instr_WB(
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
    
        WB WB0(reset, i_write_reg_ce,i_write_reg_addr, i_write_reg_data, 
    			write_reg_ce, write_reg_addr,write_reg_data );
    WB_Reg WB_Reg0(reset,clk,  write_reg_ce, write_reg_addr, write_reg_data,
    				o_write_reg_ce, o_write_reg_addr, o_write_reg_data);
endmodule
