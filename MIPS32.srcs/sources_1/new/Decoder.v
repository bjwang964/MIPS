`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/08 22:07:55
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input reset,
    //读取指令信息
    input `InstrBus instr,
    input `DataBus read_reg_data1,
    input `DataBus read_reg_data2,
    //读写寄存器使能
    output reg read_reg_ce1,
    output reg read_reg_ce2,
    output reg write_reg_ce,
    //读写寄存器地址
    output reg `RegBus read_reg_addr1,
    output reg `RegBus read_reg_addr2,
    output reg `RegBus write_reg_addr,
    //操作类型及操作数
    output reg [2:0] op_type,
    output reg [7:0] sub_op_type,
    output reg `DataBus operand1,
    output reg `DataBus operand2
    );
    
    wire [5:0] op = instr[31:26];
    wire [4:0] rs = instr[25:21];
    wire [4:0] rt = instr[20:16];
    wire [15:0] imm = instr[15:0];
    
    
    always @ (*)
    begin
        if(reset == `ResetEnable)
        begin
            //复位
            read_reg_addr1 = `Non5;
            read_reg_addr2 = `Non5;
            write_reg_addr = `Non5;
            read_reg_ce1 = `ChipDisable;
            read_reg_ce2 = `ChipDisable;
            write_reg_ce = `ChipDisable;
            op_type = 3'bzzz;
            sub_op_type = 8'bzzzzzzzz;
            operand1 = `Non32;
            operand2 = `Non32;
        end
        
        else
        begin
            case (op)
                `Ori:
                begin
                    read_reg_addr1 = rs;
                    read_reg_addr2 = `Non5;
                    write_reg_addr = rt;
                    read_reg_ce1 = `ChipEnable;
                    read_reg_ce2 = `ChipDisable;
                    write_reg_ce = `ChipEnable;
                    op_type = `Logic;
                    sub_op_type = `Or;
                    operand1 = read_reg_data1;
                    operand2 = {16'h0, imm};
                end
                default:
                begin;
           			read_reg_addr1 = `Non5;
                	read_reg_addr2 = `Non5;
                	write_reg_addr = `Non5;
                	read_reg_ce1 = `ChipDisable;
               		read_reg_ce2 = `ChipDisable;
                	write_reg_ce = `ChipDisable;
                	op_type = 3'bzzz;
                	sub_op_type = 8'bzzzzzzzz;
                	operand1 = `Non32;
                	operand2 = `Non32;
                end  
            endcase
        end
    end
endmodule
