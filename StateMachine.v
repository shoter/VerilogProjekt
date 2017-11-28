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
			output reg [1:0] ST,
			output reg [2:0] ST_L
    );


reg [1:0] nST, nST_L;
	 
always @(posedge clk, posedge rst)
begin
	if(rst) begin
		ST <= S_WPR;
		ST_L <= SL_A;
	end
	else begin
		//ST <= nST;
		//ST_L <= nST_L;
		
	case(ST)
		S_GON:
			ST <= key == KEY_NONE ? S_WPR : S_GON;
		S_WPR:
			begin
				if(key == KEY_A)
				begin
					ST <= S_GON;
					ST_L <= ST_L == SL_A ? SL_B : SL_A;
				end
				if(key >= KEY_0 && KEY <= KEY9)
				begin
					ST <= S_GON;
				end
				else
				begin
				ST <= S_OP;
					case(key)
						KEY_B:
							ST_L <= SL_ADD
						KEY_C:
							ST_L <= SL_SUB;
						KEY_D:
							ST_L <= SL_AND;
						KEY_E:
							ST_L <= SL_OR;
						KEY_F:
							ST_L <= SL_XOR;
					endcase
				end
					
			end
		
	endcase
	end
end

always @(posedge clk)
begin
if(ST == S_WPR)
end
/*
always @
begin
	case(ST)
		S_GON:
			nST = key == KEY_NONE ? S_WPR : S_GON;
		S_WPR:
			begin
				if(key == KEY_A)
					
			end
		
	endcase

end*/


endmodule
