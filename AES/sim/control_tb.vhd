library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_tb is
end control_tb;

architecture sim of control_tb is

  -- Constantes del Test
  constant clk_hz : integer := 100e6;
  constant clk_period : time := 1 sec / clk_hz;
  constant test_period : time := clk_period * 2;
  constant validate_period : time := clk_period / 5; -- menor que el reloj porque es una logica combinacional el sumador
  constant N : integer := 32;

  type data_matrix is array (0 to 5) of std_logic_vector(N - 1 downto 0);

  -- Input Signals
  signal clk : std_logic := '1';
  signal rst : std_logic := '1';
  signal ready_i : std_logic := '0';

  -- Output Signals 
  signal run_o : std_logic; 
  signal first_o : std_logic; 
  signal last_o : std_logic; 
  signal valid_o : std_logic; 
  signal index_o : std_logic_vector(3 downto 0);

  -- Auxliary Signals

begin

  -- Reloj (no es necesario en este test)
  clk <= not clk after clk_period / 2;

  -- Device under test
  DUT : entity work.control(rtl)
    port map(
        clk_i => clk,
        arst_i => rst,
        ready_i => ready_i,
        run_o => run_o,
        first_o  => first_o,
        last_o  => last_o,
        valid_o  => valid_o,
        index_o  => index_o
      );

  -- Asignación del dato de entrada

  -- Proceso donde se generan todas las secuencias de estimulo para el dut
  SEQUENCER_PROC : process
  begin

    -- Barrer todos los vectores de prueba
    -- i = 0    
    wait for clk_period * 10;
    rst <= '0';
    wait for clk_period * 10;
    ready_i <= '1';
    wait for clk_period * 100;
    ready_i <= '0';
    wait for clk_period * 10;
    ready_i <= '1';
    wait for clk_period * 100;

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
      --result_dut := data_o;
      --result_test_vector := test_outputs(i);
--
      --if (result_dut /= result_test_vector) then
      --  assert false
      --  report "Comparacion incorrecta"
      --    severity failure;
      --end if;

    end loop; -- test_loop

  end process;

end architecture;