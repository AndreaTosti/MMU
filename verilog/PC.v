module PC(
			bIndoutc, bOpoutc, bRdyoutc, bAckinc, bDataoutc, bIndtabril, bEsito, bRdyin, 
			bAckout, bFlush, bOpoutm, bIndoutm, bRdyoutm, bAckinm, bReg_v, bDataout, bCl, bS,
			aKindoutc, aKesito, aKreg_v, 
			clock, rdyin, op, esito_ma, ackinc, opoutc, esitoc, ackinm, opoutm, esitom
		 );

	output bIndoutc, bOpoutc, bRdyoutc, bAckinc, bDataoutc, bIndtabril, bEsito, bRdyin;
	output bAckout, bFlush, bOpoutm, bIndoutm, bRdyoutm, bAckinm, bReg_v, bDataout, bCl, bS;
	output aKindoutc;
	output [1:0]aKesito;
	output aKreg_v;
	
	input clock;
	input rdyin;
	input [1:0]op;
	input esito_ma;
	input ackinc;
	input [1:0]opoutc;
	input esitoc;
	input ackinm;
	input [1:0]opoutm;
	input esitom;

	wire [1:0]stato;
	wire [1:0]nuovostato;

	//Istanzazione OmegaPC, SigmaPC e registro di stato
	OmegaPC omega_PC(bIndoutc, bOpoutc, bRdyoutc, bAckinc, bDataoutc, bIndtabril, bEsito, bRdyin, 
					 bAckout, bFlush, bOpoutm, bIndoutm, bRdyoutm, bAckinm, bReg_v, bDataout, bCl, bS,
					 aKindoutc, aKesito, aKreg_v, 
					 rdyin, op, esito_ma, ackinc, opoutc, esitoc, ackinm, opoutm, esitom, 
					 stato);
	
	SigmaPC sigma_PC(nuovostato,
					 rdyin, op, esito_ma, ackinc, opoutc, esitoc, ackinm, opoutm, esitom,
					 stato);

	registro #(2) s(stato, clock, 1'b1, nuovostato); 

endmodule

