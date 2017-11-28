`timescale 1ns / 1ps
`include "defines.vh"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:07:42 11/28/2017
// Design Name:   StateMachine
// Module Name:   /home/lab_jos/.4laczak/VerilogProjekt/StateMachineTest.v
// Project Name:  VerilogProjekt
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StateMachine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module StateMachineTest;

	// Inputs
	reg [4:0] key;
	reg clk;
	reg rst;
	reg end_obl;

	// Outputs
	wire [1:0] ST;
	wire [2:0] ST_L;

	// Instantiate the Unit Under Test (UUT)
	StateMachine uut (
		.key(key), 
		.clk(clk), 
		.rst(rst), 
		.end_obl(end_obl), 
		.ST(ST), 
		.ST_L(ST_L)
	);

	initial begin
		rst = 1'b1;
		clk = 1'b0;
		#100;
		rst = 1'b0;
		forever #1 clk = ~clk;
	end
	
	initial begin
		key = `KEY_NONE;
		end_obl = 1'b0;
	#100;
		key = `KEY_2;
	#10;
		key = `KEY_NONE;
	#10;
		key = `KEY_A;
	#10;
		key = `KEY_NONE;
	#10;
		key = `KEY_4;
	#10;
		key = `KEY_NONE;
	#10;
		key = `KEY_D;
	#10;
		end_obl = 1'b1;
	#10;
		key = `KEY_NONE;
	
		
	end
      
endmodule

