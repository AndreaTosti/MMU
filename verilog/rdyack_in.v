//Indicatore a transizione di livello in ingresso

//Vale sia per RDYIN (P -> MMU) che ACKIN (MM -> MMU)

//rdyin oppure ackin in ingresso, registri d'interfaccia con Beta = 1, con possibilita' di eseguire Reset su di essi

module rdyack_in(output rdyackin, input linea_rdyackin, input beta, input clock);

	reg stato;
	wire counter_out;
	wire confrontatore_out;

	initial
	begin
		stato = 0;
	end

	always @(negedge clock) //NEGEDGE!!
	begin 
		stato = linea_rdyackin;
	end

	rdyack_out contatore_mod2(counter_out, beta, clock); //ack utilizzato come contatore mod2
	comparatore confrontatore(confrontatore_out, stato, counter_out);

	assign rdyackin = confrontatore_out;

endmodule