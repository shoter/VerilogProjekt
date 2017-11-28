`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:27 11/21/2017 
// Design Name: 
// Module Name:    reg 
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
module red(  input clk, input rst, input en,
					output out
    );
reg[1:0] tmp;

always @(posedge clk, posedge rst)
begin
	if(rst)
		tmp <= 2'b0;
	else begin
		tmp[0] <= en;
		tmp[1] <= tmp[0];
	end
end

assign out = tmp[0] && ~tmp[1];

endmodule
