`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:25:34 10/24/2017
// Design Name:   write_cycle
// Module Name:   /home/lab_jos/.4laczak/4/lcd/write_cycletb.v
// Project Name:  lcd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: write_cycle
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module write_cycletb;

	// Inputs
	reg wr_enable;
	reg reg_sel;
	reg rst;
	reg clk;

	// Outputs
	wire e_out;
	wire rs_out;
	wire rw_out;
	wire wr_finish;

	// Instantiate the Unit Under Test (UUT)
	write_cycle uut (
		.wr_enable(wr_enable), 
		.reg_sel(reg_sel), 
		.rst(rst), 
		.clk(clk), 
		.e_out(e_out), 
		.rs_out(rs_out), 
		.rw_out(rw_out), 
		.wr_finish(wr_finish)
	);

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		#1;
		rst = 1'b0;
		forever #1 clk = ~clk;
	end
	
	initial begin
		reg_sel = 1'b1;
		forever #25 reg_sel = ~reg_sel;
	end
	
	initial begin
		wr_enable = 1'b1;
		forever #25 wr_enable = ~wr_enable;
	end
	
      
endmodule

