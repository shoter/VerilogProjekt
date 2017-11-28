`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:45 10/24/2017 
// Design Name: 
// Module Name:    LCD_init_refresh 
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
module LCD_init_refresh(
			input clk, rst,
			input wr_finish, input lcd_enable, input [1:0] lcd_cnt, input mode, 
			output reg lcd_finish, output reg wr_enable, output reg [1:0] init_sel, output reg [1:0] mux_sel
    );
	 
reg [1:0] st, nst;
localparam
idle = 2'd0,
data = 2'd1,
data1 = 2'd2,
endlcd = 2'd3;	 


always @(posedge clk, posedge rst)
begin
	if(rst) begin
		st <= idle;
		init_sel <= 2'd0;
		mux_sel <= 2'd0;
	end
	else
		begin
			st <= nst;
			case(st)
				idle: 
					if(mode)
						init_sel <= lcd_cnt;
					else
						mux_sel <= lcd_cnt;
				endlcd:
					if(mode)
					begin
						if(init_sel != 2'd0)
							init_sel <= init_sel - 1;
					end
					else if (mux_sel != 2'd0)
						mux_sel <= mux_sel - 1;
			endcase
		end
end

always @*
begin
lcd_finish = 1'b0;
wr_enable = 0;
case(st)
	data:
		wr_enable = 1'b1;
	endlcd: begin
	if(mode == 1'b1)
	begin
		if( init_sel == 2'd0)
			lcd_finish = 1'b1; 
	end
	else if(mux_sel == 2'd0)
			lcd_finish = 1'b1;
	end
endcase
end

always @*
	case(st)
		idle:
			if(lcd_enable)
				begin
					nst <= data;
				end
			else
				nst <= idle;
		data:
			nst <= data1;
		data1:
			if(wr_finish) 
				nst <= endlcd;
			else
				nst <= data1;
		endlcd:
			case(mode)
			 1'b0:
			 begin
				if(mux_sel > 2'd0)
					nst <= data;
				else
					nst <= idle;
			 end
			 1'b1:
				if(init_sel > 2'd0)
					nst <= data;
				else
					nst <= idle;
			 endcase
	endcase


endmodule
