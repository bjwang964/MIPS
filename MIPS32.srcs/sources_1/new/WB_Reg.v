`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 23:11:22
// Design Name: 
// Module Name: WB_Reg
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


module WB_Reg(
	input reset,
input clk,
input i_write_reg_ce,
input `RegBus i_write_reg_addr,
input `DataBus i_write_reg_data,
input `DataBus i_hi_data,
input `DataBus i_lo_data,

output reg o_write_reg_ce,
output reg `RegBus o_write_reg_addr,
output reg `DataBus o_write_reg_data,
output reg `DataBus o_hi_data,
output reg `DataBus o_lo_data
    );
    
//    always @ (posedge clk)

	always @ *
    begin
    	o_write_reg_ce = i_write_reg_ce;
    	o_write_reg_addr = i_write_reg_addr;
    	o_write_reg_data = i_write_reg_data;
    	o_hi_data = i_hi_data;
    	o_lo_data = i_lo_data;

    end
endmodule
