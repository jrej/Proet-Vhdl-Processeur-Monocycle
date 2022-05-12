library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Assemblage1 is
port( RW,RA,RB : in std_logic_vector(3 downto 0);
		We : in std_logic;
		Op : in std_logic_vector(1 downto 0);
		S : out std_logic_vector(31 downto 0);
		clock : in std_logic;
		N : out  std_logic
);
end entity;

Architecture description of Assemblage1 is 

	signal busA,busB,busW: std_logic_vector(31 downto 0);

	component Alu port(
	Op : in std_logic_vector(1 downto 0);
	A,B : in std_logic_vector(31 downto 0);
	S : out std_logic_vector(31 downto 0);
	N : out std_logic
	);
	end component;

	component bancregistre port(
		Clk : in std_logic;
		W : in std_logic_vector(31 downto 0);
		RA,RB : in std_logic_vector(3 downto 0);
		RW :  in std_logic_vector(3 downto 0);
		WE : in std_logic;
		A,B : out std_logic_vector(31 downto 0)
		
);
end component ;


begin 

UUT: Alu PORT MAP(
		OP => OP,
		A => busA, B => busB,
		S => busW, N => N );
UUT2: bancregistre PORT MAP(
	A => busA, B => busB,
	W => busW, Clk => clock,
 	RA => RA, RB => RB,
	 RW => RW,WE => WE
	 );
end architecture;




















