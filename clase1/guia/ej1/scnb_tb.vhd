library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity scnb_tb is
end scnb_tb;

architecture sim of scnb_tb is

  -- Constantes del Test
  constant clk_hz : integer := 100e6;
  constant clk_period : time := 1 sec / clk_hz;
  constant test_period : time := clk_period * 2;
  constant validate_period : time := clk_period / 5; -- menor que el reloj porque es una logica combinacional el sumador
  constant N : integer := 8;

  -- Input Signals
  signal clk : std_logic := '1';
  signal rst : std_logic := '1';
  signal c_s : std_logic := '0';
  signal a_s : std_logic_vector(N - 1 downto 0) := (others => '0');
  signal b_s : std_logic_vector(N - 1 downto 0) := (others => '0');

  -- Output Signals
  signal s_s : std_logic_vector(N - 1 downto 0);
  signal ov_s : std_logic;

begin

  -- Reloj (no es necesario en este test)
  clk <= not clk after clk_period / 2;

  -- Device under test
  DUT : entity work.scnb(rtl)
    generic map(
      N => N
    )
    port map(
      a_i => a_s,
      b_i => b_s,
      c_i => c_s,
      s_o => s_s,
      ov_o => ov_s
    );

  -- Proceso donde se generan todas las secuencias de estimulo para el dut
  SEQUENCER_PROC : process
  begin
    wait for clk_period * 2;

    rst <= '0';

    wait for clk_period * 10;

    -- Loop para barrer todas las combinaciones de entrada de los numeros sumados
    test_bc0 : for i in 0 to 2 ** N - 1 loop
      test_ac0 : for j in 0 to 2 ** N - 1 loop
        wait for test_period;
        a_s <= std_logic_vector(to_unsigned(j, N));
      end loop; -- test_a
      wait for test_period;
      b_s <= std_logic_vector(to_unsigned(i, N));
    end loop; -- test_b
    -- Cambia el carry de entrada
    c_s <= '1';
    -- Loop para barrer todas las combinaciones de entrada de los numeros sumados
    test_bc1 : for i in 0 to 2 ** N - 1 loop
      test_ac1 : for j in 0 to 2 ** N - 1 loop
        wait for test_period;
        a_s <= std_logic_vector(to_unsigned(j, N));
      end loop; -- test_a
      wait for test_period;
      b_s <= std_logic_vector(to_unsigned(i, N));
    end loop; -- test_b

    -- Finaliza el test y pasa por todas las combinaciones
    assert false report "Simulation Finished Gracefully" severity failure;

  end process;

  -- Proceso de validacion funcional
  TEST_PROC : process
    variable result_dut : integer;
    variable result_inp : integer;
    variable aux_ov : integer;
  begin

    -- Espera para poder usar las funciones de conversion y que el las cosas no esten sin inicializar
    wait for clk_period * 4;

    -- Loop para que se haga una prueba funcional cada periodo de validacion de la funcionalidad
    test_loop : loop
      if ov_s = '1' then
        aux_ov := 2 ** N;
      else
        aux_ov := 0;
      end if;

      result_dut := to_integer(unsigned(s_s)) + aux_ov;
      if c_s = '1' then
        result_inp := to_integer(unsigned(a_s)) + to_integer(unsigned(b_s)) + 1;
      else
        result_inp := to_integer(unsigned(a_s)) + to_integer(unsigned(b_s));
      end if;

      if (result_dut /= result_inp) then
        assert false
        report "Suma incorrecta DUT: " & integer'image(result_dut) & " Inputs: " & integer'image(result_inp)
          severity failure;
      end if;

      wait for validate_period;
    end loop; -- test_loop

  end process;

end architecture;