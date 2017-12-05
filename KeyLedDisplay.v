`timescale 1ns / 1ps
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
		input [4:0] key,
		output reg [6:0] segOut
    );

always @(key) begin
			case (key)

					5'h0 : segOut <= 7'd1;  // 0
					5'h1 : segOut <= 7'd2;  // 1
					5'h2 : segOut <= 7'd3;  // 2
					5'h3 : segOut <= 7'd4;  // 3
					5'h4 : segOut <= 7'd5;  // 4
					5'h5 : segOut <= 7'd6;  // 5
					5'h6 : segOut <= 7'd7;  // 6
					5'h7 : segOut <= 7'd8;  // 7
					5'h8 : segOut <= 7'd9;  // 8
					5'h9 : segOut <= 7'd10;  // 9
					5'hA : segOut <= 7'd11; 	// A
					5'hB : segOut <= 7'd12;	// B
					5'hC : segOut <= 7'd13;	// C
					5'hD : segOut <= 7'd14;	// D
					5'hE : segOut <= 7'd15;	// E
					5'hF : segOut <= 7'd16;	// F
					//default : segOut <= 7'd0;
					
			endcase
	end

endmodule
