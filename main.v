`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:49 10/31/2017 
// Design Name: 
// Module Name:    main 
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
module main
#(parameter div = 250000)
( input rst, input clk,
input [3:0] row,
output [3:0] col,	
output rw_out, output rs_out, output e_out, output [7:0] db_out,
							  
		output [6:0] leds


);

localparam bcd1 = 4'd0, bcd2 = 4'd1, bcd3 = 4'd2, bcd4 = 4'd3;
//wire [3:0] bcd1, bcd2, bcd3, bcd4;
wire [1:0] lcd_cnt;
wire [1:0] init_sel, mux_sel;

wire [1:0] ST;
wire  [2:0] ST_L;
wire  [3:0] A1,A2,A3,A4,
				B1,B2,B3,B4;
wire [1:0] index;
reg blink;
wire blinkClock;

always @(posedge rst, posedge blinkClock)
begin
	if(rst)
		blink <= 1'b0;
	else
	blink <= ~blink;
end
kikko #(.div(100)) kikko(
	.clk(clk),
	.rst(rst),
	.row(row),
	.col(col),
	.ST(ST),
	.ST_L(ST_L),
	.A1(A1), .A2(A2), .A3(A3), .A4(A4),
	.B1(B1), .B2(B2), .B3(B3), .B4(B4),
	.leds(leds),
	.index(index)
);


clockDivider #(.div(div)) clokko 
(
.clk(clk),
.rst(rst),
.slow_clk(slow_clk)
);


clockDivider #(.div(2500000)) blinkko 
(
.clk(clk),
.rst(rst),
.slow_clk(blinkClock)
);


main_controller main_controller(
.rst(rst), .clk(slow_clk),
.lcd_finish(lcd_finish),
.data_sel(data_sel),
.db_sel(db_sel),
.lcd_enable(lcd_enable),
.mode(mode),
.reg_sel(reg_sel),
.lcd_cnt(lcd_cnt)
);

LCD_init_refresh lir(
.clk(slow_clk), .rst(rst),
.wr_finish(wr_finish),
.lcd_enable(lcd_enable),
.lcd_cnt(lcd_cnt),
.mode(mode),
.lcd_finish(lcd_finish),
.wr_enable(wr_enable),
.init_sel(init_sel),
.mux_sel(mux_sel)
);

write_cycle wr(
	.rst(rst), .clk(slow_clk),
	.wr_enable(wr_enable),
	.reg_sel(reg_sel),
	.e_out(e_out),
	.wr_finish(wr_finish),
	.rs_out(rs_out),
	.rw_out(rw_out)
);


LCD_dp ldp(
.init_sel(init_sel),
.data_sel(data_sel),
.DB_sel(db_sel),
.state(ST),
.statelocal(ST_L),
.index(mux_sel),
.A1(A1), .A2(A2), .A3(A3), .A4(A4),
.B1(B1), .B2(B2), .B3(B3), .B4(B4),
.inputIndex(index), .blink(blink),
.DB_out(db_out)
);



endmodule
