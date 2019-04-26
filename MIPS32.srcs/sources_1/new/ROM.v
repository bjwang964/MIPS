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
