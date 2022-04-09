library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_tb is
end pwm_tb;

architecture sim of pwm_tb is

  constant clk_hz : integer := 100e6;
  constant clk_period : time := 1 sec / clk_hz;

  -- Entradas
  signal clk : std_logic := '1';
  signal rst : std_logic := '1';
  signal ena_s : std_logic := '0';
  signal duty_s : std_logic_vector(7 downto 0) := (others => '0');
  signal band_s : std_logic_vector(3 downto 0) := (others => '0');

  -- Salidas
  signal pwm_s : std_logic;
  signal pwm_ns : std_logic;

begin

  clk <= not clk after clk_period / 2;

  DUT : entity work.pwm(rtl)
    port map(
      clk_i => clk,
      rst_i => rst,
      ena_i => ena_s,
      duty_i => duty_s,
      band_i => band_s,
      pwm_o => pwm_s,
      pwm_no => pwm_ns
    );

  SEQUENCER_PROC : process
  begin
    wait for clk_period * 2;
    rst <= '0';
    wait for clk_period * 10;
    duty_s <= x"80";
    band_s <= x"8";
    ena_s <= '1';
    wait for clk_period * 1000;
    ena_s <= '0';
    wait for clk_period * 10;
    duty_s <= x"F0";
    band_s <= x"F";
    ena_s <= '1';
    wait for clk_period * 1000;
    ena_s <= '0';
    wait for clk_period * 10;
    duty_s <= x"40";
    band_s <= x"F";
    ena_s <= '1';
    wait for clk_period * 1000;

    -- Finaliza el test y pasa por todas las combinaciones
    assert false report "Simulation Finished Gracefully" severity failure;

  end process;

end architecture;