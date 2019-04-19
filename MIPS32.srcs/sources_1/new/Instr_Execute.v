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
    
    output o_write_ce,
    output `RegBus o_write_addr,
    output `DataBus o_write_data    
    );
    wire EX_EXMEM_write_ce;
    wire `RegBus EX_EXMEM_write_addr;
    wire `DataBus EX_EXMEM_write_data;
    EX EX0(reset, op_type, sub_op_type, operand1, operand2, write_reg_ce, write_reg_addr, EX_EXMEM_write_ce, EX_EXMEM_write_addr, EX_EXMEM_write_data);
    EX_MEM EX_MEM0(clk, reset, EX_EXMEM_write_ce, EX_EXMEM_write_addr, EX_EXMEM_write_data, o_write_ce, o_write_addr, o_write_data);
endmodule
