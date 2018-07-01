module confrontatore_nbit(r, x, y);

	parameter N = 20;

	input [N-1:0]x;
	input [N-1:0]y;
	output r;

	wire  [N-1:0]z;

	genvar i;
	
	generate 
		for(i = 0; i < N; i=i+1)
			begin : testo_utile_a_togliere_il_warning
				confrontatore_1bit t(z[i], x[i], y[i]); //sono stati pagati 2tp.
			end
	endgenerate

	assign #4 r = ((|z) ? 1 : 0);

endmodule