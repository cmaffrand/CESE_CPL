----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 05.04.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: aesdencript - struc
-- File: aesdencript.vhd
-- Project Name: AES
-- Target Devices: ZedBoard
-- Tool Versions: 
-- Description: 
--
-- Estructura top de encriptacion con el algoritmo de Rijndael
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
-- 05/04/22  	CJM     0.10	Original
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aesdencript is
  generic (N : positive := 128);
  port (
    clk_i : in std_logic;
    arst_i : in std_logic;
    ready_i : in std_logic;
    key_i : in std_logic_vector(N - 1 downto 0);
    data_i : in std_logic_vector(N - 1 downto 0);
    data_o : out std_logic_vector(N - 1 downto 0);
    valid_o : out std_logic
  );
end aesdencript;

architecture struc of aesdencript is

  signal inputdataadded_s : std_logic_vector(N - 1 downto 0);
  signal roundfeedback_s : std_logic_vector(N - 1 downto 0);
  signal inputround_s : std_logic_vector(N - 1 downto 0);
  signal registeredround_s : std_logic_vector(N - 1 downto 0);
  signal lastroundinput_s : std_logic_vector(N - 1 downto 0);
  signal ciphertext_s : std_logic_vector(N - 1 downto 0);

  signal first_s : std_logic;
  signal last_s : std_logic;
  signal prelast_s : std_logic;

  signal generatedkeys_s : std_logic_vector(N - 1 downto 0);
  signal keyfeedback_s : std_logic_vector(N - 1 downto 0);
  signal orgkey_s : std_logic_vector(N - 1 downto 0);
  signal keystage_s : std_logic_vector(3 downto 0);

begin

  addroundkey_init_inst : entity work.addroundkey(luts)
    port map(
      a_i => data_i,
      b_i => generatedkeys_s,--Tiene que salir del keyunfolded
      o_o => inputdataadded_s
    );

  -- Mux para seleccionar entre dato de entrada o resultado de rondas
  mux_init_inst : entity work.mux128(rtl)
    port map(
      sel_i => first_s,
      a_i => roundfeedback_s,
      b_i => inputdataadded_s,
      o_o => inputround_s
    );

  -- Registro de entrada 
  reg_init_inst : entity work.cipherreg(rtl)
    port map(
      clk_i => clk_i,
      arst_i => arst_i,
      ena_i => '1',
      d_i => inputround_s,
      q_o => registeredround_s
    );

  -- Rondas 1 a 9
  roundsinv_inst : entity work.rounds(strucinv)
    port map(
      data_i => registeredround_s,
      key_i => generatedkeys_s,
      data_o => roundfeedback_s
    );

    -- Registro ultima ronda 
  reg_last_inst : entity work.cipherreg(rtl)
  port map(
    clk_i => clk_i,
    arst_i => arst_i,
    ena_i => prelast_s,
    d_i => roundfeedback_s,
    q_o => lastroundinput_s
  );

  -- Ultima Ronda
  lastroundinv_inst : entity work.lastround(strucinv)
    port map(
      data_i => lastroundinput_s,
      key_i => key_i,
      data_o => ciphertext_s
    );

  -- Registro de salida
  reg_out_inst : entity work.cipherreg(rtl)
    port map(
      clk_i => clk_i,
      arst_i => arst_i,
      ena_i => last_s,
      d_i => ciphertext_s,
      q_o => data_o
    );

  -- Registro de Key original
  reg_keys_init_inst : entity work.cipherreg(rtl)
    port map(
      clk_i => clk_i,
      arst_i => arst_i,
      ena_i => first_s,
      d_i => key_i,
      q_o => orgkey_s
    );

  -- Registro de entrada a generador de Keys
  unofoldedkeygen_inst : entity work.unofoldedkeygen(struc)
    port map(
      clk_i => clk_i,
      arst_i => arst_i,
      ena_i => first_s,
      key_i => orgkey_s,
      stage_i => keystage_s,
      key_o => generatedkeys_s
    );

  -- Modulo de control
  control_inst : entity work.control(rtl)
  port map (
    clk_i => clk_i,
    arst_i => arst_i,
    ready_i => ready_i,
    first_o => first_s,
    prelast_o => prelast_s,
    last_o => last_s,
    valid_o => valid_o,
    index_o => keystage_s
  );

end architecture;