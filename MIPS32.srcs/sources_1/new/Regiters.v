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
    
    input we,
    input `RegAddrWide WriteReg,
    input `DataBus WriteData    
    );
  
   
    //定义寄存器组
    reg `DataBus Regsiter [`NumRegs-1:0];
    initial
    begin
        Regsiter[0] = 32'h00000000;
        Regsiter[5] = 32'h80000000;
    end
    

  
	always @ *
	begin
		//读一
		if(re1 == `ChipEnable)
		begin
			if(we == `ChipEnable && WriteReg == ReadReg1)
			begin
				ReadData1 = WriteData;
			end
			
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
			if(we == `ChipEnable && WriteReg == ReadReg2)
			begin
				ReadData2 = WriteData;
			end
			
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
