--------------------------------------------------------------------------
-- Contador BCD de N d�gitos (utiliza el contador BCD de 1 d�gito)
--
-- Autor: Nicol�s Alvarez
-- Fecha: 03/09/12
--------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.utils.all;

entity counter_10_N is
    generic(N: natural);
    port(
        clk: in std_logic;
        rst: in std_logic;    -- resetea la cuenta
        ena: in std_logic;    -- habilita la cuenta
        sal: out sal_vector(N-1 downto 0)
    );
end;

architecture p of counter_10_N is
    
    -- declaraci�n del componente counter_10
    component counter_10 is
    port(
        clk: in std_logic;
        rst: in std_logic;
        ena: in std_logic;
        sal: out std_logic_vector(3 downto 0);
        cout: out std_logic
    );
    end component;

    -- declaraci�n de se�ales auxiliares
    signal cout: std_logic_vector(N downto 0);
    signal aux: std_logic_vector(N downto 0);
   
begin

    aux(0) <= ena;

    --instanciaci�n de N componentes counter_10
    aa: for i in 1 to N generate

		-- Completar el codigo para generar N digitos BCD
		-- conectados 
	
    end generate;

	
end;