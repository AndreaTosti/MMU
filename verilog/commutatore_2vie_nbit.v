module commutatore_2vie_nbit(z, x, y, alpha);

	parameter N = 32;

	output reg [N-1:0]z;
	input [N-1:0]x;
	input [N-1:0]y;
	input alpha;

	always @(alpha or x or y) 
	begin
		case (alpha)
			1'b0 : z <= #2 x;
			1'b1 : z <= #2 y; 
		endcase
	end

endmodule
