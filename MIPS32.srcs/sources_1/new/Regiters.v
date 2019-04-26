`timescale 1ns / 1ps
`include "Define.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/05 15:41:19
// Design Name: 
// Module Name: Regiters
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


module Regiters(
    input reset,
    
    input re1,
    input `RegAddrWide ReadReg1,
    output reg `DataBus ReadData1,
    
    input re2,
    input `RegAddrWide ReadReg2,
    output reg  `DataBus ReadData2,
    
    //写回阶段写数据
    input we,
    input `RegAddrWide WriteReg,
    input `DataBus WriteData,
    //执行阶段写数据
    input wb_ex,
    input `RegAddrWide EX_waddr,
    input `DataBus EX_wdata,    
    //访存阶段写数据
    input wb_Mem,
    input `RegAddrWide Mem_waddr,
    input `DataBus Mem_wdata  
    );
  
   
    //定义寄存器组
    reg `DataBus Regsiter [`NumRegs-1:0];
    initial
    begin
        Regsiter[0] = 32'h00000000;
    end
    

  
	always @ *
	begin
		//读一
		if(re1 == `ChipEnable)
		begin
			//写回阶段数据前推
			if(we == `ChipEnable && WriteReg == ReadReg1)
			begin
				ReadData1 = WriteData;
			end
			//执行阶段数据前推
			else if(wb_ex == `ChipEnable && ReadReg1 == EX_waddr)
			begin
				ReadData1 = EX_wdata;
			end
			//访存阶段数据前推
			else if(wb_Mem == `ChipEnable && ReadReg1 == Mem_waddr)
			begin
				ReadData1 = Mem_wdata;
			end			
			//无冲突读数据
			else
			begin
				ReadData1 = Regsiter[ReadReg1];
			end
		end
		
		else
		begin
			ReadData1 = `Non32;
		end
		
		//读二
		if(re2 == `ChipEnable)
		begin
			//写回阶段数据前推
			if(we == `ChipEnable && WriteReg == ReadReg2)
			begin
				ReadData2 = WriteData;
			end
			//执行阶段数据前推
			else if(wb_ex == `ChipEnable && ReadReg2 == EX_waddr)
			begin
				ReadData2 = EX_wdata;
			end
			//访存阶段数据前推
			else if(wb_Mem == `ChipEnable && ReadReg2 == Mem_waddr)
			begin
				ReadData2 = Mem_wdata;
			end			
			//无冲突读数据
			else
			begin
				ReadData2 = Regsiter[ReadReg2];
			end
		end
		
		else
		begin
			ReadData2 = `Non32;
		end
		
		//写
		if(we == `ChipEnable)
			Regsiter[WriteReg] = WriteData;
	end
    
endmodule
