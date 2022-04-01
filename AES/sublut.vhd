----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 30.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: sublut - lut
-- File: sublut.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
--      Rijndael S-box
--   -- | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | a | b | c | d | e | f |
--   ---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
--   00 | 63| 7c| 77| 7b| f2| 6b| 6f| c5| 30| 01| 67| 2b| fe| d7| ab| 76| 
--   10 | ca| 82| c9| 7d| fa| 59| 47| f0| ad| d4| a2| af| 9c| a4| 72| c0| 
--   20 | b7| fd| 93| 26| 36| 3f| f7| cc| 34| a5| e5| f1| 71| d8| 31| 15| 
--   30 | 04| c7| 23| c3| 18| 96| 05| 9a| 07| 12| 80| e2| eb| 27| b2| 75| 
--   40 | 09| 83| 2c| 1a| 1b| 6e| 5a| a0| 52| 3b| d6| b3| 29| e3| 2f| 84| 
--   50 | 53| d1| 00| ed| 20| fc| b1| 5b| 6a| cb| be| 39| 4a| 4c| 58| cf| 
--   60 | d0| ef| aa| fb| 43| 4d| 33| 85| 45| f9| 02| 7f| 50| 3c| 9f| a8| 
--   70 | 51| a3| 40| 8f| 92| 9d| 38| f5| bc| b6| da| 21| 10| ff| f3| d2| 
--   80 | cd| 0c| 13| ec| 5f| 97| 44| 17| c4| a7| 7e| 3d| 64| 5d| 19| 73| 
--   90 | 60| 81| 4f| dc| 22| 2a| 90| 88| 46| ee| b8| 14| de| 5e| 0b| db| 
--   a0 | e0| 32| 3a| 0a| 49| 06| 24| 5c| c2| d3| ac| 62| 91| 95| e4| 79| 
--   b0 | e7| c8| 37| 6d| 8d| d5| 4e| a9| 6c| 56| f4| ea| 65| 7a| ae| 08| 
--   c0 | ba| 78| 25| 2e| 1c| a6| b4| c6| e8| dd| 74| 1f| 4b| bd| 8b| 8a| 
--   d0 | 70| 3e| b5| 66| 48| 03| f6| 0e| 61| 35| 57| b9| 86| c1| 1d| 9e| 
--   e0 | e1| f8| 98| 11| 69| d9| 8e| 94| 9b| 1e| 87| e9| ce| 55| 28| df| 
--   f0 | 8c| a1| 89| 0d| bf| e6| 42| 68| 41| 99| 2d| 0f| b0| 54| bb| 16| 
--   
-- Dependencies: 
-- Additional Comments:
-- https://cryptography.fandom.com/wiki/Rijndael_S-box
-- https://en.wikipedia.org/wiki/Rijndael_S-box
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

entity sublut is
  generic (
    N : positive := 8
  );
  port (
    byte_i : in std_logic_vector(N - 1 downto 0);
    byte_o : out std_logic_vector(N - 1 downto 0)
  );
end sublut;

architecture lut of sublut is

