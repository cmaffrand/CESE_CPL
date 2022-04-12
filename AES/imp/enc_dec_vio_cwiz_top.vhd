----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 09.04.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: encdecviocwiz - struc
-- File: enc_dec_vio_cwiz_top.vhd
-- Project Name: AES
-- Target Devices:
-- Tool Versions: ZedBoard
-- Description: 
--
-- Implementacion de encriptador y decriptador de mensajes AES, para la 
-- placa ZedBoard. Utilizando el Virtual Input Output (VIO) del ZedBoard.
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
-- 09/04/22  	CJM     0.10	Original
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity encdecviocwiz is
  port (
    clk_i : in std_logic
  );
end encdecviocwiz;

architecture struc of encdecviocwiz is

  constant N : integer := 128;

  -- General Signals
  signal rst_s : std_logic_vector(0 downto 0);

  -- Encoder Signals
  signal encready_s : std_logic_vector(0 downto 0);
  signal encvalid_s : std_logic_vector(0 downto 0);

  -- Decoder Signals
  signal decready_s : std_logic_vector(0 downto 0);
  signal decvalid_s : std_logic_vector(0 downto 0);

  -- Data signals
  signal key_s : std_logic_vector(N - 1 downto 0);
  signal indata_s : std_logic_vector(N - 1 downto 0);
  signal encdata_s : std_logic_vector(N - 1 downto 0);
  signal outdata_s : std_logic_vector(N - 1 downto 0);

  -- VIO Component
  component vio_1
    port (
      clk : in std_logic;
      probe_in0 : in std_logic_vector(0 downto 0);
      probe_in1 : in std_logic_vector(0 downto 0);
      probe_in2 : in std_logic_vector(127 downto 0);
      probe_in3 : in std_logic_vector(127 downto 0);
      probe_out0 : out std_logic_vector(0 downto 0);
      probe_out1 : out std_logic_vector(0 downto 0);
      probe_out2 : out std_logic_vector(0 downto 0);
      probe_out3 : out std_logic_vector(127 downto 0);
      probe_out4 : out std_logic_vector(127 downto 0)
    );
  end component;

begin

  -- Encrypter
  enc_inst : entity work.aesencript(struc)
    generic map(N => N)
    port map(
      clk_i => clk_i,
      arst_i => rst_s(0),
      ready_i => encready_s(0),
      key_i => key_s,
      data_i => indata_s,
      data_o => encdata_s,
      valid_o => encvalid_s(0)
    );

  -- Decrypter
  dec_inst : entity work.aesdecript(struc)
    generic map(N => N)
    port map(
      clk_i => clk_i,
      arst_i => rst_s(0),
      ready_i => decready_s(0),
      key_i => key_s,
      data_i => encdata_s,
      data_o => outdata_s,
      valid_o => decvalid_s(0)
    );

  -- VIO
  vio_inst : vio_1
  port map(
    clk => clk_i,
    probe_in0 => encvalid_s,
    probe_in1 => decvalid_s,
    probe_in2 => encdata_s,
    probe_in3 => outdata_s,
    probe_out0 => rst_s,
    probe_out1 => encready_s,
    probe_out2 => decready_s,
    probe_out3 => indata_s,
    probe_out4 => key_s
  );

end architecture;