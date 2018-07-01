`timescale 1ns / 1ps

module test_encoder();

	reg x1;
	reg x2;
	reg x3;
	reg x4;
	reg x5;
	reg x6;
	reg x7;
	reg x8;
	wire z1;
	wire z2;
	wire z3;

	encoder E(z1, z2, z3, x1, x2, x3, x4, x5, x6, x7, x8);

	initial
	begin
		$dumpfile("provaEncoder.vcd");
		$dumpvars;

		   {x1,x2,x3,x4,x5,x6,x7,x8} = 8'b10000000;
		#1 {x1,x2,x3,x4,x5,x6,x7,x8} = 8'b01000000;
		#1 {x1,x2,x3,x4,x5,x6,x7,x8} = 8'b00100000;
		#1 {x1,x2,x3,x4,x5,x6,x7,x8} = 8'b00010000;
		#1 {x1,x2,x3,x4,x5,x6,x7,x8} = 8'b00001000;
		#1 {x1,x2,x3,x4,x5,x6,x7,x8} = 8'b00000100;
		#1 {x1,x2,x3,x4,x5,x6,x7,x8} = 8'b00000010;
		#1 {x1,x2,x3,x4,x5,x6,x7,x8} = 8'b00000001;

		#10 $finish;
	end

endmodule