begin

  byte_o <= x"63" when byte_i = x"00" else
    x"7c" when byte_i = x"01" else
    x"77" when byte_i = x"02" else
    x"7b" when byte_i = x"03" else
    x"f2" when byte_i = x"04" else
    x"6b" when byte_i = x"05" else
    x"6f" when byte_i = x"06" else
    x"c5" when byte_i = x"07" else
    x"30" when byte_i = x"08" else
    x"01" when byte_i = x"09" else
    x"67" when byte_i = x"0a" else
    x"2b" when byte_i = x"0b" else
    x"fe" when byte_i = x"0c" else
    x"d7" when byte_i = x"0d" else
    x"ab" when byte_i = x"0e" else
    x"76" when byte_i = x"0f" else
    x"ca" when byte_i = x"10" else
    x"82" when byte_i = x"11" else
    x"c9" when byte_i = x"12" else
    x"7d" when byte_i = x"13" else
    x"fa" when byte_i = x"14" else
    x"59" when byte_i = x"15" else
    x"47" when byte_i = x"16" else
    x"f0" when byte_i = x"17" else
    x"ad" when byte_i = x"18" else
    x"d4" when byte_i = x"19" else
    x"a2" when byte_i = x"1a" else
    x"af" when byte_i = x"1b" else
    x"9c" when byte_i = x"1c" else
    x"a4" when byte_i = x"1d" else
    x"72" when byte_i = x"1e" else
    x"c0" when byte_i = x"1f" else
    x"b7" when byte_i = x"20" else
    x"fd" when byte_i = x"21" else
    x"93" when byte_i = x"22" else
    x"26" when byte_i = x"23" else
    x"36" when byte_i = x"24" else
    x"3f" when byte_i = x"25" else
    x"f7" when byte_i = x"26" else
    x"cc" when byte_i = x"27" else
    x"34" when byte_i = x"28" else
    x"a5" when byte_i = x"29" else
    x"e5" when byte_i = x"2a" else
    x"f1" when byte_i = x"2b" else
    x"71" when byte_i = x"2c" else
    x"d8" when byte_i = x"2d" else
    x"31" when byte_i = x"2e" else
    x"15" when byte_i = x"2f" else
    x"04" when byte_i = x"30" else
    x"c7" when byte_i = x"31" else
    x"23" when byte_i = x"32" else
    x"c3" when byte_i = x"33" else
    x"18" when byte_i = x"34" else
    x"96" when byte_i = x"35" else
    x"05" when byte_i = x"36" else
    x"9a" when byte_i = x"37" else
    x"07" when byte_i = x"38" else
    x"12" when byte_i = x"39" else
    x"80" when byte_i = x"3a" else
    x"e2" when byte_i = x"3b" else
    x"eb" when byte_i = x"3c" else
    x"27" when byte_i = x"3d" else
    x"b2" when byte_i = x"3e" else
    x"75" when byte_i = x"3f" else
    x"09" when byte_i = x"40" else
    x"83" when byte_i = x"41" else
    x"2c" when byte_i = x"42" else
    x"1a" when byte_i = x"43" else
    x"1b" when byte_i = x"44" else
    x"6e" when byte_i = x"45" else
    x"5a" when byte_i = x"46" else
    x"a0" when byte_i = x"47" else
    x"52" when byte_i = x"48" else
    x"3b" when byte_i = x"49" else
    x"d6" when byte_i = x"4a" else
    x"b3" when byte_i = x"4b" else
    x"29" when byte_i = x"4c" else
    x"e3" when byte_i = x"4d" else
    x"2f" when byte_i = x"4e" else
    x"84" when byte_i = x"4f" else
    x"53" when byte_i = x"50" else
    x"d1" when byte_i = x"51" else
    x"00" when byte_i = x"52" else
    x"ed" when byte_i = x"53" else
    x"20" when byte_i = x"54" else
    x"fc" when byte_i = x"55" else
    x"b1" when byte_i = x"56" else
    x"5b" when byte_i = x"57" else
    x"6a" when byte_i = x"58" else
    x"cb" when byte_i = x"59" else
    x"be" when byte_i = x"5a" else
    x"39" when byte_i = x"5b" else
    x"4a" when byte_i = x"5c" else
    x"4c" when byte_i = x"5d" else
    x"58" when byte_i = x"5e" else
    x"cf" when byte_i = x"5f" else
    x"d0" when byte_i = x"60" else
    x"ef" when byte_i = x"61" else
    x"aa" when byte_i = x"62" else
    x"fb" when byte_i = x"63" else
    x"43" when byte_i = x"64" else
    x"4d" when byte_i = x"65" else
    x"33" when byte_i = x"66" else
    x"85" when byte_i = x"67" else
    x"45" when byte_i = x"68" else
    x"f9" when byte_i = x"69" else
    x"02" when byte_i = x"6a" else
    x"7f" when byte_i = x"6b" else
    x"50" when byte_i = x"6c" else
    x"3c" when byte_i = x"6d" else
    x"9f" when byte_i = x"6e" else
    x"a8" when byte_i = x"6f" else
    x"51" when byte_i = x"70" else
    x"a3" when byte_i = x"71" else
    x"40" when byte_i = x"72" else
    x"8f" when byte_i = x"73" else
    x"92" when byte_i = x"74" else
    x"9d" when byte_i = x"75" else
    x"38" when byte_i = x"76" else
    x"f5" when byte_i = x"77" else
    x"bc" when byte_i = x"78" else
    x"b6" when byte_i = x"79" else
    x"da" when byte_i = x"7a" else
    x"21" when byte_i = x"7b" else
    x"10" when byte_i = x"7c" else
    x"ff" when byte_i = x"7d" else
    x"f3" when byte_i = x"7e" else
    x"d2" when byte_i = x"7f" else
    x"cd" when byte_i = x"80" else
    x"0c" when byte_i = x"81" else
    x"13" when byte_i = x"82" else
    x"ec" when byte_i = x"83" else
    x"5f" when byte_i = x"84" else
    x"97" when byte_i = x"85" else
    x"44" when byte_i = x"86" else
    x"17" when byte_i = x"87" else
    x"c4" when byte_i = x"88" else
    x"a7" when byte_i = x"89" else
    x"7e" when byte_i = x"8a" else
    x"3d" when byte_i = x"8b" else
    x"64" when byte_i = x"8c" else
    x"5d" when byte_i = x"8d" else
    x"19" when byte_i = x"8e" else
    x"73" when byte_i = x"8f" else
    x"60" when byte_i = x"90" else
    x"81" when byte_i = x"91" else
    x"4f" when byte_i = x"92" else
    x"dc" when byte_i = x"93" else
    x"22" when byte_i = x"94" else
    x"2a" when byte_i = x"95" else
    x"90" when byte_i = x"96" else
    x"88" when byte_i = x"97" else
    x"46" when byte_i = x"98" else
    x"ee" when byte_i = x"99" else
    x"b8" when byte_i = x"9a" else
    x"14" when byte_i = x"9b" else
    x"de" when byte_i = x"9c" else
    x"5e" when byte_i = x"9d" else
    x"0b" when byte_i = x"9e" else
    x"db" when byte_i = x"9f" else
    x"e0" when byte_i = x"a0" else
    x"32" when byte_i = x"a1" else
    x"3a" when byte_i = x"a2" else
    x"0a" when byte_i = x"a3" else
    x"49" when byte_i = x"a4" else
    x"06" when byte_i = x"a5" else
    x"24" when byte_i = x"a6" else
    x"5c" when byte_i = x"a7" else
    x"c2" when byte_i = x"a8" else
    x"d3" when byte_i = x"a9" else
    x"ac" when byte_i = x"aa" else
    x"62" when byte_i = x"ab" else
    x"91" when byte_i = x"ac" else
    x"95" when byte_i = x"ad" else
    x"e4" when byte_i = x"ae" else
    x"79" when byte_i = x"af" else
    x"e7" when byte_i = x"b0" else
    x"c8" when byte_i = x"b1" else
    x"37" when byte_i = x"b2" else
    x"6d" when byte_i = x"b3" else
    x"8d" when byte_i = x"b4" else
    x"d5" when byte_i = x"b5" else
    x"4e" when byte_i = x"b6" else
    x"a9" when byte_i = x"b7" else
    x"6c" when byte_i = x"b8" else
    x"56" when byte_i = x"b9" else
    x"f4" when byte_i = x"ba" else
    x"ea" when byte_i = x"bb" else
    x"65" when byte_i = x"bc" else
    x"7a" when byte_i = x"bd" else
    x"ae" when byte_i = x"be" else
    x"08" when byte_i = x"bf" else
    x"ba" when byte_i = x"c0" else
    x"78" when byte_i = x"c1" else
    x"25" when byte_i = x"c2" else
    x"2e" when byte_i = x"c3" else
    x"1c" when byte_i = x"c4" else
    x"a6" when byte_i = x"c5" else
    x"b4" when byte_i = x"c6" else
    x"c6" when byte_i = x"c7" else
    x"e8" when byte_i = x"c8" else
    x"dd" when byte_i = x"c9" else
    x"74" when byte_i = x"ca" else
    x"1f" when byte_i = x"cb" else
    x"4b" when byte_i = x"cc" else
    x"bd" when byte_i = x"cd" else
    x"8b" when byte_i = x"ce" else
    x"8a" when byte_i = x"cf" else
    x"70" when byte_i = x"d0" else
    x"3e" when byte_i = x"d1" else
    x"b5" when byte_i = x"d2" else
    x"66" when byte_i = x"d3" else
    x"48" when byte_i = x"d4" else
    x"03" when byte_i = x"d5" else
    x"f6" when byte_i = x"d6" else
    x"0e" when byte_i = x"d7" else
    x"61" when byte_i = x"d8" else
    x"35" when byte_i = x"d9" else
    x"57" when byte_i = x"da" else
    x"b9" when byte_i = x"db" else
    x"86" when byte_i = x"dc" else
    x"c1" when byte_i = x"dd" else
    x"1d" when byte_i = x"de" else
    x"9e" when byte_i = x"df" else
    x"e1" when byte_i = x"e0" else
    x"f8" when byte_i = x"e1" else
    x"98" when byte_i = x"e2" else
    x"11" when byte_i = x"e3" else
    x"69" when byte_i = x"e4" else
    x"d9" when byte_i = x"e5" else
    x"8e" when byte_i = x"e6" else
    x"94" when byte_i = x"e7" else
    x"9b" when byte_i = x"e8" else
    x"1e" when byte_i = x"e9" else
    x"87" when byte_i = x"ea" else
    x"e9" when byte_i = x"eb" else
    x"ce" when byte_i = x"ec" else
    x"55" when byte_i = x"ed" else
    x"28" when byte_i = x"ee" else
    x"df" when byte_i = x"ef" else
    x"8c" when byte_i = x"f0" else
    x"a1" when byte_i = x"f1" else
    x"89" when byte_i = x"f2" else
    x"0d" when byte_i = x"f3" else
    x"bf" when byte_i = x"f4" else
    x"e6" when byte_i = x"f5" else
    x"42" when byte_i = x"f6" else
    x"68" when byte_i = x"f7" else
    x"41" when byte_i = x"f8" else
    x"99" when byte_i = x"f9" else
    x"2d" when byte_i = x"fa" else
    x"0f" when byte_i = x"fb" else
    x"b0" when byte_i = x"fc" else
    x"54" when byte_i = x"fd" else
    x"bb" when byte_i = x"fe" else
    x"16";

end architecture lut;