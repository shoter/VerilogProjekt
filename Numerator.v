`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:48 11/28/2017 
// Design Name: 
// Module Name:    Numerator 
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
module Numerator(
		input [1:0] index,
		input enabled,
		input [4:0] key,
		input [2:0] ST_L,
		input clk,
		input rst,
		output reg [3:0] A1,A2,A3,A4,B1,B2,B3,B4
		
		,
		input set,
		input [15:0] setVal 
    );
	 
always @(posedge clk, posedge rst)
begin
	if(rst)
	begin
		A1 <= 4'd0;
		A2 <= 4'd0;
		A3 <= 4'd0;
		A4 <= 4'd0;
		B1 <= 4'd0;
		B2 <= 4'd0;
		B3 <= 4'd0;
		B4 <= 4'd0;
	end
	else if(set) begin
		A1 <= setVal[3:0];
		A2 <= setVal[7:4];
		A3 <= setVal[11:8];
		A4 <= setVal[15:12];
		B1 <= 4'd0;
		B2 <= 4'd0;
		B3 <= 4'd0;
		B4 <= 4'd0;
	end
	else if(enabled == 1'b1 && key >= `KEY_0 && key <= `KEY_9 && (ST_L == `SL_A || ST_L == `SL_B))
	begin
		case(index)
			2'd0: if(ST_L == `SL_A) A1 <= key[3:0]; else B1 <= key[3:0];
			2'd1: if(ST_L == `SL_A) A2 <= key[3:0]; else B2 <= key[3:0];
			2'd2: if(ST_L == `SL_A) A3 <= key[3:0]; else B3 <= key[3:0];
			2'd3: if(ST_L == `SL_A) A4 <= key[3:0]; else B4 <= key[3:0];
		endcase	
	end	
end
	 



endmodule
