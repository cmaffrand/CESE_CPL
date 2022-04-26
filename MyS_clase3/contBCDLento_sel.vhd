library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.utils.all;

entity contBCDLento_sel is
    generic(N: natural := 120E6);
    port(
        clk: in std_logic;
        rst: in std_logic;    					-- resetea la cuenta
        sel: in std_logic_vector(1 downto 0);	-- seleccion del digito BCD a mostrar
        q: out std_logic_vector(3 downto 0)
    );
end;

architecture contBCDLento_sel_arq of contBCDLento_sel is
    
    -- declaración del componente counter_10_N
	component counter_10_N is
		generic(N: natural);
		port(
			clk: in std_logic;
			rst: in std_logic;    -- resetea la cuenta
			ena: in std_logic;    -- habilita la cuenta
			sal: out sal_vector(N-1 downto 0)
		);
	end component;

    -- declaración del componente genEna
	component genEna is
		generic(
			N: natural := 4
		);
		port(
			clk: in std_logic;
			rst: in std_logic; 
			sal: out std_logic
		);
	end component;
	
	    -- declaración del componente genEna
	component muxBCD is
		port(
			BCDEnt: in sal_vector(3 downto 0);
			sel: in std_logic_vector(1 downto 0); 
			sal: out std_logic_vector(3 downto 0)
		);
	end component;
	
	signal enaLento: std_logic;
	signal salBCD: sal_vector(3 downto 0);
	   
begin

	cont_inst: counter_10_N
		generic map(
			N => 4
		)
		port map(
			clk => clk,
			rst => rst,
			ena => enaLento,
			sal => salBCD
		);

	genEna_inst: genEna
		generic map(
			N => N
		)
		port map(
			clk	=> clk,
			rst	=> rst,
			sal	=> enaLento
		);
		
	muxBCD_int: muxBCD
		port map(
			BCDEnt	=> salBCD,
			sel		=> sel,
			sal		=> q
		);
end;