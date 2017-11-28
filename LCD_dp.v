`timescale 1ns / 1ps
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
			input [1:0] init_sel, data_sel, DB_sel,
			input [3:0] state, input [3:0] statelocal, input [3:0] index,
			input [3:0] A1, input [3:0] A2, input [3:0] A3, input [3:0] A4,
			input [3:0] B1, input [3:0] B2, input [3:0] B3, input [3:0] B4,
			output reg [7:0] DB_out
    );
localparam [5:0] clear = 6'd1;
localparam [5:0] displayOn = 6'b001110;
localparam [5:0] entryMode = 6'b000110;
localparam [5:0] functionSet = 6'b111000;

reg [5:0] init_out;
reg [7:0] mux_out;
reg [7:0] data_out;
always @*
	case(init_sel)
	2'd0: init_out = clear;
	2'd1: init_out = displayOn;
	2'd2: init_out = entryMode;
	2'd3: init_out = functionSet;
	endcase
	
always @*
	case(mux_sel)
	2'd0: mux_out = {4'h3,count0};
	2'd1: mux_out = {4'h3,count1};
	2'd2: mux_out = {4'h3,count2};
	2'd3: mux_out = {4'h3,count3};
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
