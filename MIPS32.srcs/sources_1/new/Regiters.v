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
    output  `DataBus ReadData1,
    
    input re2,
    input `RegAddrWide ReadReg2,
    output  `DataBus ReadData2,
    
    input we,
    input `RegAddrWide WriteReg,
    input `DataBus WriteData    
    );
  
   
    //¶¨Òå¼Ä´æÆ÷×é
    reg `DataBus Regsiter [`NumRegs-1:0];
    initial
    begin
        Regsiter[0] = 32'h00000000;
        Regsiter[5] = 32'h80000000;
    end
    
    //¸´Î»
    always @ reset
    begin
        if(reset == `ResetEnable)
        begin
            
        end
    end
  
    //¶Á¼Ä´æÆ÷1Âß¼­
    assign ReadData1 = (re1==`ChipDisable)?`NonData:Regsiter[ReadReg1];
    
    //¶Á¼Ä´æÆ÷2Âß¼­
    assign ReadData2 = (re2==`ChipDisable)?`NonData:Regsiter[ReadReg2];
  
    //Ð´¼Ä´æÆ÷Âß¼­ 
    always @ WriteData
    begin
        if(we == `ChipEnable)
        begin
            Regsiter[WriteReg] = WriteData;
        end
    end

    
endmodule
