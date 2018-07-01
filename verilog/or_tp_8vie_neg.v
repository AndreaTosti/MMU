module or_tp_8vie_neg(output z, input x1, input x2, input x3, input x4,
							 input x5, input x6, input x7, input x8);

	assign #1 z = ~(x1 | x2 | x3 | x4 | x5 | x6 | x7 | x8);

endmodule