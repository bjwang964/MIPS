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
    
    //д�ؽ׶�д����
    input we,
    input `RegAddrWide WriteReg,
    input `DataBus WriteData,
    //ִ�н׶�д����
    input wb_ex,
    input `RegAddrWide EX_waddr,
    input `DataBus EX_wdata,    
    //�ô�׶�д����
    input wb_Mem,
    input `RegAddrWide Mem_waddr,
    input `DataBus Mem_wdata  
    );
  
   
    //����Ĵ�����
    reg `DataBus Regsiter [`NumRegs-1:0];
    initial
    begin
        Regsiter[0] = 32'h00000000;
    end
    

  
	always @ *
	begin
		//��һ
		if(re1 == `ChipEnable)
		begin
			//д�ؽ׶�����ǰ��
			if(we == `ChipEnable && WriteReg == ReadReg1)
			begin
				ReadData1 = WriteData;
			end
			//ִ�н׶�����ǰ��
			else if(wb_ex == `ChipEnable && ReadReg1 == EX_waddr)
			begin
				ReadData1 = EX_wdata;
			end
			//�ô�׶�����ǰ��
			else if(wb_Mem == `ChipEnable && ReadReg1 == Mem_waddr)
			begin
				ReadData1 = Mem_wdata;
			end			
			//�޳�ͻ������
			else
			begin
				ReadData1 = Regsiter[ReadReg1];
			end
		end
		
		else
		begin
			ReadData1 = `Non32;
		end
		
		//����
		if(re2 == `ChipEnable)
		begin
			//д�ؽ׶�����ǰ��
			if(we == `ChipEnable && WriteReg == ReadReg2)
			begin
				ReadData2 = WriteData;
			end
			//ִ�н׶�����ǰ��
			else if(wb_ex == `ChipEnable && ReadReg2 == EX_waddr)
			begin
				ReadData2 = EX_wdata;
			end
			//�ô�׶�����ǰ��
			else if(wb_Mem == `ChipEnable && ReadReg2 == Mem_waddr)
			begin
				ReadData2 = Mem_wdata;
			end			
			//�޳�ͻ������
			else
			begin
				ReadData2 = Regsiter[ReadReg2];
			end
		end
		
		else
		begin
			ReadData2 = `Non32;
		end
		
		//д
		if(we == `ChipEnable)
			Regsiter[WriteReg] = WriteData;
	end
    
endmodule
