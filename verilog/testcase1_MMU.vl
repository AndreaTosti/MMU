`timescale 1ns / 1ps

module testcase1_MMU();

	`define TAU 21 // Il TAU e' 22, di cui 1ns e' l'impulso
	`define TAU_C 23
	`define TAU_M 25
	parameter N = 32;

	reg clock;

	//Ingresso MMU (Da processore P a MMU)
	reg RDYIN;
	reg [1:0]OP;
	reg [N-1:0]IND;
	reg [N-1:0]DATAIN;

	//Ingresso MMU (Da memoria M a MMU)
	reg [N-1:0]DATAINM;
	reg ESITOM;
	reg ACKINM;

	//Ingresso MMU (Da memoria C a MMU)
	reg [N-1:0]DATAINC;
	reg ESITOC;
	reg ACKINC;

	//Uscita MMU (Da MMU a P)
	wire [N-1:0] DATAOUT;
	wire ESITO;
	wire ACKOUT;

	//Uscita MMU (Da MMU a M)
	wire RDYOUTM;
	wire [1:0]OPOUTM;
	wire [N-1:0]INDOUTM;

	//Uscita MMU (Da MMU a C)
	wire RDYOUTC;
	wire [1:0]OPOUTC;
	wire [N-1:0]DATAOUTC;
	wire [N-1:0]INDOUTC;

	//Istanziazione Unita' firmware MMU
	MMU #(32) MMU_UF(DATAOUT, ESITO, ACKOUT, RDYOUTM, RDYOUTC, OPOUTM, OPOUTC, DATAOUTC, INDOUTM, INDOUTC,
			clock, RDYIN, OP, IND, DATAIN, DATAINM, DATAINC, ESITOC, ESITOM, ACKINM, ACKINC);

	//Segnale di clock
	always
	begin
		#`TAU clock = 1;
		#1    clock = 0;
	end

	//valori iniziali dei registri
	initial
	begin 
		clock = 0;
		//Stato iniziale indicatori a transizione di livello
		ACKINM = 1'b1;
		ACKINC = 1'b1;
		RDYIN = 1'b0;
	end

	initial
	begin 
		$dumpfile("testcase1.vcd");
		$dumpvars;
		#1	//1 secondo per partire, altrimenti non riesce a calcolare i beta

		//OP: Flush TLB (Processore -> MMU)		
			OP = 2'b10;
			IND = 13'h1000;
			RDYIN = 1'b1;

		//44 ns
		//La MMU manda l'esito al processore

		#43 #`TAU #3

		//68 ns
		//OP: Lettura di un dato (Processore -> MMU)
			OP = 2'b00;
			IND = 14'h2001;
			RDYIN = 1'b0;
		//Fault MA - TLB MISS

		//109 ns 
		//La MMU manda la richiesta alla memoria M
		#41  #`TAU_M #3

		//137 ns
		//La memoria M risponde alla richiesta di 
		//linea di tabril (esito = 0, linea presente in TABRIL)
			DATAINM = 14'h2004;
			ESITOM = 1'b0;
			ACKINM = 1'b0;

		//176 ns
		//La MMU manda la richiesta del dato alla Cache passandogli l'IPF.
		#39 #`TAU_C #3

		//202 ns
		//La Cache risponde alla MMU con il dato (presente in cache)
			DATAINC = 6'h20;
			ESITOC = 1'b0;
			ACKINC = 1'b0;

		//241 ns
		//La MMU manda il dato e l'esito al processore

		#39 #`TAU #3
		//265 ns
		//Scrittura di un dato (Processore -> MMU)
			OP = 2'b01;
			IND = 14'h2008;
			DATAIN = 6'h25;
			RDYIN = 1'b1;

		//307 ns
		//La MMU manda la richiesta alla cache (dopo una TLB-HIT)

		#42 #`TAU_C #3

		//333 ns
		//La Cache risponde alla MMU con l'esito di avvenuta scrittura
			ESITOC = 1'b0;
			ACKINC = 1'b1;

		//374 ns
		//La MMU manda l'esito al processore

		#41 #`TAU #3

		//398 ns
		//Lettura di un dato (Processore -> MMU)
			OP = 2'b00;
			IND = 14'h2018;
			RDYIN = 1'b0;
		
		//440 ns
		//La MMU manda la richiesta alla cache(dopo una TLB-HIT)

		#42 #`TAU_C #3

		//466 ns
		//Fault di Cache C, la Cache C manda la richiesta alla memoria M

		#`TAU_M #`TAU_M #`TAU_C #3

		//542 ns
		//La Cache risponde alla MMU con il dato (presente in Cache C)
			DATAINC = 6'h34;
			ESITOC = 1'b0;
			ACKINC = 1'b0;

		//572 ns
		//La MMU manda il dato e l'esito al processore

		#30 #`TAU #3
		//596 ns
		//OP: Scrittura di un dato (Processore -> MMU)
			OP = 2'b01;
			IND = 15'h5100;
			DATAIN = 7'h76;
			RDYIN = 1'b1;
		//Fault MA - TLB MISS

		//638 ns
		//La MMU manda la richiesta alla memoria M
		#42 #`TAU_M #3

		//666 ns
		//La memoria M risponde alla richiesta di 
		//linea di tabril (esito = 0, linea presente in TABRIL)
			DATAINM = 14'h2090;
			ESITOM = 1'b0;
			ACKINM = 1'b1;

		//704 ns
		//La MMU manda la richiesta del dato alla Cache passandogli l'IPF
		#38 #`TAU_C #3

		//730 ns
		//La Cache risponde alla MMU con il dato (presente in cache)
			ESITOC = 1'b0;
			ACKINC = 1'b1;

		//771 ns
		//La MMU manda l'esito al processore

		#41 #`TAU #3

		//795 ns
		//Lettura di un dato (Processore -> MMU)
			OP = 2'b00;
			IND = 14'h3008;
			RDYIN = 1'b0;
		//Fault MA - TLB MISS

		//836ns
		//La MMU manda la richiesta alla memoria M
		#41	 #`TAU_M #3

		//864 ns
		//La memoria M risponde con un esito = Fault di Pagina
			ESITOM = 1'b1;
			ACKINM = 1'b0;
		
		//902 ns
		//La MMU passa l'esito al processore

		#38 #`TAU #3

		//926 ns
		//OP: Flush TLB (Processore -> MMU)
			OP = 2'b10;
			IND = 16'h8000;
			RDYIN = 1'b1;

		//968 ns
		//La MMU manda l'esito al processore
		
		#42 #`TAU #3

		//992 ns
		#8 $finish;
	end

endmodule