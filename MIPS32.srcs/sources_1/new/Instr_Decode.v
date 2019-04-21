`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/16 23:04:27
// Design Name: 
// Module Name: Instr_Decode
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


module Instr_Decode(
    input i_clk,
    input i_reset,
    input `InstrBus i_instr,
    input i_write_reg_ce,
    input `RegBus i_write_reg_addr,
    input `DataBus i_write_reg_data,
    
    output  `DataBus o_operand1,
    output  `DataBus o_operand2,
    output  [2:0] o_op_type,
    output  [7:0] o_sub_op_type,
    output o_write_reg_ce,
    output `RegBus o_write_reg_addr
    );
    //Decoder与register公用信号
    wire read_reg_ce1;
    wire read_reg_ce2;
    wire `RegBus read_reg_addr1;
    wire `RegBus read_reg_addr2;
    wire `DataBus read_reg_data1;
    wire `DataBus read_reg_data2;
    
    //Decoder与ID/EX公用信号
    wire `DataBus t_operand1;
    wire `DataBus t_operand2;
    wire [2:0] t_op_type;
    wire [7:0] t_sub_op_type;
    wire t_write_reg_ce;
    wire `RegBus t_write_reg_addr;
    
    Decoder Decoder0(i_reset,i_instr,
                     read_reg_data1, read_reg_data2,
                     read_reg_ce1, read_reg_ce2, t_write_reg_ce,
                     read_reg_addr1, read_reg_addr2, t_write_reg_addr,
                     t_op_type, t_sub_op_type, t_operand1, t_operand2);
    Regiters Regiters0(i_reset,
                       read_reg_ce1, read_reg_addr1, read_reg_data1,
                       read_reg_ce2, read_reg_addr2, read_reg_data2,
                       i_write_reg_ce, i_write_reg_addr,i_write_reg_data);
    ID_EX ID_EX0(i_clk,
                 i_reset,
                 t_operand1,
                 t_operand2,
                 t_op_type,
                 t_sub_op_type,
                 t_write_reg_ce,
                 t_write_reg_addr,
                 
                 o_operand1,
                 o_operand2,
                 o_op_type,
                 o_sub_op_type,
                 o_write_reg_ce,
                 o_write_reg_addr
                    );
endmodule
