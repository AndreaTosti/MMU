`timescale 1ns/1ps

module test_rdyackin_rdyackout();

	//Interfaccia ingresso MMU
	reg lineaRdyIn;
	reg lineaAckIn;

	reg betaRdyIn; //per resettare RdyIn
	reg betaAckIn; //per resettare AckIn
	reg betaRdyOut; //per settare RdyOut
	reg betaAckOut; //per settare AckOut

	wire rdyIn;
	wire ackIn;
	wire rdyOut;
	wire ackOut;

	reg clock;

	//module(output rdyackin, input linea_rdyackin, input beta, input clock);
	rdyack_in RDYIN(rdyIn, lineaRdyIn, betaRdyIn, clock);
	rdyack_in ACKIN(ackIn, lineaAckIn, betaAckIn, clock);
	//module rdyack_out(output rdyackout, input beta, input clock);
	rdyack_out RDYOUT(rdyOut, betaRdyOut, clock);
	rdyack_out ACKOUT(ackOut, betaAckOut, clock);

	always
	begin 
	if(clock)
		#1	clock = ~clock;
	else
		#4	clock = ~clock;
	end

	initial
	begin 
		$dumpfile("prova_rdyack_inout.vcd");
		$dumpvars;
		
		clock = 0;

		#10 lineaRdyIn = 1; //ricevo qualcosa in ingresso e lo uso
		#5  betaAckOut <= 1; //Set Ackout
			betaRdyIn <= 1; //Reset RdyIn
		#30 lineaAckIn = 1; //ricevo qualcosa dall'altra unita' e lo uso
		#5  betaRdyOut <= 1; //Set RdyOut
			betaAckIn <= 1; //Reset AckIn

		#30 $finish;
	end
	
endmodule