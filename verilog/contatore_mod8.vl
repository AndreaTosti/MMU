module contatore_mod8(c_out, clock, beta);

	input clock;
	input beta;
	output [2:0]c_out;
	
	reg [2:0] stato;

	initial
	begin 
		stato = 3'b000;
	end

	always @(posedge clock)
	begin
		if(beta == 1)
			begin 
				stato = #2 stato + 1;
			end
	end

	assign c_out = stato;

endmodule