module sum1b (
	input wire a, b, ci,
	output wire s, co
	);
	
	assign s = a ^ b ^ ci;
	assign co = (a & b) | (a & ci) | (b & ci);

endmodule
	