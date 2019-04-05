`timescale 1ns / 1ps
/**************************************************************
�����źŵĶ���
 ***************************************************************/
`define ResetEnable     1'b1
`define ResetDisable    1'b0
`define ChipEnable      1'b1
`define ChipDisable     1'b0
`define NonAddr         20'h00000
`define AddrBus         [15:0]
`define DataBus         [31:0]
`define InstrBus        [31:0]
`define MemElem         [7:0]
`define MemSize         [65535:0]
`define NonInstr        32'h00000000
`define RegAddrWide     [4:0]
`define NumRegs         32
`define ReadEnable     1'b1
`define ReadDisable    1'b0
`define WriteEnable     1'b1
`define WriteDisable    1'b0
`define NonData         32'h00000000
