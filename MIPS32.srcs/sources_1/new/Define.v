`timescale 1ns / 1ps
/**************************************************************
基本信号的定义
 ***************************************************************/
`define ResetEnable         1'b1
`define ResetDisable        1'b0
`define ChipEnable          1'b1
`define ChipDisable         1'b0
`define NonAddr             1'bz
`define AddrBus             [15:0]
`define DataBus             [31:0]
`define InstrBus            [31:0]
`define MemElem             [31:0]
`define MemSize             [65535:0]
`define NonInstr            32'h00000000
`define RegAddrWide         [4:0]
`define NumRegs             32
`define ReadEnable          1'b1
`define ReadDisable         1'b0
`define WriteEnable         1'b1
`define WriteDisable        1'b0
`define NonData             1'bz
`define NumOperatorType     8    
`define Ori                 6'b001101
`define Logic               3'b001
`define Or                  8'b00100101
`define RegBus              [4:0]
`define Non32				32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
`define Non5				5'bzzzzz
`define Non16				16'bzzzzzzzzzzzzzzzz