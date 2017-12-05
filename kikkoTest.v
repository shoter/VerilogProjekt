`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:10:23 12/05/2017
// Design Name:   kikko
// Module Name:   /home/lab_jos/.4laczak/VerilogProjekt/kikkoTest.v
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

module kikkoTest;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] row;

	// Outputs
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
	wire [3:0] col;
	wire [6:0] leds;
	
	// Instantiate the Unit Under Test (UUT)
	kikko #(.div(2)) uut  (
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

