library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux2 is 
generic(N : integer:=2); 
port(
	A, B : in std_logic_vector(N-1 downto 0);
	COM : in std_logic;
	S : out std_logic_vector(N-1 downto 0));
end entity;


architecture archi_mux2 of Mux2 is
	begin
	with COM select
	S <= A when '0',
		 B when '1',
		(others => '0') when others;
end architecture;
	
