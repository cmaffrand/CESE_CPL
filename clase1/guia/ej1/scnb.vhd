library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity scnb is
  generic (N : integer := 4);
  port (
    a_i : in std_logic_vector(N - 1 downto 0);
    b_i : in std_logic_vector(N - 1 downto 0);
    c_i : in std_logic;
    s_o : out std_logic_vector(N - 1 downto 0);
    ov_o : out std_logic
  );
end entity;

architecture rtl of scnb is

  signal aux_s : std_logic_vector(N downto 0) := (others => '0');

begin
  sum_nbits : for i in 0 to N - 1 generate
    DUT : entity work.sum1b
      port map(
        a_i => a_i(i),
        b_i => b_i(i),
        ci_i => aux_s(i),
        s_o => s_o(i),
        co_o => aux_s(i + 1)
      );

  end generate sum_nbits;
  aux_s (0) <= c_i;
  ov_o <= aux_s(N);
end architecture rtl;