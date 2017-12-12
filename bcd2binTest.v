`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:25:03 12/12/2017
// Design Name:   bcd2bin
// Module Name:   /home/lab_jos/.4laczak/VerilogProjekt/bcd2binTest.v
// Project Name:  VerilogProjekt
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bcd2bin
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bcd2binTest;

	// Inputs
	reg [3:0] N1;
	reg [3:0] N2;
	reg [3:0] N3;
	reg [3:0] N4;

	// Outputs
	wire [13:0] out;

	// Instantiate the Unit Under Test (UUT)
	bcd2bin uut (
		.N1(N1), 
		.N2(N2), 
		.N3(N3), 
		.N4(N4), 
		.out(out)
	);

	initial begin
		N1 = 4'd0;
		N2 = 4'd0;
		N3 = 4'd1;
		N4 = 4'd2;
		//1100
		
		
		#10;
		N1 = 4'd5;
		N2 = 4'd4;
		N3 = 4'd3;
		N4 = 4'd2;
		
		#10;
		N1 = 4'd9;
		N2 = 4'd9;
		N3 = 4'd9;
		N4 = 4'd9;
		
		#10;
		N1 = 4'd3;
		N2 = 4'd5;
		N3 = 4'd7;
		N4 = 4'd9;
		
		#10;
		N1 = 4'd1;
		N2 = 4'd0;
		N3 = 4'd4;
		N4 = 4'd0;
		
		
		
	end
      
endmodule

