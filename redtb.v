`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:59:48 11/21/2017
// Design Name:   red
// Module Name:   /home/lab_jos/.4laczak/myJOS_L4/redtb.v
// Project Name:  lcd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: red
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module redtb;

	// Inputs
	reg clk;
	reg rst;
	reg en;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	red uut (
		.clk(clk), 
		.rst(rst), 
		.en(en), 
		.out(out)
	);

	initial begin
	clk = 1'b0;
	rst = 1'b1;
	#10; rst = 1'b0;
	forever #1 clk = ~clk;

	end
	
	initial begin
	en = 1'b0;
	forever #15 en = ~en;
	end
      
endmodule

