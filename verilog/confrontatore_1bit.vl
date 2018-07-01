module confrontatore_1bit(z, x, y);

	output wire z;
	input wire x;
	input wire y;

	wire termine1;
	wire termine2;
	wire notx;
	wire noty;

	not(notx, x);
	not(noty, y);

	and_tp and1(termine1, notx, y);
	and_tp and2(termine2, x, noty);

	or_tp or1(z, termine1, termine2);

endmodule