----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 30.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: mixcolumns128 - luts
-- File: mixcolumns128.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
-- Mezcla columnas de la palabra completa en algorimo de Rijndael
--
-- Dependencies: 
-- 
-- Additional Comments:
-- https://cryptography.fandom.com/wiki/Rijndael_mix_columns
-- Importante:
--
----------------------------------------------------------------------------
-- Modification History:
----------------------------------------------------------------------------
-- Date   		By	    Version Change Description
----------------------------------------------------------------------------
-- 30/03/22  	CJM     0.10	Original
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mixcolumns128 is
  generic (
    N : positive := 128
  );
  port (
    data_i : in std_logic_vector(N - 1 downto 0);
    data_o : out std_logic_vector(N - 1 downto 0)
  );
end mixcolumns128;

architecture luts of mixcolumns128 is

begin

  gen : for i in 1 to N/32 generate
    mixcolumns32_inst : entity work.mixcolumns32
      port map(
        data_i => data_i(i * 32 - 1 downto (i - 1) * 32),
        data_o => data_o(i * 32 - 1 downto (i - 1) * 32)
      );
  end generate gen;

end architecture luts;