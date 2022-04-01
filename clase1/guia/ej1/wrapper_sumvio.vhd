library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wrapper_sumvio is
  port (
    GCLK : in std_logic
  );
end wrapper_sumvio;

architecture rtl of wrapper_sumvio is

  constant N : integer := 4;
  
  COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_in1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

  signal a : std_logic_vector(N - 1 downto 0);
  signal b : std_logic_vector(N - 1 downto 0);
  signal s : std_logic_vector(N - 1 downto 0);
  signal ci : std_logic_vector(0 downto 0);
  signal co : std_logic_vector(0 downto 0);

begin

  DUT : entity work.scnb
    generic map(
      N => N
    )
    port map(
      a_i => a,
      b_i => b,
      c_i => ci(0),
      s_o => s,
      ov_o => co(0)
    );

  VIO : vio_0
    PORT MAP (
    clk => GCLK,
    probe_in0 => s,
    probe_in1 => co,
    probe_out0 => a,
    probe_out1 => b,
    probe_out2 => ci
  );

end architecture;