module full_adder
	#(
		parameter N = 4
	)
	(
		input wire [N-1:0] a, b,
		input wire ci,
		output wire [N-1:0] sum,
		output wire cout
	);

	wire [N+1:0] sum_aux;
	assign sum_aux = {1'b0, a, ci} + {1'b0, b, 1'b1};
	//assign sum_aux = {1'b0, a, 1'b0} + {1'b0, b, 1'b1}; Toggle to fail
	assign sum = sum_aux[N:1];
	assign cout = sum_aux[N+1];

endmodule