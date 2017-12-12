`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:35:10 12/12/2017
// Design Name:   bin2bcd
// Module Name:   /home/lab_jos/.4laczak/projekt/VerilogProjekt2/bin2bcd_test.v
// Project Name:  VerilogProjekt2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bin2bcd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bin2bcd_test;

	// Inputs
	reg [13:0] bin;

	// Outputs
	wire [3:0] thousands;
	wire [3:0] hundreds;
	wire [3:0] tens;
	wire [3:0] ones;

	// Instantiate the Unit Under Test (UUT)
	bin2bcd uut (
		.bin(bin), 
		.thousands(thousands), 
		.hundreds(hundreds), 
		.tens(tens), 
		.ones(ones)
	);

	initial begin
		// Initialize Inputs
		bin = 14'd0;

		// Wait 100 ns for global reset to finish
		#100;
      bin = 14'd9999;
		#20
		bin = 14'd10;
		// Add stimulus here

	end
      
endmodule

