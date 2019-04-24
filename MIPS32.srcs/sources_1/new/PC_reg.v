`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/04 20:35:27
// Design Name: 
// Module Name: PC_reg
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


module PC_reg(
    input clk,
    input reset,
    output reg `AddrBus PC,
    output reg CE
    );
	//必要的初始化
	initial
	begin
		PC = 0;
	end
    //时序逻辑
    always @ (posedge clk)
    begin
        if(reset === `ResetEnable)
        begin
        end
        
        else
        begin
            CE = `ChipEnable;  
            PC = PC + 1;
        end
    end
    
endmodule
