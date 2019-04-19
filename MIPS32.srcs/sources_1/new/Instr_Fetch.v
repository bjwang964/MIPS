`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/04 22:34:32
// Design Name: 
// Module Name: Instr_Fetch
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


module Instr_Fetch(
    input clk,
    input reset,
    output `InstrBus Instr
    );
    wire `AddrBus pc;
    wire ce;
    wire `InstrBus ROM_FD_Instr;
    
    PC_reg PC_reg0(clk, reset, pc, ce);
    ROM ROM0(pc ,ce, ROM_FD_Instr);
    Fetch_Decode Fetch_Decode0(clk, ROM_FD_Instr, Instr);
    
endmodule
