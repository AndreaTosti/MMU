module encoder(z1, z2, z3, x1, x2, x3, x4, x5, x6, x7, x8);

	input x1, x2, x3, x4, x5, x6, x7, x8;
	output reg z1, z2, z3;

	always @(x1 or x2 or x3 or x4 or x5 or x6 or x7 or x8)
	begin
		case({x1,x2,x3,x4,x5,x6,x7,x8})
			8'b10000000 : begin #2 {z1, z2, z3} = 3'b000; end
			8'b01000000 : begin #2 {z1, z2, z3} = 3'b001; end
			8'b00100000 : begin #2 {z1, z2, z3} = 3'b010; end
			8'b00010000 : begin #2 {z1, z2, z3} = 3'b011; end
			8'b00001000 : begin #2 {z1, z2, z3} = 3'b100; end
			8'b00000100 : begin #2 {z1, z2, z3} = 3'b101; end
			8'b00000010 : begin #2 {z1, z2, z3} = 3'b110; end
			8'b00000001 : begin #2 {z1, z2, z3} = 3'b111; end
		endcase
	end

endmodule