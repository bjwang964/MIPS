`timescale 1ns / 1ps
`include "TestDefine.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/04 20:56:11
// Design Name: 
// Module Name: test_bench
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


module TestBench( );

	reg [31:0] a;
	reg [31:0] b;
	reg cin;
	wire [31:0] s;
	wire cout;
    
    initial
    begin
		a = 24;
		forever #5 a = a+5;
    end
    
        initial
    begin
		b = 16;
		forever #10 b = b + 7;
    end
        initial
    begin
		cin = 1;
		forever #2 cin = ~cin;
    end
    
    ADD32 ADD(
    	a, b, cin,
    	s, cout
    );

    
    

   
endmodule
