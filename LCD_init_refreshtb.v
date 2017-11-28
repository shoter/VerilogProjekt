`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:42:48 10/24/2017
// Design Name:   LCD_init_refresh
// Module Name:   /home/lab_jos/.4laczak/4/lcd/LCD_init_refreshtb.v
// Project Name:  lcd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LCD_init_refresh
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LCD_init_refreshtb;

	// Inputs
	reg wr_finish;
	reg lcd_enable;

	// Instantiate the Unit Under Test (UUT)
	LCD_init_refresh uut (
		.wr_finish(wr_finish), 
		.lcd_enable(lcd_enable)
	);

	initial begin
		// Initialize Inputs
		wr_finish = 0;
		lcd_enable = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

