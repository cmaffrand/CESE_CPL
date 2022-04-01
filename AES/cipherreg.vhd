library ieee;
use ieee.std_logic_1164.all;

entity cipherreg is
  generic (N : positive := 128);
  port (
    clk_i : in std_logic;
    arst_i : in std_logic;
    ena_i : in std_logic;
    d_i : in std_logic_vector(N - 1 downto 0);
    q_o : out std_logic_vector(N - 1 downto 0)
  );
end cipherreg;

architecture behavioral of cipherreg is

begin
    
    process (clk_i, arst_i)
    begin
        if arst_i = '1' then
            q_o <= (others => '0'); 
        elsif rising_edge(clk_i) then
            if ena_i = '1' then
                q_o <= d_i;
            end if;           
        end if;
    end process;

end architecture behavioral;