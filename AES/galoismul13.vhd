----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 01.04.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: galoismul13 - lut
-- File: galoismul13.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
--      Galois Multiplication x 13 in GD(2^8)
--
--0x00,0x0d,0x1a,0x17,0x34,0x39,0x2e,0x23,0x68,0x65,0x72,0x7f,0x5c,0x51,0x46,0x4b,
--0xd0,0xdd,0xca,0xc7,0xe4,0xe9,0xfe,0xf3,0xb8,0xb5,0xa2,0xaf,0x8c,0x81,0x96,0x9b,
--0xbb,0xb6,0xa1,0xac,0x8f,0x82,0x95,0x98,0xd3,0xde,0xc9,0xc4,0xe7,0xea,0xfd,0xf0,
--0x6b,0x66,0x71,0x7c,0x5f,0x52,0x45,0x48,0x03,0x0e,0x19,0x14,0x37,0x3a,0x2d,0x20,
--0x6d,0x60,0x77,0x7a,0x59,0x54,0x43,0x4e,0x05,0x08,0x1f,0x12,0x31,0x3c,0x2b,0x26,
--0xbd,0xb0,0xa7,0xaa,0x89,0x84,0x93,0x9e,0xd5,0xd8,0xcf,0xc2,0xe1,0xec,0xfb,0xf6,
--0xd6,0xdb,0xcc,0xc1,0xe2,0xef,0xf8,0xf5,0xbe,0xb3,0xa4,0xa9,0x8a,0x87,0x90,0x9d,
--0x06,0x0b,0x1c,0x11,0x32,0x3f,0x28,0x25,0x6e,0x63,0x74,0x79,0x5a,0x57,0x40,0x4d,
--0xda,0xd7,0xc0,0xcd,0xee,0xe3,0xf4,0xf9,0xb2,0xbf,0xa8,0xa5,0x86,0x8b,0x9c,0x91,
--0x0a,0x07,0x10,0x1d,0x3e,0x33,0x24,0x29,0x62,0x6f,0x78,0x75,0x56,0x5b,0x4c,0x41,
--0x61,0x6c,0x7b,0x76,0x55,0x58,0x4f,0x42,0x09,0x04,0x13,0x1e,0x3d,0x30,0x27,0x2a,
--0xb1,0xbc,0xab,0xa6,0x85,0x88,0x9f,0x92,0xd9,0xd4,0xc3,0xce,0xed,0xe0,0xf7,0xfa,
--0xb7,0xba,0xad,0xa0,0x83,0x8e,0x99,0x94,0xdf,0xd2,0xc5,0xc8,0xeb,0xe6,0xf1,0xfc,
--0x67,0x6a,0x7d,0x70,0x53,0x5e,0x49,0x44,0x0f,0x02,0x15,0x18,0x3b,0x36,0x21,0x2c,
--0x0c,0x01,0x16,0x1b,0x38,0x35,0x22,0x2f,0x64,0x69,0x7e,0x73,0x50,0x5d,0x4a,0x47,
--0xdc,0xd1,0xc6,0xcb,0xe8,0xe5,0xf2,0xff,0xb4,0xb9,0xae,0xa3,0x80,0x8d,0x9a,0x97
--   
-- Dependencies: 
-- Additional Comments:
-- https://cryptography.fandom.com/wiki/Rijndael_mix_columns
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

entity galoismul13 is
  generic (
    N : positive := 8
  );
  port (
    byte_i : in std_logic_vector(N - 1 downto 0);
    byte_o : out std_logic_vector(N - 1 downto 0)
  );
end galoismul13;

architecture lut of galoismul13 is

