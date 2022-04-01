library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity newkeygen_tb is
end newkeygen_tb;

architecture sim of newkeygen_tb is

  -- Constantes del Test
  constant clk_hz : integer := 100e6;
  constant clk_period : time := 1 sec / clk_hz;
  constant test_period : time := clk_period * 2;
  constant validate_period : time := clk_period / 4.5; -- menor que el reloj porque es una logica combinacional el sumador
  constant N : integer := 128;

  type data_matrix is array (0 to 4) of std_logic_vector(N - 1 downto 0);

  -- Input Signals
  signal clk : std_logic := '1';
  signal rst : std_logic := '1';
  signal key_i : std_logic_vector(N - 1 downto 0) := (others => '0');
  signal stage_i : std_logic_vector(3 downto 0) := x"1";

  -- Output Signals  
  signal key_o : std_logic_vector(N - 1 downto 0);

  -- Auxliary Signals
  signal test_inputs : data_matrix := (x"00000000000000000000000000000000",
  x"ffffffffffffffffffffffffffffffff",
  x"2b7e151628aed2a6abf7158809cf4f3c",
  x"000102030405060708090a0b0c0d0e0f", --000102030405060708090a0b0c0d0e0f --0f0e0d0c0b0a09080706050403020100
  x"4920e299a520526164696f476174756e");

  signal test_outputs : data_matrix := (x"62636363626363636263636362636363",
  x"e8e9e9e917161616e8e9e9e917161616",
  x"a0fafe1788542cb123a339392a6c7605",
  x"d6aa74fdd2af72fadaa678f1d6ab76fe",
  x"dabd7d767f9d2f171bf440507a80353e");

  signal i : integer := 0;

begin

  -- Reloj (no es necesario en este test)
  clk <= not clk after clk_period / 2;

  -- Device under test
  DUT : entity work.newkeygen(rtl)
    generic map(
      N => N
    )
    port map(
        key_i => key_i,
        stage_i => stage_i,
        key_o => key_o
    );

  -- Asignación del dato de entrada
  key_i <= test_inputs(i);

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
      result_dut := key_o;
      result_test_vector := test_outputs(i);

      if (result_dut /= result_test_vector) then
        assert false
        report "Comparacion incorrecta"
          severity failure;
      end if;

    end loop; -- test_loop

  end process;

end architecture;