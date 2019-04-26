`timescale 1ns / 1ps
`include "Define.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/19 16:13:42
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
	input clk,
	input reset,
    input i_write_ce,
    input `RegBus i_write_addr,
    input `DataBus i_write_data,
    input i_wb_mem,
    
    output reg o_write_ce,
    output reg `RegBus o_write_addr,
    output reg `DataBus o_write_data,
    output reg o_wb_mem
    );

    
    always @ (posedge clk)
    begin
    	o_write_addr = i_write_addr;
    	o_write_data = i_write_data;
    	o_write_ce = i_write_ce;
    	o_wb_mem = i_wb_mem;
    end
    
endmodule
