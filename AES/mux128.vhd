----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 31.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: mux128 - rtl
-- File: mux128.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
-- Multiplexor de 128 bits de ancho para seleccionar el data path dentro
-- del algoritmo de Rijndael
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

entity mux128 is
  generic (N : positive := 128);
  port (
    sel_i : in std_logic;
    a_i : in std_logic_vector(N - 1 downto 0);
    b_i : in std_logic_vector(N - 1 downto 0);
    o_o : out std_logic_vector(N - 1 downto 0)
  );
end mux128;

architecture rtl of mux128 is

begin

  o_o <= a_i when sel_i = '0' else b_i;

end architecture rtl;