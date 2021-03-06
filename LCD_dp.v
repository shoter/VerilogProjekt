`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:59 10/24/2017 
// Design Name: 
// Module Name:    LCD_dp 
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
module LCD_dp(
			input [1:0] init_sel, input data_sel, DB_sel,
			input [1:0] state, input [2:0] statelocal, input [1:0] index,
			input [3:0] A1, input [3:0] A2, input [3:0] A3, input [3:0] A4,
			input [3:0] B1, input [3:0] B2, input [3:0] B3, input [3:0] B4,
			input [1:0] inputIndex, input blink,
			output reg [7:0] DB_out
    );
localparam [5:0] clear = 6'd1;
localparam [5:0] displayOn = 6'b001110;
localparam [5:0] entryMode = 6'b000110;
localparam [5:0] functionSet = 6'b111000;


reg [5:0] init_out;
reg [7:0] mux_out;
reg [7:0] data_out;
reg [3:0] num_out;
reg [3:0] A_out;
reg [3:0] B_out;
reg [7:0] OP_out;
always @*
	case(init_sel)
	2'd0: init_out = clear;
	2'd1: init_out = displayOn;
	2'd2: init_out = entryMode;
	2'd3: init_out = functionSet;
	endcase
	
always @*
	case(state)
	2'd0: 
	begin
		if((2'd3 - index) == inputIndex && blink)
			mux_out = `ASCII_BLANK;
		else
			mux_out = {4'h3, num_out};
	end
	2'd1: mux_out = OP_out;
	default: mux_out = `ASCII_BLANK;
	endcase
	
always @*
	case(statelocal)
	3'd0: num_out = A_out;
	3'd1: num_out = B_out;
	default: num_out = A_out;
	endcase
	
always @*
	case(index)
	2'd0: begin A_out = A4; B_out = B4; end
	2'd1: begin A_out = A3; B_out = B3; end
	2'd2: begin A_out = A2; B_out = B2; end
	2'd3: begin A_out = A1; B_out = B1; end
	endcase
	
always @*
	case(statelocal)
	`SL_ADD:
		case(index)
		2'd2: OP_out = `ASCII_A;
		2'd0, 2'd1: OP_out = `ASCII_D;
		default: OP_out = `ASCII_BLANK;
		endcase
		
	`SL_SUB:
		case(index)
		2'd2: OP_out = `ASCII_S;
		2'd1: OP_out = `ASCII_U;
		2'd0: OP_out = `ASCII_B;
		default: OP_out = `ASCII_BLANK;
		endcase

	`SL_AND:
		case(index)
		2'd2: OP_out = `ASCII_A;
		2'd1: OP_out = `ASCII_N;
		2'd0: OP_out = `ASCII_D;
		default: OP_out = `ASCII_BLANK;
		endcase

	`SL_OR: 
		case(index)
		2'd1: OP_out = `ASCII_O;
		2'd0: OP_out = `ASCII_R;
		default: OP_out = `ASCII_BLANK;
		endcase

	`SL_XOR: 
		case(index)
		2'd2: OP_out = `ASCII_X;
		2'd1: OP_out = `ASCII_O;
		2'd0: OP_out = `ASCII_R;
		default: OP_out = `ASCII_BLANK;
		endcase
	default: OP_out = `ASCII_BLANK;
	endcase

always @*
	case(data_sel)
	1'b0: data_out = init_out;
	1'b1: data_out = mux_out;
	endcase

always @*
	case(DB_sel)
	1'b0: DB_out = 8'hcc;
	1'b1: DB_out = data_out;
	endcase
	

endmodule