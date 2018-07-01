`timescale 1ns / 1ps

module test_selezionatore_8vie_nbit();

	reg [31:0]x;
	wire [31:0]z1;
	wire [31:0]z2;
	wire [31:0]z3;
	wire [31:0]z4;
	wire [31:0]z5;
	wire [31:0]z6;
	wire [31:0]z7;
	wire [31:0]z8;
	reg [2:0]alpha;
	
	selezionatore_8vie_nbit #(32) S(z1, z2, z3, z4, z5, z6, z7, z8, x, alpha);

	initial
	begin
		$dumpfile("provaSelezionatore.vcd");
		$dumpvars;


		x = 32'b11111_11111_11111_11111_11;

		#10 alpha = 3'd0;
		#10 alpha = 3'd1;
		#10 alpha = 3'd2;
		#10 alpha = 3'd3;
		#10 alpha = 3'd4;
		#10 alpha = 3'd5;
		#10 alpha = 3'd6;
		#10 alpha = 3'd7;

		#10 $finish;
	end

endmodule