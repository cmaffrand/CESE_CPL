----------------------------------------------------------------------------
-- Company: 
-- Engineer: Maffrand, Carlos
-- 
-- Create Date: 31.03.2022
-- Last Modification Date:
-- Design Name: 
-- Module Name: aesencript - struc
-- File: aesencript.vhd
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
-- 31/03/22  	CJM     0.10	Original
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aesencript is
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
end aesencript;

architecture struc of aesencript is

  signal inputdataadded_s : std_logic_vector(N - 1 downto 0);
  signal roundfeedback_s : std_logic_vector(N - 1 downto 0);
  signal inputround_s : std_logic_vector(N - 1 downto 0);
  signal registeredround_s : std_logic_vector(N - 1 downto 0);
  signal lastroundinput_s : std_logic_vector(N - 1 downto 0);
  signal ciphertext_s : std_logic_vector(N - 1 downto 0);

  --signal busy_s : std_logic;
  signal first_s : std_logic;
  signal last_s : std_logic;
  signal prelast_s : std_logic;

  signal generatedkeys_s : std_logic_vector(N - 1 downto 0);
  signal keyfeedback_s : std_logic_vector(N - 1 downto 0);
  signal inputkeys_s : std_logic_vector(N - 1 downto 0);
  signal keystage_s : std_logic_vector(3 downto 0);

begin

  addroundkey_init_inst : entity work.addroundkey(luts)
    port map(
      a_i => data_i,
      b_i => key_i,
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
  rounds_inst : entity work.rounds(struc)
    port map(
      data_i => registeredround_s,
      key_i => keyfeedback_s,
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
  lastrounds_inst : entity work.lastround(struc)
    port map(
      data_i => lastroundinput_s,
      key_i => keyfeedback_s,
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

  -- Mux para seleccionar entre el key de entrada o el key generado
  mux_key_inst : entity work.mux128(rtl)
    port map(
      sel_i => first_s,
      a_i => keyfeedback_s,
      b_i => key_i,
      o_o => inputkeys_s
    );

  -- Registro de entrada a generador de Keys
  reg_keys_init_inst : entity work.cipherreg(rtl)
    port map(
      clk_i => clk_i,
      arst_i => arst_i,
      ena_i => '1',
      d_i => inputkeys_s,
      q_o => generatedkeys_s
    );

  -- Generador de Keys
  newkeygen_inst : entity work.newkeygen(rtl)
    port map(
      key_i => generatedkeys_s,
      stage_i => keystage_s,
      key_o => keyfeedback_s
    );

  -- Modulo de control
  control_inst : entity work.control(rtl)
  port map (
    clk_i => clk_i,
    arst_i => arst_i,
    ready_i => ready_i,
    keys_ready_i => '1',
    busy_o => open,
    first_o => first_s,
    prelast_o => prelast_s,
    last_o => last_s,
    valid_o => valid_o,
    index_o => keystage_s
  );

end architecture;