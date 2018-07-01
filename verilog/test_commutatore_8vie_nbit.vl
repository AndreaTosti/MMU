`timescale 1ns / 1ps

module test_commutatore_8vie_nbit();

	reg [31:0]x1;
	reg [31:0]x2;
	reg [31:0]x3;
	reg [31:0]x4;
	reg [31:0]x5;
	reg [31:0]x6;
	reg [31:0]x7;
	reg [31:0]x8;
	reg [2:0]alpha;
	wire [31:0]z;

	commutatore_8vie_nbit #(32) K(z, x1, x2, x3, x4, x5, x6, x7, x8, alpha);

	initial
	begin
		$dumpfile("provaCommutatore.vcd");
		$dumpvars;


		x1 = 32'b1000;
		x2 = 32'b1001;
		x3 = 32'b1010;
		x4 = 32'b1011;
		x5 = 32'b1100;
		x6 = 32'b1101;
		x7 = 32'b1110;
		x8 = 32'b1111;

		#10 alpha = 3'd6;
		#10 alpha = 3'd7;
		#10 alpha = 3'd0;
		#10 alpha = 3'd5;
		#10 alpha = 3'd1;
		#10 alpha = 3'd3;
		#10 alpha = 3'd2;
		#10 alpha = 3'd4;

		#10 $finish;
	end

endmodule