library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extender is
generic(N : integer:=2); 
port(
		E : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(31 downto 0)
);
end entity;

architecture comportement of extender is
begin 
	S <= std_logic_vector(to_signed(to_integer(signed(E)),32));
end architecture;
