`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/04 21:51:15
// Design Name: 
// Module Name: ROM
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


module ROM(
    input `AddrBus pc,
    input ce,
    output reg `InstrBus Instr
    );


    
    //定义ROM
    reg `MemElem rom `MemSize;
    //ROM初始化
    
    initial begin
     	$readmemh("C:/Users/q1109/Documents/VivadoProject/MIPS32/MIPS32.srcs/sources_1/new/Instr_ROM.data", rom);
//        {rom[3], rom[2], rom[1],rom[0]} = 32'b00110100101000010000000000000001;
//		{rom[7], rom[6], rom[5],rom[4]} = 32'b00110100101000100000000000000011;
//		{rom[11],rom[10], rom[9], rom[8]} = 32'b00110100101000110000000000000111;
//		{rom[15],rom[14], rom[13], rom[12]} = 32'b00110100101001000000000000001111;
    end

    
    always @ (pc)
    begin
        if(ce === `ChipDisable)
        begin
            
        end
        
        else
        begin
            Instr = rom[pc];
             
        end
        
    end
    
    
endmodule
