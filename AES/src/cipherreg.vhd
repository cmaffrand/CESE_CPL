----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 31.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: cipherreg - behavioral
-- File: cipherreg.vhd
-- Project Name: AES
-- Target Devices: ZedBoard
-- Tool Versions: 
-- Description: 
--
-- Registro intermedio para la implementacion del algoritmo de Rijndael
-- 
-- Dependencies: 
-- 
-- Additional Comments:
-- Importante:
-- 
----------------------------------------------------------------------------
-- Modification History:
----------------------------------------------------------------------------
-- Date   		By	    Version Change Description
----------------------------------------------------------------------------
-- 31/03/22  	CJM     0.10	Original
----------------------------------------------------------------------------

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

architecture rtl of cipherreg is

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

end architecture rtl;