--------------------------------------------------------------------
-- Nombre del componente: counter_10
-- 
-- Descripcion: Contador BCD de un digito
--
-- Autor: Microarquitecturas y Softcores (CESE)
-- Fecha: 10/03/2020
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Inclusion de librerias y paquetes
--------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

--------------------------------------------------------------------
-- Declaracion de la entidad
-------------------------------------------------------------------- 
entity counter_10_tb is
end;

--------------------------------------------------------------------
-- Arquitectura
--------------------------------------------------------------------
architecture counter_10_tb_arq of counter_10_tb is

	-- Declaracion del componente a probar
	component counter_10 is
		port(
			clk: in std_logic;
			rst: in std_logic;    -- resetea la cuenta
			ena: in std_logic;    -- habilita la cuenta
			sal: out std_logic_vector(3 downto 0);
			cout: out std_logic   -- indica que se ha llegado al final de la cuenta
		);
	end component;

	-- Declaracion de las senales de prueba
	signal clk_tb: std_logic:= '0';
	signal rst_tb: std_logic:= '1';
	signal ena_tb: std_logic:= '1';
	signal cout_tb: std_logic:= '0';
	signal sal_tb: std_logic_vector(3 downto 0);
   
begin
	-- Generacion de las senales de prueba
	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 30 ns;

	-- Instanciacion del componente a probar
	DUT: counter_10
		port map(
			clk => clk_tb,
			rst => rst_tb,
			ena => ena_tb,
			sal => sal_tb,
			cout => cout_tb
		);
    
end;