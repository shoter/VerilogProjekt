`include "defines.vh" 
`timescale 1ns / 1ps

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
module StateMachine
#(parameter waiter = 10000)
(
			input [4:0] key,
			input clk,
			input rst,
			input end_obl,
			output reg [1:0] ST,
			output reg [1:0] index,
			output reg [2:0] ST_L
    );
	 
localparam nbits = clog2b(waiter) + 1;
reg [nbits - 1:0] cnt;

assign comp = (cnt >= (waiter - 1));	 
 
always @(posedge clk, posedge rst)
begin
	if(rst) begin
		ST <= `S_WPR;
		ST_L <= `SL_A;
		index <= 2'd0;
	end
	else begin		
	case(ST)
		`S_GON: begin
			cnt <= cnt + 1;
			if(comp) begin
				ST <= key == `KEY_NONE ? `S_WPR : `S_GON;
				cnt  <= cnt <= {nbits{1'b0}};
			end end
		`S_WPR:
			begin
				if(key == `KEY_A)
				begin
					ST <= `S_GON;
					ST_L <= ST_L == `SL_A ? `SL_B : `SL_A;
					index <= 2'd0;
				end
				else if(key >= `KEY_0 && key <= `KEY_9)
				begin
					ST <= `S_GON;
					index <= index + 1;
				end
				else if(key != `KEY_NONE)
				begin
				ST <= `S_OP;
				index <= 2'd0;
					case(key)
						`KEY_B:
							ST_L <= `SL_ADD;
						`KEY_C:
							ST_L <= `SL_SUB;
						`KEY_D:
							ST_L <= `SL_AND;
						`KEY_E:
							ST_L <= `SL_OR;
						`KEY_F:
							ST_L <= `SL_XOR;
					endcase
				end	
			end
		`S_OP: begin
			cnt <= cnt + 1;
			if(comp) begin
			ST <= key == `KEY_NONE ? `S_OBL : `S_OP;
			cnt <= cnt <= {nbits{1'b0}};
			end end
		`S_OBL:
			ST <= key == `KEY_NONE && end_obl ? `S_WPR : `S_OBL;
		
	endcase
	end
end

function integer clog2b;
input reg[31:0] val;
begin
val = val - 1;
for(clog2b=0; val > 0; clog2b = clog2b + 1)
	val = val >> 1;
end
endfunction


endmodule
