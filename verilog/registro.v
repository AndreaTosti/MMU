module registro(out, clock, beta, in);

	parameter N = 32;

	output [N-1:0]out;
	input clock;
	input beta;
	input [N-1:0]in;

	reg [N-1:0]stato;

	initial
	begin 
		stato = 0;
	end

	always @(posedge clock)
	begin 
		if(beta == 1)
			stato <= in;
	end

	assign out = stato;

endmodule