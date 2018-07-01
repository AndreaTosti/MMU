`timescale 1ns / 1ps

module prova_confrontatore();

	reg [19:0]a;
	reg [19:0]b;
	wire f;

	confrontatore_nbit c1(f, a, b);
	initial
	begin
		$dumpfile("prova_confrontatore.vcd");
		$dumpvars;
		a = 0;
		b = 0;
		#10 a = 'd1110000;
		#10 b = 'd1110000;
		#10 a = 'd2111000;
		#10 b = 'd2110000;
		#20 $finish;
	end

endmodule