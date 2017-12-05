`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:01:26 12/05/2017
// Design Name:   kikko
// Module Name:   /home/lab_jos/.4laczak/VerilogProjekt/dupa.v
// Project Name:  VerilogProjekt
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: kikko
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dupa;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] col;

	// Outputs
	wire [3:0] row;
	wire [1:0] ST;
	wire [2:0] ST_L;
	wire [3:0] A1;
	wire [3:0] A2;
	wire [3:0] A3;
	wire [3:0] A4;
	wire [3:0] B1;
	wire [3:0] B2;
	wire [3:0] B3;
	wire [3:0] B4;
	wire [6:0] leds;

	// Instantiate the Unit Under Test (UUT)
	kikko uut (
		.clk(clk), 
		.rst(rst), 
		.row(row), 
		.col(col), 
		.ST(ST), 
		.ST_L(ST_L), 
		.A1(A1), 
		.A2(A2), 
		.A3(A3), 
		.A4(A4), 
		.B1(B1), 
		.B2(B2), 
		.B3(B3), 
		.B4(B4), 
		.leds(leds)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		col = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

