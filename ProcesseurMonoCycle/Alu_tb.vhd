----------- Squelette du Banc de Test pour l'Alu -------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Alu_tb is
port( TOK: out boolean:=TRUE);
end entity;

architecture Bench of Alu_tb is

signal TOp : std_logic_vector(1 downto 0);
signal 	TA,TB : std_logic_vector(31 downto 0);
signal 	TS :  std_logic_vector(31 downto 0);
signal 	TN : std_logic;

component Alu port(
	Op : in std_logic_vector(1 downto 0);
	A,B : in std_logic_vector(31 downto 0);
	S : out std_logic_vector(31 downto 0);
	N : out std_logic


);
end component;

begin
UUT: Alu PORT MAP(
		OP => TOP,
		A => TA, B => TB,
		S => TS, N => TN );




	stimulus:process
				begin
				TA <= x"00000001";
				TB <= x"00000010";
				TOp <= "00";
				wait for 10 NS;
				TOK <= TS = x"00000011";
				wait for 10 NS;
				TA <= x"00000001";
				TB <= x"00000001";
				TOp <= "10";
				wait for 10 NS;
				TOK <= TS = x"00000000";
				wait for 10 NS;
				TA <= x"00000001";
				TB <= x"00000010";
				TOp <= "01";
				wait for 10 NS;
				TOK <= TS = x"00000010";
				wait for 10 NS;
				TA <= x"00000001";
				TB <= x"00000010";
				TOp <= "11";
				wait for 10 NS;
				TOK <= TS = x"00000001";
				wait for 10 NS;
				
			
			end process;






end architecture;
