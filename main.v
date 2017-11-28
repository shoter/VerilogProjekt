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
#(parameter div = 2500000)
( input rst, input clk, inp, output rw_out, output rs_out, output e_out, output [7:0] db_out);

localparam bcd1 = 4'd0, bcd2 = 4'd1, bcd3 = 4'd2, bcd4 = 4'd3;
//wire [3:0] bcd1, bcd2, bcd3, bcd4;
wire [1:0] lcd_cnt;
wire [1:0] init_sel, mux_sel;

clockDivider #(.div(div)) clokko 
(
.clk(clk),
.rst(rst),
.slow_clk(slow_clk)
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

red red(
.clk(clk),
.rst(rst),
.en(inp),
.out(rededge));
/*
bcdCounter bcdc(
	.clk(clk),
	.rst(rst),
	.en(rededge),
	.out1(bcd1),
	.out2(bcd2),
	.out3(bcd3),
	.out4(bcd4)
);
*/
LCD_dp ldp(
.init_sel(init_sel),
.data_sel(data_sel),
.DB_sel(db_sel),
.count0(bcd1),
.count1(bcd2),
.count2(bcd3),
.count3(bcd4),
.DB_out(db_out)
);



endmodule
