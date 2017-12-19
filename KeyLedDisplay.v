`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:33 12/05/2017 
// Design Name: 
// Module Name:    KeyLedDisplay 
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
module KeyLedDisplay(
		input [1:0] ST,
		input [2:0] ST_L,
		output reg [6:0] segOut
    );

always @*
	if(ST == `S_WPR)
	begin
		if(ST_L == `SL_A)
			segOut <= 7'd1;
		else
			segOut <= 7'd3;
	end
	else
		segOut <= 7'd0;
endmodule
