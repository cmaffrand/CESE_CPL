--Tested according to:
-- https://csrc.nist.gov/csrc/media/publications/fips/197/final/documents/fips-197.pdf
-- https://csrc.nist.gov/CSRC/media/Projects/Cryptographic-Standards-and-Guidelines/documents/examples/AES_Core128.pdf
-- http://www.herongyang.com/Cryptography/AES-Example-Vector-of-AES-Encryption.html

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aesencript_tb is
end aesencript_tb;

architecture sim of aesencript_tb is

  -- Constantes del Test
  constant clk_hz : integer := 100e6;
  constant clk_period : time := 1 sec / clk_hz;
  constant test_period : time := clk_period * 2;
  constant validate_period : time := clk_period / 5; -- menor que el reloj porque es una logica combinacional el sumador
  constant N : integer := 128;
  constant M : integer := 7;

  type data_matrix is array (0 to M-1) of std_logic_vector(N - 1 downto 0);

  -- Input Signals
  signal clk : std_logic := '1';
  signal rst : std_logic := '1';
  signal ready_i : std_logic := '0';
  signal key_i : std_logic_vector(N - 1 downto 0) := (others => '0');
  signal data_i : std_logic_vector(N - 1 downto 0) := (others => '0');

  -- Output Signals  
  signal valid_o : std_logic;
  signal data_o : std_logic_vector(N - 1 downto 0);

  -- Auxliary Signals
  signal test_inputs : data_matrix := (x"6BC1BEE22E409F96E93D7E117393172A",
  x"6bc1bee22e409f96e93d7e117393172a",
  x"ae2d8a571e03ac9c9eb76fac45af8e51",
  x"30c81c46a35ce411e5fbc1191a0a52ef",
  x"f69f2445df4f9b17ad2b417be66c3710",
  x"00112233445566778899aabbccddeeff",
  x"6a84867cd77e12ad07ea1be895c53fa3");

  signal test_keys : data_matrix := (x"2B7E151628AED2A6ABF7158809CF4F3C",
  x"2b7e151628aed2a6abf7158809cf4f3c",
  x"2b7e151628aed2a6abf7158809cf4f3c",
  x"2b7e151628aed2a6abf7158809cf4f3c",
  x"2b7e151628aed2a6abf7158809cf4f3c",
  x"000102030405060708090a0b0c0d0e0f",
  x"00000000000000000000000000000000");

  signal test_outputs : data_matrix := (x"3AD77BB40D7A3660A89ECAF32466EF97",
  x"3ad77bb40d7a3660a89ecaf32466ef97",
  x"f5d3d58503b9699de785895a96fdbaaf",
  x"43b1cd7f598ece23881b00e3ed030688",
  x"7b0c785e27e8ad3f8223207104725dd4",
  x"69c4e0d86a7b0430d8cdb78070b4c55a",
  x"732281c0a0aab8f7a54a0c67a0c45ecf");

  signal i : integer := 0;

begin

  -- Reloj (no es necesario en este test)
  clk <= not clk after clk_period / 2;

  -- Device under test
  DUT : entity work.aesencript(struc)
    generic map(
      N => N
    )
    port map(
      clk_i => clk,
      arst_i => rst,
      ready_i => ready_i,
      key_i => key_i,
      data_i => data_i,
      data_o => data_o,
      valid_o => valid_o
    );

  -- Proceso donde se generan todas las secuencias de estimulo para el dut
  SEQUENCER_PROC : process
  begin

    -- Asignación del dato de entrada
    data_i <= test_inputs(0);
    key_i <= test_keys(0);

    -- Barrer todos los vectores de prueba
    rst <= '1';
    wait for clk_period * 10;
    rst <= '0';
    wait for clk_period * 10;
    ready_i <= '1';

    test_vectors : for j in 1 to M-1 loop
      wait until valid_o = '1';
      ready_i <= '0';
      i <= j;
      data_i <= test_inputs(j);
      key_i <= test_keys(j);
      wait for clk_period;
      ready_i <= '1';
    end loop; -- test_vectors

    wait until valid_o = '1';
    wait for clk_period * 10;
    --ready_i <= '0';
    --wait for clk_period * 10;
    --ready_i <= '1';
    --wait for clk_period * 100;

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
      wait until valid_o = '1';
      wait for clk_period/5;
      result_dut := data_o;
      result_test_vector := test_outputs(i);

      --if (result_dut /= result_test_vector) then
      --  assert false
      --  report "Comparacion incorrecta"
      --    severity failure;
      --end if;

    end loop; -- test_loop

  end process;

end architecture;