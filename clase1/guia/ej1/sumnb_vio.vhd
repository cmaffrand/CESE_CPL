library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumnb_vio is
  generic (N : integer := 4);
  port (
    clk : in std_logic;
    a_o : out std_logic_vector(N - 1 downto 0);
    b_o : out std_logic_vector(N - 1 downto 0);
    c_o : out std_logic;
    s_i : in std_logic_vector(N - 1 downto 0);
    ov_i : in std_logic
  );
end sumnb_vio;

architecture rtl of sumnb_vio is

begin

end architecture;