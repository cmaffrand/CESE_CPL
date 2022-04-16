----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 04.04.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: unofoldedkeygen - struc
-- File: unofoldedkeygen.vhd
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
-- 04/04/22  	CJM     0.10	Original
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unfoldedkeygen is
  generic (
    N : positive := 128;
    I : positive := 10
  );
  port (
    key_i : in std_logic_vector(N - 1 downto 0);
    clk_i : in std_logic;
    arst_i : in std_logic;
    ena_i : in std_logic;
    stage_i : in std_logic_vector(3 downto 0);
    key_o : out std_logic_vector(N - 1 downto 0)
  );
end unfoldedkeygen;

architecture struc of unfoldedkeygen is

  signal feedback_s : std_logic_vector((I + 1) * N - 1 downto 0);
  signal registeredkeys_s : std_logic_vector(I * N - 1 downto 0);

begin

  -- Key Expansion
  feedback_s (N - 1 downto 0) <= key_i;

  key_expansion_gen : for j in 1 to I generate
    -- Instancias del bloque combinacional generador de round keys
    keygen_inst : entity work.newkeygen(rtl)
      generic map(N => N)
      port map(
        key_i => feedback_s(N * j - 1 downto N * (j - 1)),
        stage_i => std_logic_vector(to_unsigned(j, 4)),
        key_o => feedback_s(N * (j + 1) - 1 downto N * j)
      );
    -- Registros de keys generadas
    reg_keys_inst : entity work.cipherreg(rtl)
      generic map(N => N)
      port map(
        clk_i => clk_i,
        arst_i => arst_i,
        ena_i => ena_i,
        d_i => feedback_s(N * (j + 1) - 1 downto N * j),
        q_o => registeredkeys_s(N * j - 1 downto N * (j - 1))
      );
  end generate key_expansion_gen;

  -- Asignacion de salida
  key_o <= registeredkeys_s(N * 10 - 1 downto N * 9) when stage_i = x"1" else
    registeredkeys_s(N * 9 - 1 downto N * 8) when stage_i = x"2" else
    registeredkeys_s(N * 8 - 1 downto N * 7) when stage_i = x"3" else
    registeredkeys_s(N * 7 - 1 downto N * 6) when stage_i = x"4" else
    registeredkeys_s(N * 6 - 1 downto N * 5) when stage_i = x"5" else
    registeredkeys_s(N * 5 - 1 downto N * 4) when stage_i = x"6" else
    registeredkeys_s(N * 4 - 1 downto N * 3) when stage_i = x"7" else
    registeredkeys_s(N * 3 - 1 downto N * 2) when stage_i = x"8" else
    registeredkeys_s(N * 2 - 1 downto N * 1) when stage_i = x"9" else
    registeredkeys_s(N * 1 - 1 downto N * 0);

end architecture struc;