----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 31.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: roundconst - lut
-- File: roundconst.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
--      Rijndael Rcon
--   -- | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | a | b | c | d | e | f |
--   ---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
--   00 | 8D| 01| 02| 04| 08| 10| 20| 40| 80| 1B| 36| 6C| D8| AB| 4D| 9A| 
--   
-- La tabla tiene 256 valores, pero solo se usan como máximo de 14 en el 
-- algoritmo cuando el Key es de 256.
--
-- Utilizacion:
-- Key Length | Rounds  |
-- 256        | 14      |
-- 192        | 12      |
-- 128        | 10      |
--
-- Dependencies: 
-- Additional Comments:
-- https://cryptography.fandom.com/wiki/Rijndael_key_schedule
-- https://en.wikipedia.org/wiki/AES_key_schedule
-- Importante:
-- Se empieza a utilizar desde la posición 1 y no desde la 0.
----------------------------------------------------------------------------
-- Modification History:
----------------------------------------------------------------------------
-- Date   		By	    Version Change Description
----------------------------------------------------------------------------
-- 31/03/22  	CJM     0.10	Original
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity roundconst is
  generic (
    N : positive := 8
  );
  port (
    index_i : in std_logic_vector(N/2 - 1 downto 0);
    const_o : out std_logic_vector(N - 1 downto 0)
  );
end roundconst;

architecture lut of roundconst is

begin

    const_o <= x"8d" when index_i = x"0" else
    x"01" when index_i = x"1" else
    x"02" when index_i = x"2" else
    x"04" when index_i = x"3" else
    x"08" when index_i = x"4" else
    x"10" when index_i = x"5" else
    x"20" when index_i = x"6" else
    x"40" when index_i = x"7" else
    x"80" when index_i = x"8" else
    x"1b" when index_i = x"9" else
    x"36" when index_i = x"a" else
    x"6c" when index_i = x"b" else
    x"d8" when index_i = x"c" else
    x"ab" when index_i = x"d" else
    x"4d" when index_i = x"e" else
    x"9a";

end architecture lut;