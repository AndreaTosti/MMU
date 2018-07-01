module alu_somma(output [N-1:0]z, input [N-1:0]x, input [N-1:0]y);

	parameter N = 32;

	assign #5 z = x + y;

endmodule