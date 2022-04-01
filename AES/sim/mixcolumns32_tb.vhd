library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mixcolumns32_tb is
end mixcolumns32_tb;

architecture sim of mixcolumns32_tb is

  -- Constantes del Test
  constant clk_hz : integer := 100e6;
  constant clk_period : time := 1 sec / clk_hz;
  constant test_period : time := clk_period * 2;
  constant validate_period : time := clk_period / 5; -- menor que el reloj porque es una logica combinacional el sumador
  constant N : integer := 32;

  type data_matrix is array (0 to 6) of std_logic_vector(N - 1 downto 0);

  -- Input Signals
  signal clk : std_logic := '1';
  signal rst : std_logic := '1';
  signal data_i : std_logic_vector(N - 1 downto 0) := (others => '0');

  -- Output Signals  
  signal data_o : std_logic_vector(N - 1 downto 0);

  -- Auxliary Signals
  signal test_inputs : data_matrix := (x"db135345",
  x"f20a225c",
  x"01010101",
  x"c6c6c6c6",
  x"d4d4d4d5",
  x"2d26314c",
  x"09287F47");

  signal test_outputs : data_matrix := (x"8e4da1bc",
  x"9fdc589d",
  x"01010101",
  x"c6c6c6c6",
  x"d5d5d7d6",
  x"4d7ebdf8",
  x"529F16C2");

  signal i : integer := 0;

begin

  -- Reloj (no es necesario en este test)
  clk <= not clk after clk_period / 2;

  -- Device under test
  DUT : entity work.mixcolumns32(luts)
    generic map(
      N => N
    )
    port map(
      data_i => data_i,
      data_o => data_o
    );

  -- Asignación del dato de entrada
  data_i <= test_inputs(i);

  -- Proceso donde se generan todas las secuencias de estimulo para el dut
  SEQUENCER_PROC : process
  begin

    -- Barrer todos los vectores de prueba
    -- i = 0    
    wait for clk_period * 10;
    i <= 1;
    wait for clk_period * 10;
    i <= 2;
    wait for clk_period * 10;
    i <= 3;
    wait for clk_period * 10;
    i <= 4;
    wait for clk_period * 10;
    i <= 5;
    wait for clk_period * 10;
    i <= 6;
    wait for clk_period * 10;

    -- Finaliza el test y pasa por todas las combinaciones
    assert false report "Simulation Finished Gracefully" severity failure;

  end process;

  -- Proceso de validacion funcional
  TEST_PROC : process
    variable result_dut : std_logic_vector(N - 1 downto 0) := (others => '0');
    variable result_test_vector : std_logic_vector(N - 1 downto 0) := (others => '0');
  begin

    -- Loop para que se haga una prueba funcional cada periodo de validacion de la funcionalidad
    test_loop : loop
      wait for validate_period;
      result_dut := data_o;
      result_test_vector := test_outputs(i);

      if (result_dut /= result_test_vector) then
        assert false
        report "Comparacion incorrecta"
          severity failure;
      end if;

    end loop; -- test_loop

  end process;

end architecture;