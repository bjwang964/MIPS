`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/16 23:09:38
// Design Name: 
// Module Name: ADD32
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


module ADD32(
		input `DataBus a,
		input `DataBus b,
		input cin,
		output `DataBus s,
		output cout
    );
    
    wire c0, c1, c2;
    
    
    ADD8 ADD8_0(a[7:0], b[7:0], cin, s[7:0], c0);
    ADD8 ADD8_1(a[15:8], b[15:8], c0, s[15:8], c1);
    ADD8 ADD8_2(a[23:16], b[23:16], c1, s[23:16], c2);
    ADD8 ADD8_3(a[31:24], b[31:24], c2, s[31:24], cout);
endmodule
