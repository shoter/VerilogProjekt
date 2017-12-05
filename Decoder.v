`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc 2011
// Engineer: Michelle Yu  
//				 Josh Sackos
// Create Date:    07/23/2012 
//
// Module Name:    Decoder
// Project Name:   PmodKYPD_Demo
// Target Devices: Nexys3
// Tool versions:  Xilinx ISE 14.1 
// Description: This file defines a component Decoder for the demo project PmodKYPD. The Decoder scans
//					 each column by asserting a low to the pin corresponding to the column at 1KHz. After a
//					 column is asserted low, each row pin is checked. When a row pin is detected to be low,
//					 the key that was pressed could be determined.
//
// Revision History: 
// 						Revision 0.01 - File Created (Michelle Yu)
//							Revision 0.02 - Converted from VHDL to Verilog (Josh Sackos)
//////////////////////////////////////////////////////////////////////////////////////////////////////////

// ==============================================================================================
// 												Define Module
// ==============================================================================================
module Decoder(
	 input clk,
	 input rst,
	 input [3:0] row,
	 output reg [3:0] Col,
	 output reg [4:0] DecodeOut
    );



// ==============================================================================================
// 												Implementation
// ==============================================================================================


reg [2:0] Column;
reg [2:0] nextColumn;
reg state;
reg [4:0] CurrentKey;

	always @(posedge clk, posedge rst) begin
			if(rst)
				begin
					Column <= 3'd0; 
					nextColumn <= 3'd0;
					state <= 1'b1;
					CurrentKey <= `KEY_NONE;
				end
			else	
			begin
				if(state) begin
					Column <= nextColumn;
							
					case(nextColumn)
						3'd0: Col <= 4'b0111;
						3'd1: Col <= 4'b1011;
						3'd2: Col <= 4'b1101;
						3'd3: Col <= 4'b1110;
						3'd4: 
						begin
							DecodeOut <= CurrentKey;
							CurrentKey <= `KEY_NONE;
							Column <= 3'd0;
						end
					endcase
				end
				else begin
					case (Column)
						3'd0:
							case(row)
								4'b0111: CurrentKey <= `KEY_1;
								4'b1011: CurrentKey <= `KEY_4;
								4'b1101: CurrentKey <= `KEY_7;
								4'b1110: CurrentKey <= `KEY_0;
							endcase
						3'd1:
							case(row)
								4'b0111: CurrentKey <= `KEY_2;
								4'b1011: CurrentKey <= `KEY_5;
								4'b1101: CurrentKey <= `KEY_8;
								4'b1110: CurrentKey <= `KEY_F;
							endcase
						3'd2:
							case(row)
								4'b0111: CurrentKey <= `KEY_3;
								4'b1011: CurrentKey <= `KEY_6;
								4'b1101: CurrentKey <= `KEY_9;
								4'b1110: CurrentKey <= `KEY_E;
							endcase
						3'd3:
							case(row)
								4'b0111: CurrentKey <= `KEY_A;
								4'b1011: CurrentKey <= `KEY_B;
								4'b1101: CurrentKey <= `KEY_C;
								4'b1110: CurrentKey <= `KEY_D;
							endcase
					endcase
					nextColumn <= nextColumn + 1;
				end
				state <= ~state;
			end
	end

endmodule
