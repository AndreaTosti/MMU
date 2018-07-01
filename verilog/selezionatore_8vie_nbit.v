module selezionatore_8vie_nbit(z1, z2, z3, z4, z5, z6, z7, z8, x, alpha);

	parameter N = 31;
	input [N-1:0]x;
	output [N-1:0]z1;
	output [N-1:0]z2;
	output [N-1:0]z3;
	output [N-1:0]z4;
	output [N-1:0]z5;
	output [N-1:0]z6;
	output [N-1:0]z7;
	output [N-1:0]z8;
	input  [2:0]alpha;

	assign #1 z1 = (((~alpha[2]) & (~alpha[1]) & (~alpha[0])) ? x : 0);
	assign #1 z2 = (((~alpha[2]) & (~alpha[1]) & alpha[0]) ? x : 0);
	assign #1 z3 = (((~alpha[2]) & alpha[1] & (~alpha[0])) ? x : 0);
	assign #1 z4 = (((~alpha[2]) & alpha[1] & alpha[0]) ? x : 0);
	assign #1 z5 = ((alpha[2] & (~alpha[1]) & (~alpha[0])) ? x : 0);
	assign #1 z6 = ((alpha[2] & (~alpha[1]) & alpha[0]) ? x : 0);
	assign #1 z7 = ((alpha[2] & alpha[1] & (~alpha[0])) ? x : 0);
	assign #1 z8 = ((alpha[2] & alpha[1] & alpha[0]) ? x : 0);

endmodule