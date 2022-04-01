----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 30.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: mixcolumns32 - luts
-- File: mixcolumns32.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
-- Mezcla columnas en un paquete de 4 Bytes para el algorimo de Rijndael
-- 
-- C0 = 2*B0 + 3*B1 + B2 + B3
-- C1 = B0 + 2*B1 + 3*B2 + B3
-- C2 = B0 + B1 + 2*B2 + 3*B3 
-- C3 = 3*B0 + B1 + B2 + 2*B3
--
-- Operaciones realizadas dentro del campo de Galois GF(2^8)
--
-- Inversa de mezcla de columnas en un paquete de 4 Bytes para el algorimo 
-- de Rijndael
-- 
-- C0 = 14*B0 + 11*B1 + 13*B2 + 9*B3
-- C1 = 9*B0 + 14*B1 + 11*B2 + 13*B3
-- C2 = 13*B0 + 9*B1 + 14*B2 + 11*B3 
-- C3 = 11*B0 + 13*B1 + 9*B2 + 14*B3
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

entity mixcolumns32 is
  generic (
    N : positive := 32
  );
  port (
    data_i : in std_logic_vector(N - 1 downto 0);
    data_o : out std_logic_vector(N - 1 downto 0)
  );
end mixcolumns32;

architecture luts of mixcolumns32 is

  signal b0 : std_logic_vector(7 downto 0);
  signal b1 : std_logic_vector(7 downto 0);
  signal b2 : std_logic_vector(7 downto 0);
  signal b3 : std_logic_vector(7 downto 0);
  signal b0x2 : std_logic_vector(7 downto 0);
  signal b1x2 : std_logic_vector(7 downto 0);
  signal b2x2 : std_logic_vector(7 downto 0);
  signal b3x2 : std_logic_vector(7 downto 0);
  signal b0x3 : std_logic_vector(7 downto 0);
  signal b1x3 : std_logic_vector(7 downto 0);
  signal b2x3 : std_logic_vector(7 downto 0);
  signal b3x3 : std_logic_vector(7 downto 0);

begin

  -- Asignacion del vector de entrada
  b3 <= data_i(7 downto 0);
  b2 <= data_i(15 downto 8);
  b1 <= data_i(23 downto 16);
  b0 <= data_i(31 downto 24);

  b0x2_inst : entity work.galoismul2
    port map(
      byte_i => b0,
      byte_o => b0x2
    );

  b1x2_inst : entity work.galoismul2
    port map(
      byte_i => b1,
      byte_o => b1x2
    );

  b2x2_inst : entity work.galoismul2
    port map(
      byte_i => b2,
      byte_o => b2x2
    );

  b3x2_inst : entity work.galoismul2
    port map(
      byte_i => b3,
      byte_o => b3x2
    );

  b0x3_inst : entity work.galoismul3
    port map(
      byte_i => b0,
      byte_o => b0x3
    );

  b1x3_inst : entity work.galoismul3
    port map(
      byte_i => b1,
      byte_o => b1x3
    );

  b2x3_inst : entity work.galoismul3
    port map(
      byte_i => b2,
      byte_o => b2x3
    );

  b3x3_inst : entity work.galoismul3
    port map(
      byte_i => b3,
      byte_o => b3x3
    );

  data_o(31 downto 24) <= b0x2 xor b1x3 xor b2 xor b3; -- C0
  data_o(23 downto 16) <= b0 xor b1x2 xor b2x3 xor b3; -- C1
  data_o(15 downto 8) <= b0 xor b1 xor b2x2 xor b3x3; -- C2
  data_o(7 downto 0) <= b0x3 xor b1 xor b2 xor b3x2; -- C3

end architecture luts;

architecture lutsinv of mixcolumns32 is

  signal b0 : std_logic_vector(7 downto 0);
  signal b1 : std_logic_vector(7 downto 0);
  signal b2 : std_logic_vector(7 downto 0);
  signal b3 : std_logic_vector(7 downto 0);
  signal b0x9 : std_logic_vector(7 downto 0);
  signal b1x9 : std_logic_vector(7 downto 0);
  signal b2x9 : std_logic_vector(7 downto 0);
  signal b3x9 : std_logic_vector(7 downto 0);
  signal b0x11 : std_logic_vector(7 downto 0);
  signal b1x11 : std_logic_vector(7 downto 0);
  signal b2x11 : std_logic_vector(7 downto 0);
  signal b3x11 : std_logic_vector(7 downto 0);
  signal b0x13 : std_logic_vector(7 downto 0);
  signal b1x13 : std_logic_vector(7 downto 0);
  signal b2x13 : std_logic_vector(7 downto 0);
  signal b3x13 : std_logic_vector(7 downto 0);
  signal b0x14 : std_logic_vector(7 downto 0);
  signal b1x14 : std_logic_vector(7 downto 0);
  signal b2x14 : std_logic_vector(7 downto 0);
  signal b3x14 : std_logic_vector(7 downto 0);

begin

  -- Asignacion del vector de entrada
  b3 <= data_i(7 downto 0);
  b2 <= data_i(15 downto 8);
  b1 <= data_i(23 downto 16);
  b0 <= data_i(31 downto 24);

  b0x9_inst : entity work.galoismul9
    port map(
      byte_i => b0,
      byte_o => b0x9
    );

  b1x9_inst : entity work.galoismul9
    port map(
      byte_i => b1,
      byte_o => b1x9
    );

  b2x9_inst : entity work.galoismul9
    port map(
      byte_i => b2,
      byte_o => b2x9
    );

  b3x9_inst : entity work.galoismul9
    port map(
      byte_i => b3,
      byte_o => b3x9
    );

  b0x11_inst : entity work.galoismul11
    port map(
      byte_i => b0,
      byte_o => b0x11
    );

  b1x11_inst : entity work.galoismul11
    port map(
      byte_i => b1,
      byte_o => b1x11
    );

  b2x11_inst : entity work.galoismul11
    port map(
      byte_i => b2,
      byte_o => b2x11
    );

  b3x11_inst : entity work.galoismul11
    port map(
      byte_i => b3,
      byte_o => b3x11
    );

  b0x13_inst : entity work.galoismul13
    port map(
      byte_i => b0,
      byte_o => b0x13
    );

  b1x13_inst : entity work.galoismul13
    port map(
      byte_i => b1,
      byte_o => b1x13
    );

  b2x13_inst : entity work.galoismul13
    port map(
      byte_i => b2,
      byte_o => b2x13
    );

  b3x13_inst : entity work.galoismul13
    port map(
      byte_i => b3,
      byte_o => b3x13
    );

  b0x14_inst : entity work.galoismul14
    port map(
      byte_i => b0,
      byte_o => b0x14
    );

  b1x14_inst : entity work.galoismul14
    port map(
      byte_i => b1,
      byte_o => b1x14
    );

  b2x14_inst : entity work.galoismul14
    port map(
      byte_i => b2,
      byte_o => b2x14
    );

  b3x14_inst : entity work.galoismul14
    port map(
      byte_i => b3,
      byte_o => b3x14
    );

  data_o(31 downto 24) <= b0x14 xor b1x11 xor b2x13 xor b3x9; -- C0
  data_o(23 downto 16) <= b0x9 xor b1x14 xor b2x11 xor b3x13; -- C1
  data_o(15 downto 8) <= b0x13 xor b1x9 xor b2x14 xor b3x11; -- C2
  data_o(7 downto 0) <= b0x11 xor b1x13 xor b2x9 xor b3x14; -- C3

end architecture lutsinv;