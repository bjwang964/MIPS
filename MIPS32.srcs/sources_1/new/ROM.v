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
        rom[0] = 8'b00000001;
        rom[1] = 8'b00000000;
        rom[2] = 8'b00000001;
        rom[3] = 8'b00110100;
    end

    
    always @ (pc)
    begin
        if(ce === `ChipDisable)
        begin
            
        end
        
        else
        begin
            Instr[31:24] = rom[pc+3];
            Instr[23:16] = rom[pc+2];
            Instr[15:8] = rom[pc+1];
            Instr[7:0] = rom[pc];
             
        end
        
    end
    
    
endmodule
