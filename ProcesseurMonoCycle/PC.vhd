Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

entity PC is
	port(
		W : in std_logic_vector(31 downto 0);
		S: out std_logic_vector(31 downto 0):=x"00000000";
		Reset : in std_logic;
		Clk : in std_logic
	);
end entity;

architecture comportement of PC is
signal Registre : std_logic_vector(31 downto 0):=x"00000000";

begin
process(Clk,Reset)
begin
if(Reset='1') then
	S <=x"00000000";
elsif(rising_edge(clk)) then 
	S <= Registre;
	Registre <= W;
end if;
end process;
end architecture;



