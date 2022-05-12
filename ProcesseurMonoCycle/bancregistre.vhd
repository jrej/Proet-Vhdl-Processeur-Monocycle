library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bancregistre is
port(
		Clk : in std_logic;
		W : in std_logic_vector(31 downto 0);
		RA,RB : in std_logic_vector(3 downto 0):="0000";
		RW :  in std_logic_vector(3 downto 0):="0000";
		WE : in std_logic;
		A,B : out std_logic_vector(31 downto 0)
);
end entity;

architecture comportement of bancregistre is
type table is array(0 to 15) of Std_logic_vector(31 downto 0);
--Fonction d'initalisation du banc de registres
function init_banc return table is

variable result : table;
begin
for i in 14 downto 0 loop
	result(i):= (others=>'0');
end loop;
	result(15):= x"00000030";
	return result;
end init_banc;
-- Declaration et initalisation du banc de registre 16x32 bits
signal Registre: table:=init_banc;

begin
process(Clk)
begin
if(rising_edge(Clk)) then
	If(WE = '1') then 
		Registre(to_integer(unsigned(RW))) <= W;
	end if;
end if;
end process;
A <= Registre(to_integer(unsigned(RA)));
B <= Registre(to_integer(unsigned(RB)));
end architecture;
