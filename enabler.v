`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:23 11/28/2017 
// Design Name: 
// Module Name:    enabler 
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
module enabler(
		input [1:0] ST,
		input [2:0] ST_L
		output en
    );
	 
assign en = ST == `S_WPR && (ST_L == `SL_A || ST_L == `SL_B);


endmodule
