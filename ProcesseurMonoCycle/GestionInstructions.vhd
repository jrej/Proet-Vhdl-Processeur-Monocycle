library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity GestionInstructions is
	port(
		Offset : in std_logic_vector(23 downto 0);
		Instruction : out std_logic_vector(31 downto 0);
		nPCsel : in std_logic;
		Clk,Reset : in std_logic
);
end entity;

architecture comportement of GestionInstructions is
signal N1,N2,N3,N4,N5: std_logic_vector(31 downto 0);
-- PC 
component PC port(
		W : in std_logic_vector(31 downto 0):=x"00000000";
		S: out std_logic_vector(31 downto 0):=x"00000000";
		Reset : in std_logic;
		Clk : in std_logic
		
);
end component ;

-- Instruction Memory
component instruction_memory 
	port(
		PC: in std_logic_vector (31 downto 0);
		Instruction: out std_logic_vector (31 downto 0)
    );
end component;

-- Mux 
component Mux2 
generic(N : integer:=32); 
port(
	A, B : in std_logic_vector(N-1 downto 0);
	COM : in std_logic;
	S : out std_logic_vector(N-1 downto 0)
);
end component;

--Extender
component extender 
generic(N : integer:=24); 
port(
		E : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(31 downto 0)
);
end component;

--Additionneur 
component Addition32 is
port(
		A,B: in std_logic_vector(31 downto 0);
		S : out std_logic_vector(31 downto 0)
);
end component;

begin

extenderr: extender PORT MAP(
		E => Offset,S=>N1);

additionneur1: Addition32 PORT MAP(
		A=>N1,B=>N4,S=>N2);

Additionneur2: Addition32 PORT MAP(
		A=>N5,B=>x"00000001",S=>N4);

MUX: Mux2 PORT MAP(
		A=>N4,B=>N2,COM=>nPCsel,S=>N3);
PCR : PC PORT MAP(
			W=>N3,Reset=>Reset,Clk=>Clk,S=>N5);

INSTRUCTMEMO:	instruction_memory PORT MAP(
		PC => N5,Instruction=>Instruction);

end architecture;

	



