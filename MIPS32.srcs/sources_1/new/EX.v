`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 22:14:17
// Design Name: 
// Module Name: EX
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


module EX(
    input reset,
    input [2:0] op_type,
    input [7:0] sub_op_type,
    input `DataBus operand1,
    input `DataBus operand2,
    input write_reg_ce,
    input `RegBus write_reg_addr,
    input i_wb_ex,
    
    output reg write_ce,
    output reg `RegBus write_addr,
    output reg `DataBus write_data,
    
    output o_wb_ec,
    output `RegBus wb_addr,
    output `DataBus wb_data
    );
	assign wb_addr = write_addr;
	assign wb_data = write_data;
    assign o_wb_ec = i_wb_ex;
    
    
    always @ write_reg_ce
   	begin
   		write_ce = write_reg_ce;
   	end
   		
   	always @ write_reg_addr
   	begin
   		write_addr = write_reg_addr;
   	end
    reg `DataBus re_log;
    always @ *
    begin
        case (sub_op_type)
            `Or:
            begin
                re_log = operand1 | operand2;
            end
            
            default :
            begin
                re_log = `Non32;
            end
        endcase
    end
    
    always @ *
    begin
        case(op_type)
            `Logic:
            begin
                write_data = re_log;
            end
            
            default:
            begin
                write_data = `Non32;
            end
        endcase
    end
endmodule
