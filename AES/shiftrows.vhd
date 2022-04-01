----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 30.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: shiftrows - wires
-- File: shiftrows.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
-- Realiza el rotado de filas del algoritmo de Rijndael
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

entity shiftrows is
  generic (
    N : positive := 128
  );
  port (
    data_i : in std_logic_vector(N - 1 downto 0);
    data_o : out std_logic_vector(N - 1 downto 0)
  );
end shiftrows;

architecture wires of shiftrows is

begin

  -- Shift Left 3 Row
  data_o(103 downto 96) <= data_i(7 downto 0); -- a33
  data_o(71 downto 64) <= data_i(103 downto 96); -- a32
  data_o(39 downto 32) <= data_i(71 downto 64); -- a31
  data_o(7 downto 0) <= data_i(39 downto 32); -- a30
  -- Shift Left 2 Row
  data_o(111 downto 104) <= data_i(47 downto 40); -- a23    
  data_o(79 downto 72) <= data_i(15 downto 8); -- a22  
  data_o(47 downto 40) <= data_i(111 downto 104); -- a21  
  data_o(15 downto 8) <= data_i(79 downto 72); -- a20
  -- Shift Left 1 Row
  data_o(119 downto 112) <= data_i(87 downto 80); -- a13    
  data_o(87 downto 80) <= data_i(55 downto 48); -- a12  
  data_o(55 downto 48) <= data_i(23 downto 16); -- a11  
  data_o(23 downto 16) <= data_i(119 downto 112); -- a10
  -- No Change Row
  data_o(127 downto 120) <= data_i(127 downto 120); -- a03    
  data_o(95 downto 88) <= data_i(95 downto 88); -- a02  
  data_o(63 downto 56) <= data_i(63 downto 56); -- a01  
  data_o(31 downto 24) <= data_i(31 downto 24); -- a00
  
end architecture wires;