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
    
    input i_we_hi,
    input i_we_lo,
    input `DataBus i_hi_data,
    input `DataBus i_lo_data,
    input `DataBus mem_hi_data,
    input `DataBus mem_lo_data,
    input mem_wb_hi,
    input mem_wb_lo,
    
    output reg write_ce,
    output reg `RegBus write_addr,
    output reg `DataBus write_data,
    
    output o_wb_ec,
    output `RegBus wb_addr,
    output `DataBus wb_data,
    
    output reg o_we_hi,
    output reg o_we_lo,
    output reg `DataBus o_hi_data,
    output reg `DataBus o_lo_data
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
   	
   	always @ i_we_hi
   	begin
   		o_we_hi = i_we_hi;
   	end
   	
   	always @ i_we_lo
   	begin
   		o_we_lo = i_we_lo;
   	end
   	
    reg `DataBus re_log;
    reg `DataBus re_sft;
    reg `DataBus re_mov;
    always @ *
    begin
    	case(op_type)
    		`Logic:
    		begin
        		case (sub_op_type)
            		`or:
            		begin
                		re_log = operand1 | operand2;
            		end
            		
            		`and:
            		begin
                		re_log = operand1 & operand2;
            		end
            		
            		`xor:
            		begin
                		re_log = operand1 ^ operand2;
            		end
            		
            		`nor:
            		begin
                		re_log = ~(operand1 | operand2);
            		end
            		
            		default :
            		begin
                		re_log = `Non32;
            		end
				endcase
			end
			
			`Shift:
			begin
				case(sub_op_type)
				`sll:
				begin
					re_sft = operand2 << operand1;
				end
				
				`srl:
				begin
					re_sft = operand2 >> operand1;
				end
				
				`sra:
				begin
					re_sft = (operand2 >> operand1) | 32'h80000000 ;
				end
				
				`sllv:
				begin
					re_sft = operand2 << operand1;
				end
				
				`srlv:
				begin
					re_sft = operand2 >> operand1;
				end
				
				`srav:
				begin
					re_sft = (operand2 >> operand1) | 32'h80000000 ;
				end
				
				default :
				begin
                	re_sft = `Non32;
				end
				endcase
			end
			
			`Move:
			begin
				case(sub_op_type)
					`movz:
					begin
						re_mov = operand1;
					end
					`movn:
					begin
						re_mov = operand1;
					end
					`mfhi:
					begin
						if(mem_wb_hi == `ChipEnable)
						begin
							re_mov = mem_hi_data;
						end
						else
							re_mov = i_hi_data;
						begin
						end
					end
					`mthi:
					begin
						o_hi_data = operand1;
					end
					`mflo:
					begin
						if(mem_wb_lo == `ChipEnable)
						begin
							re_mov = mem_lo_data;
						end
						else
						begin
							re_mov = i_lo_data;
						end
					end
					`mtlo:
					begin
						o_lo_data = operand1;
					end
				endcase
			end
			
			default :
			begin
                re_sft = `Non32;
                re_log = `Non32;
                re_mov = `Non32;
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
            
            `Shift:
            begin
            	write_data = re_sft;
            end
            
            `Move:
            begin
            	write_data = re_mov;
            end
            
            default:
            begin
                write_data = `Non32;
            end
        endcase
    end
endmodule
