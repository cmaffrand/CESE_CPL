----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 01.04.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: sublutinv - lut
-- File: sublutinv.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
--      Rijndael inverse S-box
--      | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | a | b | c | d | e | f |
--   ---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
--   00 | 52| 09| 6a| d5| 30| 36| a5| 38| bf| 40| a3| 9e| 81| f3| d7| fb| 
--   10 | 7c| e3| 39| 82| 9b| 2f| ff| 87| 34| 8e| 43| 44| c4| de| e9| cb| 
--   20 | 54| 7b| 94| 32| a6| c2| 23| 3d| ee| 4c| 95| 0b| 42| fa| c3| 4e| 
--   30 | 08| 2e| a1| 66| 28| d9| 24| b2| 76| 5b| a2| 49| 6d| 8b| d1| 25| 
--   40 | 72| f8| f6| 64| 86| 68| 98| 16| d4| a4| 5c| cc| 5d| 65| b6| 92| 
--   50 | 6c| 70| 48| 50| fd| ed| b9| da| 5e| 15| 46| 57| a7| 8d| 9d| 84| 
--   60 | 90| d8| ab| 00| 8c| bc| d3| 0a| f7| e4| 58| 05| b8| b3| 45| 06| 
--   70 | d0| 2c| 1e| 8f| ca| 3f| 0f| 02| c1| af| bd| 03| 01| 13| 8a| 6b| 
--   80 | 3a| 91| 11| 41| 4f| 67| dc| ea| 97| f2| cf| ce| f0| b4| e6| 73| 
--   90 | 96| ac| 74| 22| e7| ad| 35| 85| e2| f9| 37| e8| 1c| 75| df| 6e| 
--   a0 | 47| f1| 1a| 71| 1d| 29| c5| 89| 6f| b7| 62| 0e| aa| 18| be| 1b| 
--   b0 | fc| 56| 3e| 4b| c6| d2| 79| 20| 9a| db| c0| fe| 78| cd| 5a| f4| 
--   c0 | 1f| dd| a8| 33| 88| 07| c7| 31| b1| 12| 10| 59| 27| 80| ec| 5f| 
--   d0 | 60| 51| 7f| a9| 19| b5| 4a| 0d| 2d| e5| 7a| 9f| 93| c9| 9c| ef| 
--   e0 | a0| e0| 3b| 4d| ae| 2a| f5| b0| c8| eb| bb| 3c| 83| 53| 99| 61| 
--   f0 | 17| 2b| 04| 7e| ba| 77| d6| 26| e1| 69| 14| 63| 55| 21| 0c| 7d|
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
-- 01/04/22  	CJM     0.10	Original
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity sublutinv is
  generic (
    N : positive := 8
  );
  port (
    byte_i : in std_logic_vector(N - 1 downto 0);
    byte_o : out std_logic_vector(N - 1 downto 0)
  );
end sublutinv;

architecture lut of sublutinv is

