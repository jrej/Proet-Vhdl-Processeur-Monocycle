library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity tb_gestion_instruction is
End entity;

architecture comportement of tb_gestion_insctruction is
component GestionInstructions is
	port(
		Offset : in std_logic_vector(23 downto 0);
		Instruction : out std_logic_vector(31 downto 0);
		nPCsel : in std_logic;
		Clk,Reset : in std_logic
);
end component;
begin












clock <= not clock after 50 ns;
