--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Sun Jun 12 09:39:45 2022
--Host        : LAPTOP-2EOK6531 running 64-bit major release  (build 9200)
--Command     : generate_target aes_enc_dec_test_wrapper.bd
--Design      : aes_enc_dec_test_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
entity aes_enc_dec_test_wrapper is
  port (
    DDR_addr : inout std_logic_vector (14 downto 0);
    DDR_ba : inout std_logic_vector (2 downto 0);
    DDR_cas_n : inout std_logic;
    DDR_ck_n : inout std_logic;
    DDR_ck_p : inout std_logic;
    DDR_cke : inout std_logic;
    DDR_cs_n : inout std_logic;
    DDR_dm : inout std_logic_vector (3 downto 0);
    DDR_dq : inout std_logic_vector (31 downto 0);
    DDR_dqs_n : inout std_logic_vector (3 downto 0);
    DDR_dqs_p : inout std_logic_vector (3 downto 0);
    DDR_odt : inout std_logic;
    DDR_ras_n : inout std_logic;
    DDR_reset_n : inout std_logic;
    DDR_we_n : inout std_logic;
    FIXED_IO_ddr_vrn : inout std_logic;
    FIXED_IO_ddr_vrp : inout std_logic;
    FIXED_IO_mio : inout std_logic_vector (53 downto 0);
    FIXED_IO_ps_clk : inout std_logic;
    FIXED_IO_ps_porb : inout std_logic;
    FIXED_IO_ps_srstb : inout std_logic;
    reset_rtl : in std_logic;
    sys_clock : in std_logic
  );
end aes_enc_dec_test_wrapper;

architecture STRUCTURE of aes_enc_dec_test_wrapper is
  component aes_enc_dec_test is
    port (
      DDR_cas_n : inout std_logic;
      DDR_cke : inout std_logic;
      DDR_ck_n : inout std_logic;
      DDR_ck_p : inout std_logic;
      DDR_cs_n : inout std_logic;
      DDR_reset_n : inout std_logic;
      DDR_odt : inout std_logic;
      DDR_ras_n : inout std_logic;
      DDR_we_n : inout std_logic;
      DDR_ba : inout std_logic_vector (2 downto 0);
      DDR_addr : inout std_logic_vector (14 downto 0);
      DDR_dm : inout std_logic_vector (3 downto 0);
      DDR_dq : inout std_logic_vector (31 downto 0);
      DDR_dqs_n : inout std_logic_vector (3 downto 0);
      DDR_dqs_p : inout std_logic_vector (3 downto 0);
      FIXED_IO_mio : inout std_logic_vector (53 downto 0);
      FIXED_IO_ddr_vrn : inout std_logic;
      FIXED_IO_ddr_vrp : inout std_logic;
      FIXED_IO_ps_srstb : inout std_logic;
      FIXED_IO_ps_clk : inout std_logic;
      FIXED_IO_ps_porb : inout std_logic;
      sys_clock : in std_logic;
      reset_rtl : in std_logic
    );
  end component aes_enc_dec_test;
begin
  aes_enc_dec_test_i : component aes_enc_dec_test
    port map(
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      reset_rtl => reset_rtl,
      sys_clock => sys_clock
    );
  end STRUCTURE;