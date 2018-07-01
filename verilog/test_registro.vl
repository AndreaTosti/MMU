`timescale 1ns / 1ps

module prova_registro();

	parameter N = 3;
	reg [N-1:0]ingresso;
	reg clk;
	reg beta;
	wire [N-1:0]uscita;

	registro #(N) R(uscita, clk, beta, ingresso);

	initial
	begin
		clk = 0;
	end
	
	always 
	begin 
		if(clk == 0)
			#5 clk = 1;
		else
			#1 clk = 0;
	end

	initial
	begin
		$dumpfile("prova_registro.vcd");
		$dumpvars;
		//beta = 1;
		//ingresso = 118;
		#5 beta = 0; 
		#5 ingresso = 119;
		#5 beta = 1;
		#5 ingresso = 120;
		#5 beta = 0; 
		#5 beta = 1;
		#5 ingresso = 121;
		#10 $finish;
	end

endmodule
		