begin

  byte_o <= x"52" when byte_i = x"00" else
            x"09" when byte_i = x"01" else
            x"6a" when byte_i = x"02" else
            x"d5" when byte_i = x"03" else
            x"30" when byte_i = x"04" else
            x"36" when byte_i = x"05" else
            x"a5" when byte_i = x"06" else
            x"38" when byte_i = x"07" else
            x"bf" when byte_i = x"08" else
            x"40" when byte_i = x"09" else
            x"a3" when byte_i = x"0a" else
            x"9e" when byte_i = x"0b" else
            x"81" when byte_i = x"0c" else
            x"f3" when byte_i = x"0d" else
            x"d7" when byte_i = x"0e" else
            x"fb" when byte_i = x"0f" else
            x"7c" when byte_i = x"10" else
            x"e3" when byte_i = x"11" else
            x"39" when byte_i = x"12" else
            x"82" when byte_i = x"13" else
            x"9b" when byte_i = x"14" else
            x"2f" when byte_i = x"15" else
            x"ff" when byte_i = x"16" else
            x"87" when byte_i = x"17" else
            x"34" when byte_i = x"18" else
            x"8e" when byte_i = x"19" else
            x"43" when byte_i = x"1a" else
            x"44" when byte_i = x"1b" else
            x"c4" when byte_i = x"1c" else
            x"de" when byte_i = x"1d" else
            x"e9" when byte_i = x"1e" else
            x"cb" when byte_i = x"1f" else
            x"54" when byte_i = x"20" else
            x"7b" when byte_i = x"21" else
            x"94" when byte_i = x"22" else
            x"32" when byte_i = x"23" else
            x"a6" when byte_i = x"24" else
            x"c2" when byte_i = x"25" else
            x"23" when byte_i = x"26" else
            x"3d" when byte_i = x"27" else
            x"ee" when byte_i = x"28" else
            x"4c" when byte_i = x"29" else
            x"95" when byte_i = x"2a" else
            x"0b" when byte_i = x"2b" else
            x"42" when byte_i = x"2c" else
            x"fa" when byte_i = x"2d" else
            x"c3" when byte_i = x"2e" else
            x"4e" when byte_i = x"2f" else
            x"08" when byte_i = x"30" else
            x"2e" when byte_i = x"31" else
            x"a1" when byte_i = x"32" else
            x"66" when byte_i = x"33" else
            x"28" when byte_i = x"34" else
            x"d9" when byte_i = x"35" else
            x"24" when byte_i = x"36" else
            x"b2" when byte_i = x"37" else
            x"76" when byte_i = x"38" else
            x"5b" when byte_i = x"39" else
            x"a2" when byte_i = x"3a" else
            x"49" when byte_i = x"3b" else
            x"6d" when byte_i = x"3c" else
            x"8b" when byte_i = x"3d" else
            x"d1" when byte_i = x"3e" else
            x"25" when byte_i = x"3f" else
            x"72" when byte_i = x"40" else
            x"f8" when byte_i = x"41" else
            x"f6" when byte_i = x"42" else
            x"64" when byte_i = x"43" else
            x"86" when byte_i = x"44" else
            x"68" when byte_i = x"45" else
            x"98" when byte_i = x"46" else
            x"16" when byte_i = x"47" else
            x"d4" when byte_i = x"48" else
            x"a4" when byte_i = x"49" else
            x"5c" when byte_i = x"4a" else
            x"cc" when byte_i = x"4b" else
            x"5d" when byte_i = x"4c" else
            x"65" when byte_i = x"4d" else
            x"b6" when byte_i = x"4e" else
            x"92" when byte_i = x"4f" else
            x"6c" when byte_i = x"50" else
            x"70" when byte_i = x"51" else
            x"48" when byte_i = x"52" else
            x"50" when byte_i = x"53" else
            x"fd" when byte_i = x"54" else
            x"ed" when byte_i = x"55" else
            x"b9" when byte_i = x"56" else
            x"da" when byte_i = x"57" else
            x"5e" when byte_i = x"58" else
            x"15" when byte_i = x"59" else
            x"46" when byte_i = x"5a" else
            x"57" when byte_i = x"5b" else
            x"a7" when byte_i = x"5c" else
            x"8d" when byte_i = x"5d" else
            x"9d" when byte_i = x"5e" else
            x"84" when byte_i = x"5f" else
            x"90" when byte_i = x"60" else
            x"d8" when byte_i = x"61" else
            x"ab" when byte_i = x"62" else
            x"00" when byte_i = x"63" else
            x"8c" when byte_i = x"64" else
            x"bc" when byte_i = x"65" else
            x"d3" when byte_i = x"66" else
            x"0a" when byte_i = x"67" else
            x"f7" when byte_i = x"68" else
            x"e4" when byte_i = x"69" else
            x"58" when byte_i = x"6a" else
            x"05" when byte_i = x"6b" else
            x"b8" when byte_i = x"6c" else
            x"b3" when byte_i = x"6d" else
            x"45" when byte_i = x"6e" else
            x"06" when byte_i = x"6f" else
            x"d0" when byte_i = x"70" else
            x"2c" when byte_i = x"71" else
            x"1e" when byte_i = x"72" else
            x"8f" when byte_i = x"73" else
            x"ca" when byte_i = x"74" else
            x"3f" when byte_i = x"75" else
            x"0f" when byte_i = x"76" else
            x"02" when byte_i = x"77" else
            x"c1" when byte_i = x"78" else
            x"af" when byte_i = x"79" else
            x"bd" when byte_i = x"7a" else
            x"03" when byte_i = x"7b" else
            x"01" when byte_i = x"7c" else
            x"13" when byte_i = x"7d" else
            x"8a" when byte_i = x"7e" else
            x"6b" when byte_i = x"7f" else
            x"3a" when byte_i = x"80" else
            x"91" when byte_i = x"81" else
            x"11" when byte_i = x"82" else
            x"41" when byte_i = x"83" else
            x"4f" when byte_i = x"84" else
            x"67" when byte_i = x"85" else
            x"dc" when byte_i = x"86" else
            x"ea" when byte_i = x"87" else
            x"97" when byte_i = x"88" else
            x"f2" when byte_i = x"89" else
            x"cf" when byte_i = x"8a" else
            x"ce" when byte_i = x"8b" else
            x"f0" when byte_i = x"8c" else
            x"b4" when byte_i = x"8d" else
            x"e6" when byte_i = x"8e" else
            x"73" when byte_i = x"8f" else
            x"96" when byte_i = x"90" else
            x"ac" when byte_i = x"91" else
            x"74" when byte_i = x"92" else
            x"22" when byte_i = x"93" else
            x"e7" when byte_i = x"94" else
            x"ad" when byte_i = x"95" else
            x"35" when byte_i = x"96" else
            x"85" when byte_i = x"97" else
            x"e2" when byte_i = x"98" else
            x"f9" when byte_i = x"99" else
            x"37" when byte_i = x"9a" else
            x"e8" when byte_i = x"9b" else
            x"1c" when byte_i = x"9c" else
            x"75" when byte_i = x"9d" else
            x"df" when byte_i = x"9e" else
            x"6e" when byte_i = x"9f" else
            x"47" when byte_i = x"a0" else
            x"f1" when byte_i = x"a1" else
            x"1a" when byte_i = x"a2" else
            x"71" when byte_i = x"a3" else
            x"1d" when byte_i = x"a4" else
            x"29" when byte_i = x"a5" else
            x"c5" when byte_i = x"a6" else
            x"89" when byte_i = x"a7" else
            x"6f" when byte_i = x"a8" else
            x"b7" when byte_i = x"a9" else
            x"62" when byte_i = x"aa" else
            x"0e" when byte_i = x"ab" else
            x"aa" when byte_i = x"ac" else
            x"18" when byte_i = x"ad" else
            x"be" when byte_i = x"ae" else
            x"1b" when byte_i = x"af" else
            x"fc" when byte_i = x"b0" else
            x"56" when byte_i = x"b1" else
            x"3e" when byte_i = x"b2" else
            x"4b" when byte_i = x"b3" else
            x"c6" when byte_i = x"b4" else
            x"d2" when byte_i = x"b5" else
            x"79" when byte_i = x"b6" else
            x"20" when byte_i = x"b7" else
            x"9a" when byte_i = x"b8" else
            x"db" when byte_i = x"b9" else
            x"c0" when byte_i = x"ba" else
            x"fe" when byte_i = x"bb" else
            x"78" when byte_i = x"bc" else
            x"cd" when byte_i = x"bd" else
            x"5a" when byte_i = x"be" else
            x"f4" when byte_i = x"bf" else
            x"1f" when byte_i = x"c0" else
            x"dd" when byte_i = x"c1" else
            x"a8" when byte_i = x"c2" else
            x"33" when byte_i = x"c3" else
            x"88" when byte_i = x"c4" else
            x"07" when byte_i = x"c5" else
            x"c7" when byte_i = x"c6" else
            x"31" when byte_i = x"c7" else
            x"b1" when byte_i = x"c8" else
            x"12" when byte_i = x"c9" else
            x"10" when byte_i = x"ca" else
            x"59" when byte_i = x"cb" else
            x"27" when byte_i = x"cc" else
            x"80" when byte_i = x"cd" else
            x"ec" when byte_i = x"ce" else
            x"5f" when byte_i = x"cf" else
            x"60" when byte_i = x"d0" else
            x"51" when byte_i = x"d1" else
            x"7f" when byte_i = x"d2" else
            x"a9" when byte_i = x"d3" else
            x"19" when byte_i = x"d4" else
            x"b5" when byte_i = x"d5" else
            x"4a" when byte_i = x"d6" else
            x"0d" when byte_i = x"d7" else
            x"2d" when byte_i = x"d8" else
            x"e5" when byte_i = x"d9" else
            x"7a" when byte_i = x"da" else
            x"9f" when byte_i = x"db" else
            x"93" when byte_i = x"dc" else
            x"c9" when byte_i = x"dd" else
            x"9c" when byte_i = x"de" else
            x"ef" when byte_i = x"df" else
            x"a0" when byte_i = x"e0" else
            x"e0" when byte_i = x"e1" else
            x"3b" when byte_i = x"e2" else
            x"4d" when byte_i = x"e3" else
            x"ae" when byte_i = x"e4" else
            x"2a" when byte_i = x"e5" else
            x"f5" when byte_i = x"e6" else
            x"b0" when byte_i = x"e7" else
            x"c8" when byte_i = x"e8" else
            x"eb" when byte_i = x"e9" else
            x"bb" when byte_i = x"ea" else
            x"3c" when byte_i = x"eb" else
            x"83" when byte_i = x"ec" else
            x"53" when byte_i = x"ed" else
            x"99" when byte_i = x"ee" else
            x"61" when byte_i = x"ef" else
            x"17" when byte_i = x"f0" else
            x"2b" when byte_i = x"f1" else
            x"04" when byte_i = x"f2" else
            x"7e" when byte_i = x"f3" else
            x"ba" when byte_i = x"f4" else
            x"77" when byte_i = x"f5" else
            x"d6" when byte_i = x"f6" else
            x"26" when byte_i = x"f7" else
            x"e1" when byte_i = x"f8" else
            x"69" when byte_i = x"f9" else
            x"14" when byte_i = x"fa" else
            x"63" when byte_i = x"fb" else
            x"55" when byte_i = x"fc" else
            x"21" when byte_i = x"fd" else
            x"0c" when byte_i = x"fe" else
            x"7d";

end architecture lut;