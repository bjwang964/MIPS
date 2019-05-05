`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 23:09:58
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
	input reset,
	input clk,
	input i_write_reg_ce,
	input `RegBus i_write_reg_addr,
	input `DataBus i_write_reg_data,
	
	input i_we_hi,
	input i_we_lo,
	input `DataBus i_hi_data,
	input `DataBus i_lo_data,
	
	output reg o_write_reg_ce,
	output reg `RegBus o_write_reg_addr,
	output reg `DataBus o_write_reg_data,
	
	output reg o_we_hi,
	output reg o_we_lo,
	output reg `DataBus o_hi_data,
	output reg `DataBus o_lo_data
    );
    
    always @ (posedge clk)
    begin
    	o_write_reg_ce = i_write_reg_ce;
    	o_write_reg_addr = i_write_reg_addr;
    	o_write_reg_data = i_write_reg_data;
    	o_we_hi = i_we_hi;
    	o_we_lo = i_we_lo;
    	o_hi_data = i_hi_data;
    	o_lo_data = i_lo_data;
    end
endmodule
