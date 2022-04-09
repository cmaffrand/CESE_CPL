library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm is
  port (
    clk_i : in std_logic;
    rst_i : in std_logic;
    ena_i : in std_logic;
    duty_i : in std_logic_vector(7 downto 0);
    band_i : in std_logic_vector(3 downto 0);
    pwm_o : out std_logic;
    pwm_no : out std_logic
  );
end pwm;

architecture rtl of pwm is

  constant MAX_COUNT : integer := 255;

  signal duty_int : integer range 0 to 255;
  signal band_int : integer range 0 to 15;

begin

  duty_int <= to_integer(unsigned(duty_i));
  band_int <= to_integer(unsigned(band_i));

  proc_pwm : process (clk_i, rst_i)
    variable count : integer := 0;
  begin
    if rst_i = '1' then
      count := 0;
      pwm_o <= '0';
      pwm_no <= '0';
    elsif rising_edge(clk_i) then
      if (ena_i = '1') and (duty_int + band_int * 2 < MAX_COUNT) then
        -- Error -> 0
        if count <= duty_int then
            -- Signal Start count = 0 -> start '1' else start -> '0'
          pwm_o <= '1';
          pwm_no <= '0';
          count := count + 1;
        elsif count <= duty_int + band_int then
          pwm_o <= '0';
          pwm_no <= '0';
          count := count + 1;
        elsif count <= MAX_COUNT - band_int then
          pwm_o <= '0';
          pwm_no <= '1';
          count := count + 1;
        elsif count < MAX_COUNT then
          pwm_o <= '0';
          pwm_no <= '0';
          count := count + 1;
        else
          pwm_o <= '0';
          pwm_no <= '0';
          count := 0;
          -- Signal Finsh count = 255 -> finshi '1'
        end if;
      else
        pwm_o <= '0';
        pwm_no <= '0';
        -- Preguntarse por duty_int + band_int * 2 < MAX_COUNT -> error a '1'
        count := 0;
      end if;
    end if;
  end process proc_pwm;

end architecture;