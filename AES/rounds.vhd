----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 30.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: rounds - struc / strucinv
-- File: rounds.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
-- Estructura de calculo de las rondas a repetir en el 
-- algoritmo de Rijndael
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

entity rounds is
  generic (
    N : positive := 128
  );
  port (
    data_i : in std_logic_vector(N - 1 downto 0);
    key_i : in std_logic_vector(N - 1 downto 0);
    data_o : out std_logic_vector(N - 1 downto 0)
  );
end rounds;

architecture struc of rounds is

  signal substitutedbytes_s : std_logic_vector(N - 1 downto 0);
  signal shiftedrows_s : std_logic_vector(N - 1 downto 0);
  signal mixedcolumns_s : std_logic_vector(N - 1 downto 0);

begin

  bytesub_inst : entity work.bytesub(luts)
    port map(
      data_i => data_i,
      data_o => substitutedbytes_s);
  shiftrows_inst : entity work.shiftrows(wires)
    port map(
      data_i => substitutedbytes_s,
      data_o => shiftedrows_s);
  mixcolumns_inst : entity work.mixcolumns128(luts)
    port map(
      data_i => shiftedrows_s,
      data_o => mixedcolumns_s);
  addroundkey_inst : entity work.addroundkey
    port map(
      a_i => mixedcolumns_s,
      b_i => key_i,
      o_o => data_o);

end architecture struc;

architecture strucinv of rounds is

  signal shiftedrows_s : std_logic_vector(N - 1 downto 0);
  signal substitutedbytes_s : std_logic_vector(N - 1 downto 0);
  signal roundkeyadded_s : std_logic_vector(N - 1 downto 0);

begin
  shiftrowsinv_inst : entity work.shiftrows(wiresinv)
    port map(
      data_i => data_i,
      data_o => shiftedrows_s);
  bytesubinv_inst : entity work.bytesub(lutsinv)
    port map(
      data_i => shiftedrows_s,
      data_o => substitutedbytes_s);
  addroundkey_inst : entity work.addroundkey
    port map(
      a_i => substitutedbytes_s,
      b_i => key_i,
      o_o => roundkeyadded_s);
  mixcolumnsinv_inst : entity work.mixcolumns128(lutsinv)
    port map(
      data_i => roundkeyadded_s,
      data_o => data_o);

end architecture strucinv;