`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:06 12/05/2017 
// Design Name: 
// Module Name:    kikko 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module  kikko
#(parameter div = 100)
(
		input clk,					// 100Mhz onboard clock
		input rst,
		
		input [3:0] row ,
		output [3:0] col ,
		output [1:0] ST,
		output [2:0] ST_L,
		output [3:0] A1,A2,A3,A4,
							  B1,B2,B3,B4,
							  
		output [6:0] leds
    );
	 
	 wire [4:0] key;
	 wire [1:0] index;
	 wire [15:0] number;
	 
	 clockDivider #(.div(div)) clokko(
		.clk(clk),
		.rst(rst),
		.slow_clk(slow_clk)
	);
	
	Decoder C0(
			.clk(slow_clk),
			.rst(rst),
			.row(row),
			.Col(col),
			.DecodeOut(key)
	);
	
	KeyLedDisplay display(.key(key),
	.segOut(leds));
	
	
	
	StateMachine stateMachine(
			.key(key),
			.clk(slow_clk),
			.rst(rst),
			.end_obl(1'b1),
			.ST(ST),
			.index(index),
			.ST_L(ST_L)
		);
		
		enabler enabled(
		.ST(ST),
		.ST_L(ST_L),
		.en(enableWriting)
		);
		
		Calkko Calkko(
		.A1(A1), .A2(A2), .A3(A3), .A4(A4),
		.B1(B1), .B2(B2), .B3(B3), .B4(B4),
		.ST(ST),
		.ST_L(ST_L),
		.set(set),
		.number(number)
		
		);
		
		Numerator Numerator(
			.index(index),
			.enabled(enableWriting),
			.key(key),
			.ST_L(ST_L),
			.clk(slow_clk),
			.rst(rst),
			.A1(A1), .A2(A2), .A3(A3), .A4(A4),
			.B1(B1), .B2(B2), .B3(B3), .B4(B4),
			
			.set(set),
			.setVal(number)
		);
	


endmodule
