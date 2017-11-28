`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:53 10/24/2017 
// Design Name: 
// Module Name:    main_controller 
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
module main_controller(
			input rst, clk,
			input lcd_finish,
			output reg mode,
			output reg data_sel, db_sel, lcd_enable, reg_sel,
			output reg [1:0] lcd_cnt
    );
reg [2:0] st, nst;
localparam
idle = 3'd0,
init = 3'd1,
addr = 3'd2,
addr1 = 3'd3,
ref = 3'd4,
ref1 = 3'd5;

localparam
LCD_INIT = 1,
LCD_REF = 0,
REF_DATA_NO = 4;

always @(posedge clk, posedge rst)
begin
	if(rst)
	begin
		st <= idle;
	//	mode <= LCD_INIT;
	end
	else
	begin
		st <= nst;
		
		//if(nst == ref)
		//	mode <= LCD_REF;
	end
end

always @*
begin
lcd_enable = 1'b0;
db_sel = 1'b1;
lcd_cnt = 2'd3;
data_sel = 1'b0;
reg_sel = 1'b0;
data_sel = 1'b0;//mode == LCD_REF;
mode = LCD_INIT;
	case(st) 
	idle:
	begin
		lcd_enable = 1'b1;
	end
	init: begin
	end
	addr:
	begin
				lcd_enable = 1'b1;
				db_sel = 1'b0;
				lcd_cnt = 2'd0;
	end
	
	addr1:
	begin
		db_sel = 1'b0;
		lcd_cnt = 2'd0;
	end
	
	ref:
	begin
		lcd_enable = 1'b1;
		reg_sel = 1'b1;
		data_sel = 1'b1;
		mode = LCD_REF;
	end
	
	ref1:
	begin
		reg_sel = ~lcd_finish;
		data_sel = 1'b1;
		mode = LCD_REF;
	end
	
	endcase
end

always @* begin
	nst <= idle;
	case(st)
		idle: nst <= init;
		init: nst <= lcd_finish ? addr : init;
		addr: nst <= addr1;
		addr1: nst <= lcd_finish ? ref : addr1;
		ref: 	nst <= ref1;
		ref1: nst <= lcd_finish ? addr : ref1;
	endcase
end

endmodule
