`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:23:33 11/28/2017
// Design Name:   LCD_dp
// Module Name:   /home/lab_jos/.4laczak/projekt/VerilogProjekt/LCD_dp_tb.v
// Project Name:  VerilogProjekt
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LCD_dp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LCD_dp_tb;

	// Inputs
	reg [1:0] init_sel;
	reg data_sel;
	reg DB_sel;
	reg [1:0] state;
	reg [2:0] statelocal;
	reg [1:0] index;
	reg [3:0] A1;
	reg [3:0] A2;
	reg [3:0] A3;
	reg [3:0] A4;
	reg [3:0] B1;
	reg [3:0] B2;
	reg [3:0] B3;
	reg [3:0] B4;

	// Outputs
	wire [7:0] DB_out;

	// Instantiate the Unit Under Test (UUT)
	LCD_dp uut (
		.init_sel(init_sel), 
		.data_sel(data_sel), 
		.DB_sel(DB_sel), 
		.state(state), 
		.statelocal(statelocal), 
		.index(index), 
		.A1(A1), 
		.A2(A2), 
		.A3(A3), 
		.A4(A4), 
		.B1(B1), 
		.B2(B2), 
		.B3(B3), 
		.B4(B4), 
		.DB_out(DB_out)
	);

	initial begin
		// Initialize Inputs
		init_sel = 0;
		data_sel = 0;
		DB_sel = 0;
		state = 0;
		statelocal = 0;
		index = 0;
		A1 = 0;
		A2 = 0;
		A3 = 0;
		A4 = 0;
		B1 = 0;
		B2 = 0;
		B3 = 0;
		B4 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2 init_sel = 2'd0;
		#2 init_sel = 2'd1;
		#2 init_sel = 2'd2;
		#2 init_sel = 2'd3;
		
		#5 data_sel = 1'b1;
		#5 DB_sel = 1'b1;
		
		// State - OP
		#5 state = 2'd1;
		statelocal = 3'd0; //ADD
		index = 2'd0;
		#5 index = 2'd1;
		#5 index = 2'd2;
		#5 index = 2'd3;
		
		#5 statelocal = 3'd4; //XO (R)
		index = 2'd0;
		#5 index = 2'd1;
		
		
		
		// State - OBL
		#20 state = 2'd2;
		
		// State - WPR
		#20 state = 2'd0;
		A1 = 4'd9;
		A2 = 4'd3;
		A3 = 4'd7;
		A4 = 4'd1;
		B1 = 4'd2;
		B2 = 4'd4;
		B3 = 4'd6;
		B4 = 4'd8;
		
		#5 statelocal = 3'd0;
		index = 2'd0;
		
		#5 index = 2'd1;
		#5 index = 2'd2;
		#5 index = 2'd3;
		

	end
	
	initial begin
		#300 $finish;
	end
      
endmodule

