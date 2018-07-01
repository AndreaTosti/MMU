module MMU(
			DATAOUT, ESITO, ACKOUT, RDYOUTM, RDYOUTC, OPOUTM, OPOUTC, DATAOUTC, INDOUTM, INDOUTC,
			clock, RDYIN, OP, IND, DATAIN, DATAINM, DATAINC, ESITOC, ESITOM, ACKINM, ACKINC
		  );

	parameter N = 32;

	input clock;

	//Ingresso MMU (Da processore P a MMU)
	input RDYIN;
	input [1:0]OP;
	input [N-1:0]IND;
	input [N-1:0]DATAIN;

	//Ingresso MMU (Da memoria M a MMU)
	input [N-1:0]DATAINM;
	input ESITOM;
	input ACKINM;

	//Ingresso MMU (Da memoria C a MMU)
	input [N-1:0]DATAINC;
	input ESITOC;
	input ACKINC;

	//Uscita MMU (Da MMU a P)
	output [N-1:0] DATAOUT;
	output ESITO;
	output ACKOUT;

	//Uscita MMU (Da MMU a M)
	output RDYOUTM;
	output [1:0]OPOUTM;
	output [N-1:0]INDOUTM;

	//Uscita MMU (Da MMU a C)
	output RDYOUTC;
	output [1:0]OPOUTC;
	output [N-1:0]DATAOUTC;
	output [N-1:0]INDOUTC;

	//Input dalla PC alla PO

	wire bIndoutc, bOpoutc, bRdyoutc, bAckinc, bDataoutc, bIndtabril, bEsito, bRdyin;
	wire bAckout, bFlush, bOpoutm, bIndoutm, bRdyoutm, bAckinm, bReg_v, bDataout, bCl, bS;
	wire aKindoutc;
	wire [1:0]aKesito;
	wire aKreg_v;

	//Input dalla PO alla PC

	wire rdyin;
	wire [1:0]op;
	wire esito_ma;
	wire ackinc;
	wire [1:0]opoutc;
	wire esitoc;
	wire ackinm;
	wire [1:0]opoutm;
	wire esitom;

	//Istanziazione di PC e PO
	PC partecontrollo(bIndoutc, bOpoutc, bRdyoutc, bAckinc, bDataoutc, bIndtabril, bEsito, bRdyin, 
					  bAckout, bFlush, bOpoutm, bIndoutm, bRdyoutm, bAckinm, bReg_v, bDataout, bCl, bS,
					  aKindoutc, aKesito, aKreg_v, 
					  clock, rdyin, op, esito_ma, ackinc, opoutc, esitoc, ackinm, opoutm, esitom);
	PO parteoperativa(rdyin, op, esito_ma, ackinc, opoutc, esitoc, ackinm, opoutm, esitom,
					  DATAOUT, ESITO, ACKOUT, RDYOUTM, RDYOUTC, OPOUTM, OPOUTC, DATAOUTC, INDOUTM, INDOUTC,

					  bIndoutc, bOpoutc, bRdyoutc, bAckinc, bDataoutc, bIndtabril, bEsito, bRdyin, 
					  bAckout, bFlush, bOpoutm, bIndoutm, bRdyoutm, bAckinm, bReg_v, bDataout, bCl, bS,
					  aKindoutc, aKesito, aKreg_v,
					  clock,
					  RDYIN, OP, IND, DATAIN, DATAINM, DATAINC, ESITOC, ESITOM, ACKINM, ACKINC);

endmodule