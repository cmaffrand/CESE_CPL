/*******************************************************************
 *  Archivo: sum1b_tb.v                                            *
 *  Proposito: Testbench para el sumador de 1 bit                  *
 *                                                                 *														
 *******************************************************************/

`timescale 1 ns / 100 ps

module sum1b_tb;
	
	// Senales de entrada al DUT
	reg a_tb, b_tb, ci_tb;
	wire s_tb, co_tb;
	
	initial
	begin
		$display($time, " << Starting the Simulation >>");
		a_tb = 1'b0;
		b_tb = 1'b0;
		ci_tb = 1'b0;
	end

	// Generacion de las senales de prueba
	always #10 a_tb = ~a_tb; // invertir cada 10 ns
	always #20 b_tb = ~b_tb; // invertir cada 20 ns
	always #40 ci_tb = ~ci_tb; // invertir cada 40 ns
	
	// Instanciacion del componente a probar
	sum1b DUT(.a(a_tb), .b(b_tb), .ci(ci_tb), .s(s_tb), .co(co_tb));

endmodule

