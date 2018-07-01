module commutatore_8vie_nbit(z, x1, x2, x3, x4, x5, x6, x7, x8, alpha);

	parameter   	  N = 20;
	output reg [N-1:0]z;
	input  	   [N-1:0]x1;
	input  	   [N-1:0]x2;
	input      [N-1:0]x3;
	input      [N-1:0]x4;
	input      [N-1:0]x5;
	input      [N-1:0]x6;
	input      [N-1:0]x7;
	input      [N-1:0]x8;
	input      [2:0]alpha;

	always @(alpha or x1 or x2 or x3 or x4 or x5 or x6 or x7 or x8) 
	begin
		case (alpha)
			3'b000 : z <= #2 x1; 
			3'b001 : z <= #2 x2;
			3'b010 : z <= #2 x3;
			3'b011 : z <= #2 x4;
			3'b100 : z <= #2 x5;
			3'b101 : z <= #2 x6;
			3'b110 : z <= #2 x7;
			3'b111 : z <= #2 x8;
		endcase
	end

endmodule