begin

  byte_o <= x"00" when byte_i = x"00" else
            x"0d" when byte_i = x"01" else
            x"1a" when byte_i = x"02" else
            x"17" when byte_i = x"03" else
            x"34" when byte_i = x"04" else
            x"39" when byte_i = x"05" else
            x"2e" when byte_i = x"06" else
            x"23" when byte_i = x"07" else
            x"68" when byte_i = x"08" else
            x"65" when byte_i = x"09" else
            x"72" when byte_i = x"0a" else
            x"7f" when byte_i = x"0b" else
            x"5c" when byte_i = x"0c" else
            x"51" when byte_i = x"0d" else
            x"46" when byte_i = x"0e" else
            x"4b" when byte_i = x"0f" else
            x"d0" when byte_i = x"10" else
            x"dd" when byte_i = x"11" else
            x"ca" when byte_i = x"12" else
            x"c7" when byte_i = x"13" else
            x"e4" when byte_i = x"14" else
            x"e9" when byte_i = x"15" else
            x"fe" when byte_i = x"16" else
            x"f3" when byte_i = x"17" else
            x"b8" when byte_i = x"18" else
            x"b5" when byte_i = x"19" else
            x"a2" when byte_i = x"1a" else
            x"af" when byte_i = x"1b" else
            x"8c" when byte_i = x"1c" else
            x"81" when byte_i = x"1d" else
            x"96" when byte_i = x"1e" else
            x"9b" when byte_i = x"1f" else
            x"bb" when byte_i = x"20" else
            x"b6" when byte_i = x"21" else
            x"a1" when byte_i = x"22" else
            x"ac" when byte_i = x"23" else
            x"8f" when byte_i = x"24" else
            x"82" when byte_i = x"25" else
            x"95" when byte_i = x"26" else
            x"98" when byte_i = x"27" else
            x"d3" when byte_i = x"28" else
            x"de" when byte_i = x"29" else
            x"c9" when byte_i = x"2a" else
            x"c4" when byte_i = x"2b" else
            x"e7" when byte_i = x"2c" else
            x"ea" when byte_i = x"2d" else
            x"fd" when byte_i = x"2e" else
            x"f0" when byte_i = x"2f" else
            x"6b" when byte_i = x"30" else
            x"66" when byte_i = x"31" else
            x"71" when byte_i = x"32" else
            x"7c" when byte_i = x"33" else
            x"5f" when byte_i = x"34" else
            x"52" when byte_i = x"35" else
            x"45" when byte_i = x"36" else
            x"48" when byte_i = x"37" else
            x"03" when byte_i = x"38" else
            x"0e" when byte_i = x"39" else
            x"19" when byte_i = x"3a" else
            x"14" when byte_i = x"3b" else
            x"37" when byte_i = x"3c" else
            x"3a" when byte_i = x"3d" else
            x"2d" when byte_i = x"3e" else
            x"20" when byte_i = x"3f" else
            x"6d" when byte_i = x"40" else
            x"60" when byte_i = x"41" else
            x"77" when byte_i = x"42" else
            x"7a" when byte_i = x"43" else
            x"59" when byte_i = x"44" else
            x"54" when byte_i = x"45" else
            x"43" when byte_i = x"46" else
            x"4e" when byte_i = x"47" else
            x"05" when byte_i = x"48" else
            x"08" when byte_i = x"49" else
            x"1f" when byte_i = x"4a" else
            x"12" when byte_i = x"4b" else
            x"31" when byte_i = x"4c" else
            x"3c" when byte_i = x"4d" else
            x"2b" when byte_i = x"4e" else
            x"26" when byte_i = x"4f" else
            x"bd" when byte_i = x"50" else
            x"b0" when byte_i = x"51" else
            x"a7" when byte_i = x"52" else
            x"aa" when byte_i = x"53" else
            x"89" when byte_i = x"54" else
            x"84" when byte_i = x"55" else
            x"93" when byte_i = x"56" else
            x"9e" when byte_i = x"57" else
            x"d5" when byte_i = x"58" else
            x"d8" when byte_i = x"59" else
            x"cf" when byte_i = x"5a" else
            x"c2" when byte_i = x"5b" else
            x"e1" when byte_i = x"5c" else
            x"ec" when byte_i = x"5d" else
            x"fb" when byte_i = x"5e" else
            x"f6" when byte_i = x"5f" else
            x"d6" when byte_i = x"60" else
            x"db" when byte_i = x"61" else
            x"cc" when byte_i = x"62" else
            x"c1" when byte_i = x"63" else
            x"e2" when byte_i = x"64" else
            x"ef" when byte_i = x"65" else
            x"f8" when byte_i = x"66" else
            x"f5" when byte_i = x"67" else
            x"be" when byte_i = x"68" else
            x"b3" when byte_i = x"69" else
            x"a4" when byte_i = x"6a" else
            x"a9" when byte_i = x"6b" else
            x"8a" when byte_i = x"6c" else
            x"87" when byte_i = x"6d" else
            x"90" when byte_i = x"6e" else
            x"9d" when byte_i = x"6f" else
            x"06" when byte_i = x"70" else
            x"0b" when byte_i = x"71" else
            x"1c" when byte_i = x"72" else
            x"11" when byte_i = x"73" else
            x"32" when byte_i = x"74" else
            x"3f" when byte_i = x"75" else
            x"28" when byte_i = x"76" else
            x"25" when byte_i = x"77" else
            x"6e" when byte_i = x"78" else
            x"63" when byte_i = x"79" else
            x"74" when byte_i = x"7a" else
            x"79" when byte_i = x"7b" else
            x"5a" when byte_i = x"7c" else
            x"57" when byte_i = x"7d" else
            x"40" when byte_i = x"7e" else
            x"4d" when byte_i = x"7f" else
            x"da" when byte_i = x"80" else
            x"d7" when byte_i = x"81" else
            x"c0" when byte_i = x"82" else
            x"cd" when byte_i = x"83" else
            x"ee" when byte_i = x"84" else
            x"e3" when byte_i = x"85" else
            x"f4" when byte_i = x"86" else
            x"f9" when byte_i = x"87" else
            x"b2" when byte_i = x"88" else
            x"bf" when byte_i = x"89" else
            x"a8" when byte_i = x"8a" else
            x"a5" when byte_i = x"8b" else
            x"86" when byte_i = x"8c" else
            x"8b" when byte_i = x"8d" else
            x"9c" when byte_i = x"8e" else
            x"91" when byte_i = x"8f" else
            x"0a" when byte_i = x"90" else
            x"07" when byte_i = x"91" else
            x"10" when byte_i = x"92" else
            x"1d" when byte_i = x"93" else
            x"3e" when byte_i = x"94" else
            x"33" when byte_i = x"95" else
            x"24" when byte_i = x"96" else
            x"29" when byte_i = x"97" else
            x"62" when byte_i = x"98" else
            x"6f" when byte_i = x"99" else
            x"78" when byte_i = x"9a" else
            x"75" when byte_i = x"9b" else
            x"56" when byte_i = x"9c" else
            x"5b" when byte_i = x"9d" else
            x"4c" when byte_i = x"9e" else
            x"41" when byte_i = x"9f" else
            x"61" when byte_i = x"a0" else
            x"6c" when byte_i = x"a1" else
            x"7b" when byte_i = x"a2" else
            x"76" when byte_i = x"a3" else
            x"55" when byte_i = x"a4" else
            x"58" when byte_i = x"a5" else
            x"4f" when byte_i = x"a6" else
            x"42" when byte_i = x"a7" else
            x"09" when byte_i = x"a8" else
            x"04" when byte_i = x"a9" else
            x"13" when byte_i = x"aa" else
            x"1e" when byte_i = x"ab" else
            x"3d" when byte_i = x"ac" else
            x"30" when byte_i = x"ad" else
            x"27" when byte_i = x"ae" else
            x"2a" when byte_i = x"af" else
            x"b1" when byte_i = x"b0" else
            x"bc" when byte_i = x"b1" else
            x"ab" when byte_i = x"b2" else
            x"a6" when byte_i = x"b3" else
            x"85" when byte_i = x"b4" else
            x"88" when byte_i = x"b5" else
            x"9f" when byte_i = x"b6" else
            x"92" when byte_i = x"b7" else
            x"d9" when byte_i = x"b8" else
            x"d4" when byte_i = x"b9" else
            x"c3" when byte_i = x"ba" else
            x"ce" when byte_i = x"bb" else
            x"ed" when byte_i = x"bc" else
            x"e0" when byte_i = x"bd" else
            x"f7" when byte_i = x"be" else
            x"fa" when byte_i = x"bf" else
            x"b7" when byte_i = x"c0" else
            x"ba" when byte_i = x"c1" else
            x"ad" when byte_i = x"c2" else
            x"a0" when byte_i = x"c3" else
            x"83" when byte_i = x"c4" else
            x"8e" when byte_i = x"c5" else
            x"99" when byte_i = x"c6" else
            x"94" when byte_i = x"c7" else
            x"df" when byte_i = x"c8" else
            x"d2" when byte_i = x"c9" else
            x"c5" when byte_i = x"ca" else
            x"c8" when byte_i = x"cb" else
            x"eb" when byte_i = x"cc" else
            x"e6" when byte_i = x"cd" else
            x"f1" when byte_i = x"ce" else
            x"fc" when byte_i = x"cf" else
            x"67" when byte_i = x"d0" else
            x"6a" when byte_i = x"d1" else
            x"7d" when byte_i = x"d2" else
            x"70" when byte_i = x"d3" else
            x"53" when byte_i = x"d4" else
            x"5e" when byte_i = x"d5" else
            x"49" when byte_i = x"d6" else
            x"44" when byte_i = x"d7" else
            x"0f" when byte_i = x"d8" else
            x"02" when byte_i = x"d9" else
            x"15" when byte_i = x"da" else
            x"18" when byte_i = x"db" else
            x"3b" when byte_i = x"dc" else
            x"36" when byte_i = x"dd" else
            x"21" when byte_i = x"de" else
            x"2c" when byte_i = x"df" else
            x"0c" when byte_i = x"e0" else
            x"01" when byte_i = x"e1" else
            x"16" when byte_i = x"e2" else
            x"1b" when byte_i = x"e3" else
            x"38" when byte_i = x"e4" else
            x"35" when byte_i = x"e5" else
            x"22" when byte_i = x"e6" else
            x"2f" when byte_i = x"e7" else
            x"64" when byte_i = x"e8" else
            x"69" when byte_i = x"e9" else
            x"7e" when byte_i = x"ea" else
            x"73" when byte_i = x"eb" else
            x"50" when byte_i = x"ec" else
            x"5d" when byte_i = x"ed" else
            x"4a" when byte_i = x"ee" else
            x"47" when byte_i = x"ef" else
            x"dc" when byte_i = x"f0" else
            x"d1" when byte_i = x"f1" else
            x"c6" when byte_i = x"f2" else
            x"cb" when byte_i = x"f3" else
            x"e8" when byte_i = x"f4" else
            x"e5" when byte_i = x"f5" else
            x"f2" when byte_i = x"f6" else
            x"ff" when byte_i = x"f7" else
            x"b4" when byte_i = x"f8" else
            x"b9" when byte_i = x"f9" else
            x"ae" when byte_i = x"fa" else
            x"a3" when byte_i = x"fb" else
            x"80" when byte_i = x"fc" else
            x"8d" when byte_i = x"fd" else
            x"9a" when byte_i = x"fe" else
            x"97";

end architecture lut;