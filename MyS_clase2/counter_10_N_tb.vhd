--------------------------------------------------------------------------
-- Testbench del contador BCD de N dígitos
--
-- Autor: Nicolás Alvarez
-- Fecha: 03/09/12
--------------------------------------------------------------------------

--------------------------------------------------------------------
-- Inclusion de librerias y paquetes
--------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.utils.all;

--------------------------------------------------------------------
-- Declaracion de la entidad
-------------------------------------------------------------------- 
entity counter_10_N_tb is
end;

--------------------------------------------------------------------
-- Arquitectura
--------------------------------------------------------------------
architecture counter_10_N_tb_arq of counter_10_N_tb is

	-- Declaracion del componente a probar
    component counter_10_N is
        generic(N: natural);
        port(
            clk: in std_logic;
            rst: in std_logic;    -- resetea la cuenta
            ena: in std_logic;    -- habilita la cuenta
            sal: out sal_vector(N-1 downto 0)
        );
    end component;

    constant N_t: natural:= 4;  -- Establecimiento de la cantidad de dígitos
	
	-- Declaracion de senales de prueba
    signal clk_t: std_logic:= '0';
    signal rst_t: std_logic:= '1';
    signal ena_t: std_logic:= '1';
    signal sal_t: sal_vector(N_t-1 downto 0);
    
begin

	-- Generacion de las senales de prueba
    clk_t <= not clk_t after 10 ns;
    rst_t <= '0' after 30 ns;
	
	-- Instanciacion del componente a probar
    DUT: counter_10_N
		generic map(
			N => N_t
		)
		port map(
			clk => clk_t,
			rst => rst_t,
			ena => ena_t,
			sal => sal_t
		);

end;