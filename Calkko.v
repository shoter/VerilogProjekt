`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:46 12/12/2017 
// Design Name: 
// Module Name:    Calkko 
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
module Calkko(
		input [3:0] A1,A2,A3,A4,
		input [3:0] B1,B2,B3,B4,
		input [1:0] ST,
		input [2:0] ST_L,
		output set,
		output reg [15:0] number
    );

wire [13:0] binaryA, binaryB;
reg [13:0] binaryResult;

assign set = ST == `S_OBL;

wire [3:0] BCD1, BCD2, BCD3, BCD4;

bcd2bin bikko( .N1(A1), .N2(A2), .N3(A3), .N4(A4), .out(binaryA));
bcd2bin akko( .N1(B1), .N2(B2), .N3(B3), .N4(B4), .out(binaryB));
bin2bcd resultto (.bin(binaryResult), 
.thousands(BCD1), .hundreds(BCD2), .tens(BCD3), .ones(BCD4));



always @* begin
	if(set) begin
		case(ST_L) 
			`SL_ADD:
				binaryResult <= binaryA + binaryB;
			`SL_SUB:
				binaryResult <= binaryA - binaryB;
			`SL_XOR:
				binaryResult <= binaryA ^ binaryB;
			`SL_AND: 
				binaryResult <= binaryA & binaryB;
			`SL_OR: binaryResult <= binaryA | binaryB;
			default:
				binaryResult <= 14'd0;

		endcase
		number[15:12] <= BCD4;
				number[11:8] <= BCD3;
				number [7:4] <= BCD2;
				number[3:0] <= BCD1;
	end
	else 
	begin
		number <= 16'd0;
		binaryResult <= 14'd0;
	end
end


endmodule
