`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:22 10/17/2017 
// Design Name: 
// Module Name:    ctndek 
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
module ctndek(
			input clk,
			input rst,
			input en,
			output reg ovl,
			output reg [3:0] out
    );
always @(posedge clk, posedge rst)
begin
	if(rst)
		out <= 4'd0;
	else if(en)
		if(out == 4'd9)
			out <= 4'd0;
		else
			out <= out + 1;
end
	 
always @(posedge clk, posedge rst)
begin
	if(rst)
		ovl <= 1'b0;
	else
		if (out == 4'd9)
			ovl <= 1'b1;
		else
			ovl <= 1'b0;
end


endmodule
