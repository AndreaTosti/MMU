//Indicatore a transizione di livello in uscita

//Vale sia per RDYOUT (MMU -> MM) che per ACKOUT (MMU -> P)

//rdyout oppure ackout in uscita, registri d'interfaccia, con possibilita' di eseguire Set su di essi

module rdyack_out(output rdyackout, input beta, input clock);

	reg stato;

	initial
	begin
	   stato = 0;
	end

	always @(negedge clock) //NEGEDGE !!
	begin 
		if(beta == 1)
			stato = ~stato;
	end

	assign rdyackout = stato;

endmodule