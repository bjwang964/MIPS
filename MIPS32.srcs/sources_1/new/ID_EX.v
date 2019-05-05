`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 23:09:11
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
        input clk,
        input reset,
        
        input  `DataBus i_operand1,
        input  `DataBus i_operand2,
        input  [2:0] i_op_type,
        input  [7:0] i_sub_op_type,
        input i_write_reg_ce,
        input `RegBus i_write_reg_addr,
    	input i_wb_ex,
        input i_wb_mem,
        input i_we_hi,
        input i_we_lo,
           

        output reg `DataBus o_operand1,
        output reg `DataBus o_operand2,
        output reg [2:0] o_op_type,
        output reg [7:0] o_sub_op_type,
        output reg o_write_reg_ce,
        output reg `RegBus o_write_reg_addr,
    	output reg o_wb_ex,
        output reg o_wb_mem,
        output reg o_we_hi,
        output reg o_we_lo
    );
    
    always @ (posedge clk)
    begin
        o_operand1 = i_operand1;
        o_operand2 = i_operand2;
        o_op_type = i_op_type;
        o_sub_op_type = i_sub_op_type;
        o_write_reg_ce = i_write_reg_ce;
        o_write_reg_addr = i_write_reg_addr;
        o_wb_ex = i_wb_ex;
        o_wb_mem = i_wb_mem;
        o_we_hi = i_we_hi;
        o_we_lo = i_we_lo;
    end
    
    
endmodule
