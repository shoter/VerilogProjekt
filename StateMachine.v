`timescale 1ns / 1ps
`include "defines.h" 
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:23 11/28/2017 
// Design Name: 
// Module Name:    StateMachine 
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
module StateMachine(
			input key,
			input clk,
			input rst,
			output reg ST,
			output reg ST_L
    );
	 
always @(posedge clk, posedge rst)
begin
	if(rst) begin
		ST = S_WPR;
		ST_L = SL_A;
	end
end


endmodule
