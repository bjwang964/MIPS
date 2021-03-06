`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 23:09:05
// Design Name: 
// Module Name: WB
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


module WB(
input reset,
input i_write_reg_ce,
input `RegBus i_write_reg_addr,
input `DataBus i_write_reg_data,

output reg o_write_reg_ce,
output reg `RegBus o_write_reg_addr,
output reg `DataBus o_write_reg_data

    );
    
       always @ *
    begin
    	o_write_reg_ce = i_write_reg_ce;
    	o_write_reg_addr = i_write_reg_addr;
    	o_write_reg_data = i_write_reg_data;
    end
endmodule
