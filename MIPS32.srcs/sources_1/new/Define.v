`timescale 1ns / 1ps
/**************************************************************
基本信号的定义
 ***************************************************************/
 //使能信号
`define ResetEnable         1'b1
`define ResetDisable        1'b0
`define ChipEnable          1'b1
`define ChipDisable         1'b0
`define ReadEnable          1'b1
`define ReadDisable         1'b0
`define WriteEnable         1'b1
`define WriteDisable        1'b0

//总线宽度
`define AddrBus             [15:0]
`define DataBus             [31:0]
`define InstrBus            [31:0]
`define RegAddrWide         [4:0]
`define RegBus              [4:0]

//无效数据
`define Non32				32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
`define Non5				5'bzzzzz
`define Non16				16'bzzzzzzzzzzzzzzzz

//存储大小
`define MemElem             [31:0]
`define MemSize             [65535:0]
`define NumRegs             32

//运算信号



	//I型指令
`define Andi				 6'b001100
`define Ori                 6'b001101
`define Xori				 6'b001110
`define Lui					 6'b001111
	//R型指令
`define Special				 6'b000000
`define And					 6'b100100
`define Or					 6'b100101
`define Xor					 6'b100110
`define Nor					 6'b100111

`define Sll  				 6'b000000
`define Srl  				 6'b000010
`define Sra  				 6'b000011
`define Sllv  				 6'b000100
`define Srlv  				 6'b000110
`define Srav  				 6'b000111

`define Movn				 6'b001011
`define Movz				 6'b001010

	//执行类型
`define Logic               3'b001
`define or                  8'b00100101
`define and                 8'b00100100
`define xor                 8'b00100110
`define nor                 8'b00100111
`define lu					 8'b01011100
`define Shift				 3'b010
`define sll  				 8'b01111100
`define sllv  				 8'b00000100
`define srl					 8'b00000010
`define srlv 				 8'b00000110
`define sra 				 8'b00000011
`define srav 				 8'b00000111
`define Move				 3'b011
`define movn				 8'b00001011
`define movz				 8'b00001010


