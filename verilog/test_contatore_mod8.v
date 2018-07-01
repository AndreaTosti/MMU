module test_contatore_mod8();

	reg clock;
	reg beta;

	wire[2:0] c_out;

	initial
	begin
		$dumpfile("prova_contatoreMod8.vcd");
		$dumpvars;
		clock = 1;
		beta = 0;

		#5   beta = 1;
		#100 beta = 0;
		#10  $finish;
	end

	always 
	begin 
		if(clock == 0)
			#5 clock = 1;
		else
			#1 clock = 0;
	end

	contatore_mod8 CNTmod8(c_out, clock, beta);
endmodule