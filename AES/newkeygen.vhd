----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 31.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: newkeygen - rtl
-- File: newkeygen.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
-- Generacion de Keys para el algoritmo de Rijndael
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
-- https://www.samiam.org/key-schedule.html
-- https://csrc.nist.gov/csrc/media/publications/fips/197/final/documents/fips-197.pdf
-- Importante:
----------------------------------------------------------------------------
-- Modification History:
----------------------------------------------------------------------------
-- Date   		By	    Version Change Description
----------------------------------------------------------------------------
-- 31/03/22  	CJM     0.10	Original
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity newkeygen is
  generic (
    N : positive := 128
  );
  port (
    key_i : in std_logic_vector(N - 1 downto 0);
    stage_i : in std_logic_vector(3 downto 0);
    key_o : out std_logic_vector(N - 1 downto 0)
  );
end newkeygen;

architecture rtl of newkeygen is

  signal shiftedword_s : std_logic_vector(31 downto 0);
  signal substitutededword_s : std_logic_vector(31 downto 0);
  signal word3, word2, word1, word0 : std_logic_vector(31 downto 0);
  signal const_s : std_logic_vector(7 downto 0);

begin

  -- Shift de bytes
  shiftedword_s <= key_i(23 downto 0) & key_i(31 downto 24);

  -- Substitucion de bytes en word    
  sublut_inst : entity work.bytesub
    generic map(N => 32)
    port map(
      data_i => shiftedword_s,
      data_o => substitutededword_s
    );

  -- Obtencion del RC
  rc_inst : entity work.roundconst
    port map(
      index_i => stage_i,
      const_o => const_s
    );

  -- Calculo de las palabras intermedias
  word0(31 downto 24) <= key_i(127 downto 120) xor substitutededword_s(31 downto 24) xor const_s;
  word0(23 downto 0) <= key_i(119 downto 96) xor substitutededword_s(23 downto 0);
  word1 <= key_i(95 downto 64) xor word0;
  word2 <= key_i(63 downto 32) xor word1;
  word3 <= key_i(31 downto 0) xor word2;

  -- Asignacion de salida
  key_o <= word0 & word1 & word2 & word3;
  --key_o <=  word0(7 downto 0) & word0(15 downto 8) & word0(23 downto 16) & word0(31 downto 24)
  --        & word1(7 downto 0) & word1(15 downto 8) & word1(23 downto 16) & word1(31 downto 24)
  --        & word2(7 downto 0) & word2(15 downto 8) & word2(23 downto 16) & word2(31 downto 24)
  --        & word3(7 downto 0) & word3(15 downto 8) & word3(23 downto 16) & word3(31 downto 24);

end architecture rtl;