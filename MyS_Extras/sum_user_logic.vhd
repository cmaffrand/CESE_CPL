-----------------------------------------------------------------
-- Module Name: lab3_user_logic
-----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sum_user_logic is
	port(
		clk_i: in std_logic;
		opA_i: in std_logic_vector(31 downto 0);
		opB_i: in std_logic_vector(31 downto 0);
		res_o: out std_logic_vector(31 downto 0)
	);
end;

architecture sum_user_logic_arq of sum_user_logic is
begin

	process(clk_i)
	begin
		if rising_edge(clk_i) then
			res_o <= std_logic_vector(unsigned(opA_i) + unsigned(opB_i));
		end if;
	end process;

end;
