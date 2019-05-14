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
    output reg `DataBus operand2,
    
    //特殊寄存器信号
    output reg we_hi,
    output reg we_ol,
    
    //数据前推使能
    output reg wb_ex,
    output reg wb_mem
    
    );
    
    wire [5:0] op = instr[31:26];

    //I 类型
    wire [4:0] i_rs = instr[25:21];
    wire [4:0] i_rd = instr[20:16];
    wire [15:0] imm = instr[15:0];
    
    //R 类型
    wire [4:0] r_rs = instr[25:21];
    wire [4:0] r_rt = instr[20:16];
    wire [4:0] r_rd = instr[15:11];
    wire [4:0] sa = instr[10:6];
    wire [5:0] func = instr[5:0];
    
    //J 类型
    wire [25:0] address = instr[25:0];
    
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
            wb_ex = 1'bz;
            wb_mem = 1'bz;
            we_hi = `ChipDisable;
            we_ol = `ChipDisable;
        end
        
        else
        begin
            case (op)
                `Ori:
                begin
                    read_reg_addr1 = i_rs;
                    read_reg_addr2 = `Non5;
                    write_reg_addr = i_rd;
                    read_reg_ce1 = `ChipEnable;
                    read_reg_ce2 = `ChipDisable;
                    write_reg_ce = `ChipEnable;
                    op_type = `Logic;
                    sub_op_type = `or;
                    operand1 = read_reg_data1;
                    operand2 = {16'h0, imm};
                    wb_ex = `ChipEnable;
                    wb_mem = `ChipEnable;
                    we_hi = `ChipDisable;
                    we_ol = `ChipDisable;
                end
                
                `Andi:
                begin
                    read_reg_addr1 = i_rs;
               	 	read_reg_addr2 = `Non5;
                	write_reg_addr = i_rd;
                	read_reg_ce1 = `ChipEnable;
                	read_reg_ce2 = `ChipDisable;
                	write_reg_ce = `ChipEnable;
                	op_type = `Logic;
                	sub_op_type = `and;
                	operand1 = read_reg_data1;
                	operand2 = {16'h0, imm};
                	wb_ex = `ChipEnable;
                	wb_mem = `ChipEnable;
                	we_hi = `ChipDisable;
                	we_ol = `ChipDisable;
                end
                
                `Xori:
                begin
                    read_reg_addr1 = i_rs;
               	 	read_reg_addr2 = `Non5;
                	write_reg_addr = i_rd;
                	read_reg_ce1 = `ChipEnable;
                	read_reg_ce2 = `ChipDisable;
                	write_reg_ce = `ChipEnable;
                	op_type = `Logic;
                	sub_op_type = `xor;
                	operand1 = read_reg_data1;
                	operand2 = {16'h0, imm};
                	wb_ex = `ChipEnable;
                	wb_mem = `ChipEnable;
                	we_hi = `ChipDisable;
                	we_ol = `ChipDisable;
                end
                
                `Lui:
                begin
                    read_reg_addr1 = i_rs;
               	 	read_reg_addr2 = `Non5;
                	write_reg_addr = i_rd;
                	read_reg_ce1 = `ChipEnable;
                	read_reg_ce2 = `ChipDisable;
                	write_reg_ce = `ChipEnable;
                	op_type = `Logic;
                	sub_op_type = `or;
                	operand1 = read_reg_data1;
                	operand2 = {imm,16'h0};
                	wb_ex = `ChipEnable;
                	wb_mem = `ChipEnable;
                	we_hi = `ChipDisable;
                	we_ol = `ChipDisable;
                end
                
                `Special:
                begin
                	if(sa == 0 && func == `And)
                	begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Logic;
                		sub_op_type = `and;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	
                	if(sa == 0 && func == `Or)
                	begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Logic;
                		sub_op_type = `or;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end            
                	
                	if(sa == 0 && func == `Xor)
                	begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Logic;
                		sub_op_type = `xor;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end           
                	
                	if(sa == 0 && func == `Nor)
                	begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Logic;
                		sub_op_type = `nor;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end                  	    	
                	
                	if(r_rs == 0 && func == `Sll)
                	begin
                    	read_reg_addr1 = `Non5;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipDisable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Shift;
                		sub_op_type = `sll;
                		operand1 = {27'h0, sa};
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end  
                	
                	if(r_rs == 0 && func == `Srl)
                	begin
                    	read_reg_addr1 = `Non5;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipDisable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Shift;
                		sub_op_type = `srl;
                		operand1 = {27'h0, sa};
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end  
                	
                	if(r_rs == 0 && func == `Sra)
                	begin
                    	read_reg_addr1 = `Non5;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipDisable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Shift;
                		sub_op_type = `sra;
                		operand1 = {27'h0, sa};
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end  
                	
                	if(sa == 0 && func == `Sllv)
                	begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Shift;
                		sub_op_type = `sllv;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end  
                	
                	if(sa == 0 && func == `Srlv)
                	begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Shift;
                		sub_op_type = `srlv;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end  
                	
                	if(sa == 0 && func == `Srav)
                	begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Shift;
                		sub_op_type = `srav;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	
                	if(sa == 0 && func == `Movn)
                	begin
                		read_reg_addr1 <= r_rs;
               	 		read_reg_addr2 <= r_rt;
                		write_reg_addr <= r_rd;
                		read_reg_ce1 <= `ChipEnable;
                		read_reg_ce2 <= `ChipEnable;
                		write_reg_ce = 1'bz;
                		op_type = `Move;
                		sub_op_type = `movn;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	
                	if(sa == 0 && func == `Movz)
                	begin
                		read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = 1'bz;
                		op_type = `Move;
                		sub_op_type = `movz;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	
                	if(sa == 0 && func == `Mthi)
                	begin
                		read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = `Non5;
                		write_reg_addr = `Non5;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipDisable;
                		write_reg_ce = `ChipDisable;
                		op_type = `Move;
                		sub_op_type = `mthi;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipEnable;
                		we_ol = `ChipDisable;
                	end
                	
                	if(sa == 0 && func == `Mtlo)
                	begin
                		read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = `Non5;
                		write_reg_addr = `Non5;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipDisable;
                		write_reg_ce = `ChipDisable;
                		op_type = `Move;
                		sub_op_type = `mtlo;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipEnable;
                	end
                	
                	if(sa == 0 && func == `Mfhi)
                	begin
                		read_reg_addr1 = `Non5;
               	 		read_reg_addr2 = `Non5;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipDisable;
                		read_reg_ce2 = `ChipDisable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Move;
                		sub_op_type = `mfhi;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	
                	if(sa == 0 && func == `Mflo)
                	begin
                		read_reg_addr1 = `Non5;
               	 		read_reg_addr2 = `Non5;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipDisable;
                		read_reg_ce2 = `ChipDisable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Move;
                		sub_op_type = `mflo;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	
                	if(sa == 0 && func == `Add )
                	begin
                		read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Arithmetic;
                		sub_op_type = `add;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	if(sa == 0 && func == `Addu )
                	begin
                		read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Arithmetic;
                		sub_op_type = `add;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	if(sa == 0 && func == `Sub )
                	begin
                		read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Arithmetic;
                		sub_op_type = `sub;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	if(sa == 0 && func == `Subu )
                	begin
                		read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Arithmetic;
                		sub_op_type = `sub;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	if(sa == 0 && func == `Slt )
                	begin
                		read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Arithmetic;
                		sub_op_type = `slt;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	if(sa == 0 && func == `Sltu )
                	begin
                		read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Arithmetic;
                		sub_op_type = `slt;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	
                	if(sa == 0 && func == `Mult)
               		begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = `Non5;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipDisable;
                		op_type = `Arithmetic;
                		sub_op_type = `mult;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipEnable;
                		we_ol = `ChipEnable;
                	end
                	
                	if(sa == 0 && func == `Multu)
               		begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = `Non5;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipDisable;
                		op_type = `Arithmetic;
                		sub_op_type = `mult;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipEnable;
                		we_ol = `ChipEnable;
                	end
                	
                end
                
                `Special2:
                begin
                	if(sa == 0 && func == `Clz)
               		begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Arithmetic;
                		sub_op_type = `clz;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	
                	if(sa == 0 && func == `Clo)
               		begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Arithmetic;
                		sub_op_type = `clo;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	
                	if(sa == 0 && func == `Mul)
               		begin
                    	read_reg_addr1 = r_rs;
               	 		read_reg_addr2 = r_rt;
                		write_reg_addr = r_rd;
                		read_reg_ce1 = `ChipEnable;
                		read_reg_ce2 = `ChipEnable;
                		write_reg_ce = `ChipEnable;
                		op_type = `Arithmetic;
                		sub_op_type = `mul;
                		operand1 = read_reg_data1;
                		operand2 = read_reg_data2;
                		wb_ex = `ChipEnable;
                		wb_mem = `ChipEnable;
                		we_hi = `ChipDisable;
                		we_ol = `ChipDisable;
                	end
                	

                end
                
                `Addi:
                begin
                	read_reg_addr1 = i_rs;
               	 	read_reg_addr2 = `Non5;
                	write_reg_addr = i_rd;
                	read_reg_ce1 = `ChipEnable;
                	read_reg_ce2 = `ChipDisable;
                	write_reg_ce = `ChipEnable;
                	op_type = `Arithmetic;
                	sub_op_type = `add;
                	operand1 = read_reg_data1;
                	operand2 = {16'h0, imm};
                	wb_ex = `ChipEnable;
                	wb_mem = `ChipEnable;
                	we_hi = `ChipDisable;
                	we_ol = `ChipDisable;
                end
                
                `Addiu:
                begin
                	read_reg_addr1 = i_rs;
               	 	read_reg_addr2 = `Non5;
                	write_reg_addr = i_rd;
                	read_reg_ce1 = `ChipEnable;
                	read_reg_ce2 = `ChipDisable;
                	write_reg_ce = `ChipEnable;
                	op_type = `Arithmetic;
                	sub_op_type = `add;
                	operand1 = read_reg_data1;
                	operand2 = {16'h0, imm};
                	wb_ex = `ChipEnable;
                	wb_mem = `ChipEnable;
                	we_hi = `ChipDisable;
                	we_ol = `ChipDisable;
                end
                
                `Slti:
                begin
                	read_reg_addr1 = i_rs;
               	 	read_reg_addr2 = `Non5;
                	write_reg_addr = i_rd;
                	read_reg_ce1 = `ChipEnable;
                	read_reg_ce2 = `ChipDisable;
                	write_reg_ce = `ChipEnable;
                	op_type = `Arithmetic;
                	sub_op_type = `slt;
                	operand1 = read_reg_data1;
                	operand2 = {16'h0, imm};
                	wb_ex = `ChipEnable;
                	wb_mem = `ChipEnable;
                	we_hi = `ChipDisable;
                	we_ol = `ChipDisable;
                end
                
                `Sltiu:
                begin
                	read_reg_addr1 = i_rs;
               	 	read_reg_addr2 = `Non5;
                	write_reg_addr = i_rd;
                	read_reg_ce1 = `ChipEnable;
                	read_reg_ce2 = `ChipDisable;
                	write_reg_ce = `ChipEnable;
                	op_type = `Arithmetic;
                	sub_op_type = `slt;
                	operand1 = read_reg_data1;
                	operand2 = {16'h0, imm};
                	wb_ex = `ChipEnable;
                	wb_mem = `ChipEnable;
                	we_hi = `ChipDisable;
                	we_ol = `ChipDisable;
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
                	wb_ex = 1'bz;
                	wb_mem = 1'bz;
                	we_hi = `ChipDisable;
                	we_ol = `ChipDisable;
                end  
            endcase
        end
    end
endmodule
