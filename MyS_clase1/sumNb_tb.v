module full_adder_tb;
  localparam N = 3;
  integer i = 0;
  integer j = 0;
  integer sum_in;
  integer sum_out;

  // declaración de las señales de prueba
  reg [N-1:0] a, b;
  reg ci;
  wire [N-1:0] sum;
  wire co;

  // instancia del DUT
  full_adder
    #(
      .N(N)
    )
    DUT
    (
      .a(a),
      .b(b),
      .ci(ci),
      .sum(sum),
      .cout(co)
    );

  // creación de las señales de prueba

  initial
  begin
    ci = 0;
    for (i = 0; i < 2**N; i=i+1)
    begin
      a = i;
      for (j = 0; j < 2**N; j=j+1)
      begin
        b = j;
        #10;
      end
      j = 0;
    end
    i = 0;
    ci = 1;
    for (i = 0; i < 2**N; i=i+1)
    begin
      a = i;
      for (j = 0; j < 2**N; j=j+1)
      begin
        b = j;
        #10;
      end
      j = 0;
    end
    $display("Simulation end Gracefully: a and b were iterated from 0 to %d, and ci was tested in cero and one", 2**N-1);
    $finish;
  end

  always @(a,b,ci)
  begin
    #1;
    sum_in = a + b + ci;
    sum_out = sum + co * 2**N;
    if (sum_in != sum_out)
    begin
      $display("ERROR: (a = %d + b = %d + c = %d) -> (sumin = %d != sumout = %d)", a, b, ci, sum_in, sum_out);
      $finish;
    end
  end
endmodule
