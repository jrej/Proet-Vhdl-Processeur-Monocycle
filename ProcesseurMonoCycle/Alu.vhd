Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

entity Alu is
port( Op : in std_logic_vector(1 downto 0);
	A,B : in std_logic_vector(31 downto 0);
	S : out std_logic_vector(31 downto 0);
	N : out std_logic);
end entity;

architecture DESCRIPTION of Alu is
	signal sortie : std_logic_vector(31 downto 0);
	begin
		with Op select
		sortie <= std_logic_vector(signed(A)+signed(B)) when "00",
		B when "01",
		std_logic_vector(signed(A)-signed(B)) when "10",
		A when "11",
		(others => '0') when others;

	N <= sortie(31);
	S <= sortie;

	end architecture;






