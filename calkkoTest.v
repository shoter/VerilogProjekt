`timescale 1ns / 1ps
`include "defines.vh"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:00:05 12/12/2017
// Design Name:   Calkko
// Module Name:   /home/lab_jos/.4laczak/VerilogProjekt/calkkoTest.v
// Project Name:  VerilogProjekt
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Calkko
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module calkkoTest;

	// Inputs
	reg [3:0] A1;
	reg [3:0] A2;
	reg [3:0] A3;
	reg [3:0] A4;
	reg [3:0] B1;
	reg [3:0] B2;
	reg [3:0] B3;
	reg [3:0] B4;
	reg [1:0] ST;
	reg [2:0] ST_L;
	
	reg [3:0] OUT1, OUT2, OUT3, OUT4;

	// Outputs
	wire set;
	wire [15:0] number;

	// Instantiate the Unit Under Test (UUT)
	Calkko uut (
		.A1(A1), 
		.A2(A2), 
		.A3(A3), 
		.A4(A4), 
		.B1(B1), 
		.B2(B2), 
		.B3(B3), 
		.B4(B4), 
		.ST(ST), 
		.ST_L(ST_L), 
		.set(set), 
		.number(number)
	);

	initial begin
		ST = `S_OBL;
		
		A1 = 4'd0;
		A2 = 4'd0;
		A3 = 4'd0;
		A4 = 4'd5;
		
		B1 = 4'd0;
		B2 = 4'd0;
		B3 = 4'd0;
		B4 = 4'd1;
		
		
		ST_L = `SL_ADD;
		#10;
		ST_L = `SL_SUB;
		#10;
		ST_L = `SL_XOR;
		#10;
		ST_L = `SL_OR;
		#10;
		ST_L = `SL_AND;

	end
	
	initial begin
		forever begin
		#1;
		OUT1 <= number[3:0];
		OUT2 <= number[7:4];
		OUT3 <= number[11:8];
		OUT4 <= number[15:12];
		end
	end
      
endmodule

