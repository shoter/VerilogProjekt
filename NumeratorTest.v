`timescale 1ns / 1ps
`include "defines.vh"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:35:29 11/28/2017
// Design Name:   Numerator
// Module Name:   /home/lab_jos/.4laczak/VerilogProjekt/NumeratorTest.v
// Project Name:  VerilogProjekt
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Numerator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module NumeratorTest;

	// Inputs
	reg [1:0] index;
	reg enabled;
	reg [4:0] key;
	reg [2:0] ST_L;
	reg clk;
	reg rst;
	reg set;
	reg [15:0] setVal;

	// Outputs
	wire [3:0] A1;
	wire [3:0] A2;
	wire [3:0] A3;
	wire [3:0] A4;
	wire [3:0] B1;
	wire [3:0] B2;
	wire [3:0] B3;
	wire [3:0] B4;

	// Instantiate the Unit Under Test (UUT)
	Numerator uut (
		.index(index), 
		.enabled(enabled), 
		.key(key), 
		.ST_L(ST_L), 
		.clk(clk), 
		.rst(rst), 
		.A1(A1), 
		.A2(A2), 
		.A3(A3), 
		.A4(A4), 
		.B1(B1), 
		.B2(B2), 
		.B3(B3), 
		.B4(B4), 
		.set(set), 
		.setVal(setVal)
	);

	initial begin
		rst = 1'b1;
		clk = 1'b0;
		#101;
		rst = 1'b0;
		forever #1 clk = ~clk;
	end
	
	initial begin
		
		enabled = 1'b1;
		set = 1'b0;
		ST_L = `SL_A;
		#120;
		
		index = 2'd0;
		key = `KEY_3;
		#10;
		index = 2'd1;
		key = `KEY_5;
		#10;
		enabled = 1'b0;
		index = 2'd2;
		key = `KEY_1;
		#10;
		key = `KEY_5;
		enabled = 1'b1;
		#10;
		index = 2'd3;
		key = `KEY_0;
		
		#20;
		ST_L = `SL_B;
		index = 2'd0;
		key = `KEY_3;
		#10;
		index = 2'd1;
		key = `KEY_5;
		#10;
		enabled = 1'b0;
		index = 2'd2;
		key = `KEY_1;
		#10;
		key = `KEY_5;
		enabled = 1'b1;
		#10;
		index = 2'd3;
		key = `KEY_0;
		
		#100;
		
		setVal[15:12] = 3'd5;
		setVal[11:8] = 3'd4;
		setVal[7:4] = 3'd3;
		setVal[3:0] = 3'd2;
		
		set = 1'b1;
		
	end
      
endmodule

