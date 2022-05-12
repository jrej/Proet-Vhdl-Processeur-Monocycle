library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data is 

port(
	Clk,WrEn : in std_logic;
	
	Addr : in std_logic_vector(5 downto 0):="000000";
	DataIn : in std_logic_vector(31 downto 0);
	DataOut : out std_logic_vector(31 downto 0)
);
end entity;

architecture Comportement of data is

type RameType is array(0 to 63) of std_logic_vector(31 downto 0);

function init_banc return rameType is
variable result : RameType;
begin 
	for i in 63 downto 0 loop	
		result(i) :=(others=>'0');
	end loop;
	return result;
end init_banc;

signal data: RameType := init_banc; 
begin
process(Clk)
begin
	if rising_edge(Clk) then 
		if (WrEn = '1') then
			data(to_integer(unsigned(Addr))) <= DataIn ;
		end if;
	end if;
end process;
		DataOut <= data(to_integer(unsigned(Addr)));
end comportement;
