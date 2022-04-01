----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 31.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: control - rtl
-- File: control.vhd
-- Project Name: AES
-- Target Devices: ZedBoard
-- Tool Versions: 
-- Description: 
--
-- Implementacion de señales de control para la ejecución del algoritmo
-- de Rijndael.
-- 
-- Dependencies: 
-- 
-- Additional Comments:
-- Importante:
-- Podria realizarse una FSM en este diseño.
----------------------------------------------------------------------------
-- Modification History:
----------------------------------------------------------------------------
-- Date   		By	    Version Change Description
----------------------------------------------------------------------------
-- 31/03/22  	CJM     0.10	Original
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity control is
  port (
    clk_i : in std_logic;
    arst_i : in std_logic;
    ready_i : in std_logic;
    first_o : out std_logic;
    prelast_o : out std_logic;
    last_o : out std_logic;
    valid_o : out std_logic;
    index_o : out std_logic_vector(3 downto 0)
  );
end control;

architecture rtl of control is

begin

  process (clk_i, arst_i)
    variable count : integer := 1;
  begin
    if arst_i = '1' then
      prelast_o <= '0';
      first_o <= '1';
      last_o <= '0';
      valid_o <= '0';
      index_o <= x"1";
      count := 1;
    elsif rising_edge(clk_i) then
      if ready_i = '0' then
        first_o <= '1';
        prelast_o <= '0';
        last_o <= '0';
        valid_o <= '0';
        index_o <= x"1";
        count := 1;
      elsif count < 9 then
        count := count + 1;
        first_o <= '0';
        prelast_o <= '0';
        last_o <= '0';
        valid_o <= '0';
        index_o <= std_logic_vector(to_unsigned(count - 1, 4));
      elsif count = 9 then
        count := count + 1;
        first_o <= '0';
        prelast_o <= '1';
        last_o <= '0';
        valid_o <= '0';
        index_o <= std_logic_vector(to_unsigned(count - 1, 4));
      elsif count = 10 then
        count := count + 1;
        first_o <= '0';
        prelast_o <= '0';
        last_o <= '1';
        valid_o <= '0';
        index_o <= std_logic_vector(to_unsigned(count - 1, 4));
      elsif count = 11 then
        count := count + 1;
        first_o <= '0';
        prelast_o <= '0';
        last_o <= '0';
        valid_o <= '1';
        index_o <= x"1";
      else
        count := 1;
        first_o <= '1';
        prelast_o <= '0';
        last_o <= '0';
        valid_o <= '0';
        index_o <= x"1";
      end if;
    end if;
  end process;

end architecture;