module SigmaPC(
				sprimo,
				rdyin, op, esito_ma, ackinc, opoutc, esitoc, ackinm, opoutm, esitom, stato
			  );

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

	output wire [1:0]sprimo;


assign #2 sprimo = (
						(	((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & esito_ma) |
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & esito_ma) |
							(stato[1] & (~stato[0]) & (~ackinm))
  						) ? {1'b1, 1'b0} : 
						(
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & (~op[0]) & (~esito_ma)) |
							((~stato[1]) & (~stato[0]) & rdyin & (~op[1]) & op[0] & (~esito_ma)) |
							((~stato[1]) & stato[0] & (~ackinc)) |
							(stato[1] & (~stato[0]) & (~op[1]) & (~op[0]) & ackinm & (~esitom) & opoutm[1] & opoutm[0]) |
							(stato[1] & (~stato[0]) & (~op[1]) & op[0] & ackinm & opoutm[1] & opoutm[0] & (~esitom))
						) ? {1'b0, 1'b1} : {1'b0, 1'b0}
				   );

endmodule