`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/19 22:52:56
// Design Name: 
// Module Name: Fetch_Decode
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


module Fetch_Decode(
		input clk,
		input `InstrBus i_Instr,
		output reg `InstrBus o_Instr
    );
    always @ (posedge clk)
    begin
    	o_Instr = i_Instr;
    end
endmodule
