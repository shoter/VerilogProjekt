`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:25 10/24/2017
// Design Name:   main_controller
// Module Name:   /home/lab_jos/.4laczak/4/lcd/main_controllertb.v
// Project Name:  lcd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_controllertb;

	// Inputs
	reg rst;
	reg clk;
	reg lcd_finish;

	// Instantiate the Unit Under Test (UUT)
	main_controller uut (
		.rst(rst), 
		.clk(clk), 
		.lcd_finish(lcd_finish)
	);

	initial begin
		lcd_finish = 1'b1;
		forever #7 lcd_finish = ~lcd_finish;
	end
	
	initial begin
		clk = 1'b0;
		rst = 1'b1;
		#20 rst = 1'b0;
		forever #1 clk = ~clk;
	end
endmodule

