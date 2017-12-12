`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:32 12/12/2017 
// Design Name: 
// Module Name:    bcd2bin 
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
module bcd2bin(
		input [3:0] N1, N2, N3, N4,
		output [13:0] out
    );
	 
assign out = N1 * 1000 + N2 * 100 + N3 * 10 + N4;

endmodule
