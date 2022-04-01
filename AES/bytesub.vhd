----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 30.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: bytesub - luts
-- File: bytesub.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
-- Instanciación de 16 luts de transformacion de Rijndael
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
-- 30/03/22  	CJM     0.10	Original
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity bytesub is
  generic (N : positive := 128);
  port (
    data_i : in std_logic_vector(N - 1 downto 0);
    data_o : out std_logic_vector(N - 1 downto 0)
  );
end bytesub;

architecture luts of bytesub is

begin
  gen : for i in 1 to N/8 generate
    sublut_inst : entity work.sublut
      port map(
        byte_i => data_i(i * 8 - 1 downto (i - 1) * 8),
        byte_o => data_o(i * 8 - 1 downto (i - 1) * 8)
      );
  end generate gen;

end architecture luts;