`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:52 10/10/2017 
// Design Name: 
// Module Name:    clockDivider 
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
module clockDivider
	#(parameter div = 25000000)
	(
		input clk,
		input rst,
		output reg slow_clk
    );

localparam nbits = clog2b(div);
reg [nbits-1:0] cnt;

assign comp = (cnt == (div - 1));

always @(posedge clk, posedge rst) begin
	if(rst)
		cnt <= {nbits{1'b0}};
	else if(comp)
		cnt <= {nbits{1'b0}};
	else
		cnt <= cnt + 1;
end

always @(posedge clk, posedge rst) begin
	if(rst) slow_clk <= 1'b0;
	else if(comp)
		slow_clk <= 1'b1;
	else 
		slow_clk <= 1'b0;
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
