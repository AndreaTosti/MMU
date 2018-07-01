module PO(
			rdyin, op, esito_ma, ackinc, opoutc, esitoc, ackinm, opoutm, esitom, //uscite verso la PC
			DATAOUT, ESITO, ACKOUT, RDYOUTM, RDYOUTC, opoutm, opoutc, DATAOUTC, INDOUTM, INDOUTC, //uscite dai registri d'interfaccia

			bIndoutc, bOpoutc, bRdyoutc, bAckinc, bDataoutc, bIndtabril, bEsito, bRdyin, //Ingressi dalla PC
			bAckout, bFlush, bOpoutm, bIndoutm, bRdyoutm, bAckinm, bReg_v, bDataout, bCl, bS, //Ingressi dalla PC
			aKindoutc, aKesito, aKreg_v, //Ingressi dalla PC
			clock,
			RDYIN, OP, IND, DATAIN, DATAINM, DATAINC, ESITOC, ESITOM, ACKINM, ACKINC //Ingressi verso i registri d'interfaccia
		 );
		
	parameter N = 32;

	output rdyin;
	output [1:0]op;
	output esito_ma;
	output ackinc;
	output [1:0]opoutc;
	output esitoc;
	output ackinm;
	output [1:0]opoutm;
	output esitom;

	output [N-1:0] DATAOUT;
	output ESITO;
	output ACKOUT;
	output RDYOUTM;
	output RDYOUTC;
	output [1:0]OPOUTC;
	output [N-1:0]DATAOUTC;
	output [N-1:0]INDOUTM;
	output [N-1:0]INDOUTC;

	input bIndoutc, bOpoutc, bRdyoutc, bAckinc, bDataoutc, bIndtabril, bEsito, bRdyin;
	input bAckout, bFlush, bOpoutm, bIndoutm, bRdyoutm, bAckinm, bReg_v, bDataout, bCl, bS;
	input aKindoutc;
	input [1:0]aKesito;
	input aKreg_v;
	input clock;

	input RDYIN;
	input [1:0]OP;
	input [N-1:0]IND;
	input [N-1:0]DATAIN;
	input [N-1:0]DATAINM;
	input [N-1:0]DATAINC;
	input ESITOC;
	input ESITOM;
	input ACKINM;
	input ACKINC;

	reg const0;
	reg const1;
	reg [1:0]const11;

	initial 
	begin 
		const0 = 0;
		const1 = 1;
		const11[1] = 1; //bit piu' significativo
		const11[0] = 1; //bit meno significativo
	end

	//module(output rdyackin, input linea_rdyackin, input beta, input clock);

	rdyack_in R_RDYIN(rdyin, RDYIN, bRdyin, clock); //variabile di condizionamento verso la PC
	rdyack_in R_ACKINM(ackinm, ACKINM, bAckinm, clock); //variabile di condizionamento verso la PC
	rdyack_in R_ACKINC(ackinc, ACKINC, bAckinc, clock); //variabile di condizionamento verso la PC

	//module rdyack_out(output rdyackout, input beta, input clock);

	rdyack_out R_ACKOUT(ACKOUT, bAckout, clock);
	rdyack_out R_RDYOUTM(RDYOUTM, bRdyoutm, clock);
	rdyack_out R_RDYOUTC(RDYOUTC, bRdyoutc, clock);

	wire [N-1:0] r_ind;
	wire [N-1:0] r_datain;
	wire [N-1:0] r_datainm;
	wire [N-1:0] r_datainc;
	wire k_esito;
	wire [N-1:0]k_indoutc;
	wire [N-1:0]alu_somma;
	wire [N-1:0]r_indtabril;
	wire r_reg_v_ma;
	wire k_reg_v;
	wire [2:0]c_mod8;
	wire s_1, s_2, s_3, s_4, s_5, s_6, s_7, s_8;
	wire or_s1_flush, or_s2_flush, or_s3_flush, or_s4_flush;
	wire or_s5_flush, or_s6_flush, or_s7_flush, or_s8_flush;

	wire r_linea1_v, r_linea2_v, r_linea3_v, r_linea4_v;
	wire r_linea5_v, r_linea6_v, r_linea7_v, r_linea8_v;
	wire [19:0] r_linea1_ipl, r_linea2_ipl, r_linea3_ipl, r_linea4_ipl;
	wire [19:0] r_linea5_ipl, r_linea6_ipl, r_linea7_ipl, r_linea8_ipl;
	wire [19:0] r_linea1_ipf, r_linea2_ipf, r_linea3_ipf, r_linea4_ipf;
	wire [19:0] r_linea5_ipf, r_linea6_ipf, r_linea7_ipf, r_linea8_ipf;

	wire c_linea1_ipl, c_linea2_ipl, c_linea3_ipl, c_linea4_ipl;
	wire c_linea5_ipl, c_linea6_ipl, c_linea7_ipl, c_linea8_ipl;

	wire and_v1_nc1, and_v2_nc2, and_v3_nc3, and_v4_nc4;
	wire and_v5_nc5, and_v6_nc6, and_v7_nc7, and_v8_nc8;

	wire e_enc1, e_enc2, e_enc3;

	wire [19:0]k_ma; //20 bit di IPF

	registro #(2) R_OP(op, clock, 1'b1, OP);
	registro #(N) R_IND(r_ind, clock, 1'b1, IND);
	registro #(N) R_DATAIN(r_datain, clock, 1'b1, DATAIN);
	registro #(N) R_DATAINM(r_datainm, clock, 1'b1, DATAINM);
	registro #(N) R_DATAINC(r_datainc, clock, 1'b1, DATAINC);
	registro #(1) R_ESITOC(esitoc, clock, 1'b1, ESITOC);
	registro #(1) R_ESITOM(esitom, clock, 1'b1, ESITOM);

	//Registri di uscita
	registro #(N) R_DATAOUT(DATAOUT, clock, bDataout, r_datainc);
	registro #(1) R_ESITO(ESITO, clock, bEsito, k_esito);
	registro #(2) R_OPOUTM(opoutm, clock, bOpoutm, const11);
	registro #(2) R_OPOUTC(opoutc, clock, bOpoutc, OP);
	registro #(N) R_DATAOUTC(DATAOUTC, clock, bDataoutc, r_datain);
	registro #(N) R_INDOUTM(INDOUTM, clock, bIndoutm, alu_somma);
	registro #(N) R_INDOUTC(INDOUTC, clock, bIndoutc, k_indoutc);
	registro #(N) R_INDTABRIL(r_indtabril, clock, bIndtabril, r_ind);
	registro #(1) R_REG_V_MA(r_reg_v_ma, clock, bReg_v, k_reg_v);

	commutatore_3vie_nbit #(1) K_ESITO(k_esito, const0, esitoc, esitom, aKesito);
	commutatore_2vie_nbit #(N) K_INDOUTC(k_indoutc, {k_ma, r_ind[11:0]}, {r_datainm[19:0], r_ind[11:0]}, aKindoutc);
	commutatore_2vie_nbit #(1) K_REG_V(k_reg_v, const0, const1, aKreg_v);

	alu_somma #(N) ALU_SOMMA(alu_somma, r_indtabril, {12'b000000000000, r_ind[31:12]});
	contatore_mod8 CONT_MOD8(c_mod8, clock, bCl);
	selezionatore_8vie_nbit #(1) S_MA(s_1, s_2, s_3, s_4, s_5, s_6, s_7, s_8, bS, c_mod8);

	or_tp OR_S1_FLUSH(or_s1_flush, s_1, bFlush);
	or_tp OR_S2_FLUSH(or_s2_flush, s_2, bFlush);
	or_tp OR_S3_FLUSH(or_s3_flush, s_3, bFlush);
	or_tp OR_S4_FLUSH(or_s4_flush, s_4, bFlush);
	or_tp OR_S5_FLUSH(or_s5_flush, s_5, bFlush);
	or_tp OR_S6_FLUSH(or_s6_flush, s_6, bFlush);
	or_tp OR_S7_FLUSH(or_s7_flush, s_7, bFlush);
	or_tp OR_S8_FLUSH(or_s8_flush, s_8, bFlush);

	//Registri per i bit di validita' di ciascuna linea di TLB
	registro #(1) R_V_LINEA_TLB1(r_linea1_v, clock, or_s1_flush, r_reg_v_ma);
	registro #(1) R_V_LINEA_TLB2(r_linea2_v, clock, or_s2_flush, r_reg_v_ma);
	registro #(1) R_V_LINEA_TLB3(r_linea3_v, clock, or_s3_flush, r_reg_v_ma);
	registro #(1) R_V_LINEA_TLB4(r_linea4_v, clock, or_s4_flush, r_reg_v_ma);
	registro #(1) R_V_LINEA_TLB5(r_linea5_v, clock, or_s5_flush, r_reg_v_ma);
	registro #(1) R_V_LINEA_TLB6(r_linea6_v, clock, or_s6_flush, r_reg_v_ma);
	registro #(1) R_V_LINEA_TLB7(r_linea7_v, clock, or_s7_flush, r_reg_v_ma);
	registro #(1) R_V_LINEA_TLB8(r_linea8_v, clock, or_s8_flush, r_reg_v_ma);	

	//Registri per chiavi e valori di ciascuna linea di TLB
	registro #(40) R_LINEA_TLB_1({r_linea1_ipl, r_linea1_ipf}, 
								  clock, s_1, {r_ind[31:12], r_datainm[19:0]} );
	registro #(40) R_LINEA_TLB_2({r_linea2_ipl, r_linea2_ipf},
				                  clock, s_2, {r_ind[31:12], r_datainm[19:0]} );
	registro #(40) R_LINEA_TLB_3({r_linea3_ipl, r_linea3_ipf},
				                  clock, s_3, {r_ind[31:12], r_datainm[19:0]} );
	registro #(40) R_LINEA_TLB_4({r_linea4_ipl, r_linea4_ipf},
				                  clock, s_4, {r_ind[31:12], r_datainm[19:0]} );
	registro #(40) R_LINEA_TLB_5({r_linea5_ipl, r_linea5_ipf},
				                  clock, s_5, {r_ind[31:12], r_datainm[19:0]} );
	registro #(40) R_LINEA_TLB_6({r_linea6_ipl, r_linea6_ipf},
				                  clock, s_6, {r_ind[31:12], r_datainm[19:0]} );
	registro #(40) R_LINEA_TLB_7({r_linea7_ipl, r_linea7_ipf},
				                  clock, s_7, {r_ind[31:12], r_datainm[19:0]} );
	registro #(40) R_LINEA_TLB_8({r_linea8_ipl, r_linea8_ipf},
				                  clock, s_8, {r_ind[31:12], r_datainm[19:0]} );

	confrontatore_nbit #(20) CONFR_L1_IPL(c_linea1_ipl, r_linea1_ipl, r_ind[31:12]);
	confrontatore_nbit #(20) CONFR_L2_IPL(c_linea2_ipl, r_linea2_ipl, r_ind[31:12]);
	confrontatore_nbit #(20) CONFR_L3_IPL(c_linea3_ipl, r_linea3_ipl, r_ind[31:12]);
	confrontatore_nbit #(20) CONFR_L4_IPL(c_linea4_ipl, r_linea4_ipl, r_ind[31:12]);
	confrontatore_nbit #(20) CONFR_L5_IPL(c_linea5_ipl, r_linea5_ipl, r_ind[31:12]);
	confrontatore_nbit #(20) CONFR_L6_IPL(c_linea6_ipl, r_linea6_ipl, r_ind[31:12]);
	confrontatore_nbit #(20) CONFR_L7_IPL(c_linea7_ipl, r_linea7_ipl, r_ind[31:12]);
	confrontatore_nbit #(20) CONFR_L8_IPL(c_linea8_ipl, r_linea8_ipl, r_ind[31:12]);

	and_tp AND_V1_NOTC1(and_v1_nc1, r_linea1_v, (~c_linea1_ipl));
	and_tp AND_V2_NOTC2(and_v2_nc2, r_linea2_v, (~c_linea2_ipl));
	and_tp AND_V3_NOTC3(and_v3_nc3, r_linea3_v, (~c_linea3_ipl));
	and_tp AND_V4_NOTC4(and_v4_nc4, r_linea4_v, (~c_linea4_ipl));
	and_tp AND_V5_NOTC5(and_v5_nc5, r_linea5_v, (~c_linea5_ipl));
	and_tp AND_V6_NOTC6(and_v6_nc6, r_linea6_v, (~c_linea6_ipl));
	and_tp AND_V7_NOTC7(and_v7_nc7, r_linea7_v, (~c_linea7_ipl));
	and_tp AND_V8_NOTC8(and_v8_nc8, r_linea8_v, (~c_linea8_ipl));

	or_tp_8vie_neg ESITO_MA(esito_ma, and_v1_nc1, and_v2_nc2, and_v3_nc3, and_v4_nc4,
								   and_v5_nc5, and_v6_nc6, and_v7_nc7, and_v8_nc8);

	//ENCODER(z1, z2, z3, ...) dove z1 e' il bit piu' significativo.
	encoder ENCODER(e_enc1, e_enc2, e_enc3, and_v1_nc1, and_v2_nc2, and_v3_nc3, and_v4_nc4,
							    and_v5_nc5, and_v6_nc6, and_v7_nc7, and_v8_nc8);

	commutatore_8vie_nbit #(20) K_MA(k_ma, r_linea1_ipf, r_linea2_ipf, r_linea3_ipf, r_linea4_ipf,
								  r_linea5_ipf, r_linea6_ipf, r_linea7_ipf, r_linea8_ipf,
								  	{e_enc1, e_enc2, e_enc3});

endmodule