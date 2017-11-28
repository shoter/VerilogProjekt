`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:00 10/24/2017 
// Design Name: 
// Module Name:    write_cycle 
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
module write_cycle(
		input rst, clk,
		input wr_enable, reg_sel,
		output reg e_out, wr_finish,
		output rs_out, rw_out
    );

reg [1:0] st, nst;
localparam
idle = 2'd0,
init = 2'd1,
eout = 2'd2,
endwr = 2'd3;

always @(posedge clk, posedge rst)
begin
	if(rst)
		st <= idle;
	else
		st <= nst;
end

always @*
	case(st)
		idle: if(wr_enable) nst = init; else nst = idle;
		init: nst =eout;
		eout: nst = endwr;
		endwr: nst = idle;
endcase

always @*
begin
wr_finish = 1'b0;
	case(st)
		idle: begin e_out = 1'b0; end
		init: begin e_out = 1'b1; end
		eout: begin e_out = 1'b1; end
		endwr: begin
			e_out = 1'b0;
			wr_finish = 1'b1;
		end
endcase
end

assign rw_out = 1'b0;
assign rs_out = reg_sel;

endmodule
