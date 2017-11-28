`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:44:14 11/14/2017
// Design Name:   main
// Module Name:   /home/lab_jos/.4laczak/JOS_L4/maintb.v
// Project Name:  lcd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module maintb;

	// Inputs
	reg rst;
	reg clk;
	reg en;

	// Outputs
	wire rw_out;
	wire rs_out;
	wire e_out;
	wire [7:0] db_out;

	// Instantiate the Unit Under Test (UUT)
	main #(.div(2)) uut (
		.rst(rst), 
		.clk(clk), 
		.rw_out(rw_out), 
		.rs_out(rs_out), 
		.e_out(e_out), 
		.db_out(db_out)
	);

	initial begin
		en = 1'b1;
		clk = 1'b1;
		forever #1 clk = ~clk;
	end
	
	initial begin
		rst = 1'b1;
		#20 rst = 1'b0;
	end
	
      
endmodule

