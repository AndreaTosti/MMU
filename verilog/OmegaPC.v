module OmegaPC(
			    bIndoutc, bOpoutc, bRdyoutc, bAckinc, bDataoutc, bIndtabril, bEsito, bRdyin, 
				bAckout, bFlush, bOpoutm, bIndoutm, bRdyoutm, bAckinm, bReg_v, bDataout, bCl, bS,
				aKindoutc, aKesito, aKreg_v, 
				rdyin, op, esito_ma, ackinc, opoutc, esitoc, ackinm, opoutm, esitom, 
				stato
			  );

output bIndoutc, bOpoutc, bRdyoutc, bAckinc, bDataoutc, bIndtabril, bEsito, bRdyin;
output bAckout, bFlush, bOpoutm, bIndoutm, bRdyoutm, bAckinm, bReg_v, bDataout, bCl, bS;
output aKindoutc;
output [1:0]aKesito;
output aKreg_v;

input [1:0]stato;
input rdyin;
input [1:0]op;
input esito_ma;
input ackinc;
input [1:0]opoutc;
input esitoc;
input ackinm;
input [1:0]opoutm;
input esitom;

	assign #2 bIndoutc = (
						   	((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & (~esito_ma)) ? 1 :
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & (~esito_ma)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & (~op[0]) & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & op[0] & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 : 0
						 );

	assign #2 bOpoutc = (
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & (~esito_ma)) ? 1 :
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & (~esito_ma)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & (~op[0]) & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & op[0] & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 : 0
						);

	assign #2 bRdyoutc = (
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & (~esito_ma)) ? 1 :
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & (~esito_ma)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & (~op[0]) & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & op[0] & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 : 0
						 );

	assign #2 bAckinc = (
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & (~esito_ma)) ? 1 :
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & (~esito_ma)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & (~op[0]) & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & op[0] & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 : 0
						);

	assign #2 bDataoutc = (
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & (~esito_ma)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & op[0] & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 : 0
						  );
	
	assign #2 bIndtabril = (
								((~stato[1]) & (~stato[0]) & rdyin & op[1] & (~op[0])) ? 1 : 0
						   );

	assign #2 bEsito = (
							((~stato[1]) & (~stato[0]) & rdyin & op[1] & (~op[0])) ? 1 :
							((~stato[1]) & stato[0] & ackinc & (~opoutc[1]) & (~opoutc[0]) & (~esitoc)) ? 1 :
							((~stato[1]) & stato[0] & ackinc & (~opoutc[1]) & opoutc[0] & (~esitoc)) ? 1 :
							((~stato[1]) & stato[0] & ackinc & esitoc) ? 1 :
							(stato[1] & (~stato[0]) & ackinm & esitom) ? 1 : 0
					   );

	assign #2 bRdyin = (
							((~stato[1]) & (~stato[0]) & rdyin & op[1] & (~op[0])) ? 1 :
							((~stato[1]) & stato[0] & ackinc & (~opoutc[1]) & (~opoutc[0]) & (~esitoc)) ? 1 :
							((~stato[1]) & stato[0] & ackinc & (~opoutc[1]) & opoutc[0] & (~esitoc)) ? 1 :
							((~stato[1]) & stato[0] & ackinc & esitoc) ? 1 :
							(stato[1] & (~stato[0]) & ackinm & esitom) ? 1 : 0
					   );

	assign #2 bAckout = (
							((~stato[1]) & (~stato[0]) & rdyin & op[1] & (~op[0])) ? 1 :
							((~stato[1]) & stato[0] & ackinc & (~opoutc[1]) & (~opoutc[0]) & (~esitoc)) ? 1 :
							((~stato[1]) & stato[0] & ackinc & (~opoutc[1]) & opoutc[0] & (~esitoc)) ? 1 :
							((~stato[1]) & stato[0] & ackinc & esitoc) ? 1 :
							(stato[1] & (~stato[0]) & ackinm & esitom) ? 1 : 0
						);

	assign #2 bFlush = (
							((~stato[1]) & (~stato[0]) & rdyin & op[1] & (~op[0])) ? 1 : 0
					   );

	assign #2 bOpoutm = (
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & esito_ma) ? 1 :
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & esito_ma) ? 1 : 0
						);	

	assign #2 bIndoutm = (
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & esito_ma) ? 1 :
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & esito_ma) ? 1 : 0
						 );

	assign #2 bRdyoutm = (
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & esito_ma) ? 1 :
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & esito_ma) ? 1 : 0							
						 );

	assign #2 bAckinm = (
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & esito_ma) ? 1 :
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & esito_ma) ? 1 : 0	
						);

	assign #2 bReg_v = (
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & esito_ma) ? 1 :
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & esito_ma) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & (~op[0]) & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & op[0] & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 :
							(stato[1] & (~stato[0]) & ackinm & esitom) ? 1 : 0
					   );

	assign #2 bDataout = (
							((~stato[1]) & stato[0] & ackinc & (~opoutc[1]) & (~opoutc[0]) & (~esitoc)) ? 1 : 0
						 );

	assign #2 bCl = (
						(stato[1] & (~stato[0]) & (~op[1]) & (~op[0]) & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 :
						(stato[1] & (~stato[0]) & (~op[1]) & op[0] & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 : 0
					);

	assign #2 bS = (
						(stato[1] & (~stato[0]) & (~op[1]) & (~op[0]) & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 :
						(stato[1] & (~stato[0]) & (~op[1]) & op[0] & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 : 0
				   );

	assign #2 aKindoutc = (
							(stato[1] & (~stato[0]) & (~op[1]) & (~op[0]) & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 :
							(stato[1] & (~stato[0]) & (~op[1]) & op[0] & ackinm & opoutm[1] & opoutm[0] & (~esitom)) ? 1 : 0							
						  );

	assign #2 aKesito = (
							(stato[1] & (~stato[0]) & ackinm & esitom) ? {1'b1, 1'b0} : 
							((~stato[1]) & stato[0] & ackinc & esitoc) ? {1'b0, 1'b1} : 
							{1'b0, 1'b0}
					    );

	assign #2 aKreg_v = (
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & esito_ma) ? 1 :
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & esito_ma) ? 1 : 0							
						);

endmodule