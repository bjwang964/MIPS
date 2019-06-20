`timescale 1ns / 1ps
`include "Define.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/17 11:34:22
// Design Name: 
// Module Name: BOOTH
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


module BOOTH(
		input clk,
		input `DataBus mul1,
		input `DataBus mul2,
		output `DataBus hi,
		output `DataBus lo
    );
    
    reg `DataBus P0;	//部分积
    reg `DataBus P1;	//乘数
    reg `DataBus mul1_f;	//mul1负数补码
    reg m2_1;				//-1位

	wire [1:0] state = {P1[0], m2_1};
	
    initial 
    begin
    	P0 = 0;
    	P1 = mul2;
    	m2_1 = 0;
    	mul1_f = ~mul1 + 1;
    end
    
	always @ state
	begin
		case(state)
			2'b00:
			begin
				
			end
			
			2'b01:
			begin
			end
			
			2'b10:
			begin
			end

			2'b11:
			begin
			end
		endcase
	end
    
    
    
endmodule
