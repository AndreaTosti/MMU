module commutatore_3vie_nbit(z, x, y, w, alpha);

	parameter N = 32;

	output reg [N-1:0]z;
	input [N-1:0]x;
	input [N-1:0]y;
    input [N-1:0]w;

	input [1:0]alpha;

	always @(alpha or x or y or w) 
	begin
		case (alpha)
			2'b00 : z <= #2 x;
			2'b01 : z <= #2 y; 
            2'b10 : z <= #2 w;
		endcase
	end

endmodule
