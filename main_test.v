`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:21:10 12/05/2017
// Design Name:   main
// Module Name:   /home/lab_jos/.4laczak/VerilogProjekt/main_test.v
// Project Name:  VerilogProjekt
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

module main_test;

	// Inputs
	reg rst;
	reg clk;
	reg [3:0] row;

	// Outputs
	wire [3:0] col;
	wire rw_out;
	wire rs_out;
	wire e_out;
	wire [7:0] db_out;
	wire [6:0] leds;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.rst(rst), 
		.clk(clk), 
		.row(row), 
		.col(col), 
		.rw_out(rw_out), 
		.rs_out(rs_out), 
		.e_out(e_out), 
		.db_out(db_out), 
		.leds(leds)
	);

	initial begin
		clk = 1'b0;
		forever #1 clk = ~clk;
	end
	
	initial begin
	rst = 1'b1;
	#105;
	rst = 1'b0;
	end
	
	initial begin
	repeat(200) #1	
		case(col)
			4'b0111: row = 4'b1111;
			4'b1011: row = 4'b1101; //8
			4'b1101: row = 4'b1111;
			4'b1110: row = 4'b1111;
		endcase
		
		repeat(100) #1	
		case(col)
			4'b0111: row = 4'b1111;
			4'b1011: row = 4'b1111;
			4'b1101: row = 4'b1111;
			4'b1110: row = 4'b1111;
		endcase
		
		repeat(100) #1	
		case(col)
			4'b0111: row = 4'b1101; //7
			4'b1011: row = 4'b1111;
			4'b1101: row = 4'b1111;
			4'b1110: row = 4'b1111;
		endcase
	end 
      
endmodule

