`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/29 22:46:13
// Design Name: 
// Module Name: HILO
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


module HILO(
		input reset,
		input we_hi,
		input we_lo,
		input `DataBus i_hi_data,
		input `DataBus i_lo_data,
		output reg `DataBus o_hi_data,
		output reg `DataBus o_lo_data
    );
    reg `DataBus HI;
    reg `DataBus LO;
    always @ *
    begin
    	if(we_hi == `ChipEnable)
    	begin
    		HI <= i_hi_data;
    	end
    	if(we_lo == `ChipEnable)
    	begin
    		LO <= i_lo_data;
    	end
    	o_hi_data = HI;
    	o_lo_data = LO;
    end
endmodule
