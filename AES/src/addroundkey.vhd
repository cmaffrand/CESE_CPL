----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 30.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: addroundkey - luts
-- File: addroundkey.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
-- Realiza la suma en el campo de Galois de dos palabras
-- para el algoritmo de Rijndael
-- 
-- Sum = In1 XOR In2
--
-- Operaciones realizadas dentro del campo de Galois GF(2^8)
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

entity addroundkey is
  generic (N : positive := 128);
  port (
    a_i : in std_logic_vector(N - 1 downto 0);
    b_i : in std_logic_vector(N - 1 downto 0);
    o_o : out std_logic_vector(N - 1 downto 0)
  );
end addroundkey;

architecture luts of addroundkey is

begin

  o_o <= a_i xor b_i;

end architecture luts;