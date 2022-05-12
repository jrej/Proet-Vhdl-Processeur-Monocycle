library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Unitedetraitement is
		generic(N : integer:=8); 
	port(
		RW,RA,RB : in std_logic_vector(3 downto 0);
		clock : in std_logic;
		--COM1,COM2 : in std_logic;
		sel1,sel2: in std_logic;
		Op : in std_logic_vector(1 downto 0);
		regWr,WrEn : in std_logic;
		Imm : in std_logic_vector(N-1  downto 0 );
		flag : out std_logic;
		W : in std_logic_vector(31 downto 0);
		S : out std_logic_vector(31 downto 0);
		N1,N2 : out std_logic);
end entity;


architecture traitement of unitedetraitement is

	signal MuxOut,DataOut,AluOut,BusA,BusB,BusW,ImmExt: std_logic_vector(31 downto 0);
	
	
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


	component extender 
	generic(N : integer:=8); 
	port(
	
		E : in std_logic_vector(N-1 downto 0);
		S : out std_logic_vector(31 downto 0)
	);
	end component;

	
	component Mux2 
	generic(N: integer:=32); 
	port(
		A, B : in std_logic_vector(N-1 downto 0);
		COM : in std_logic;
		S : out std_logic_vector(N-1 downto 0));

	end component;



	component data 
	port(
	Clk,WrEn : in std_logic;
	
	Addr : in std_logic_vector(5 downto 0):="000000";
	DataIn : in std_logic_vector(31 downto 0);
	DataOut : out std_logic_vector(31 downto 0)
	);
	end component;

	begin 

	exte: extender PORT MAP(
		E => Imm , S => ImmExt
		);

	aluu: Alu PORT MAP(
			OP => OP,
			A => busA, B => MuxOut,
			S => AluOut, N => N1 );

	mux1: Mux2 PORT MAP(
			A => BusB, B => ImmExt,
			COM => sel1, S => MuxOut
			
	);

	bancreg: bancregistre PORT MAP(
		A => busA, B => busB,
		W => busW, Clk => clock,
 		RA => RA, RB => RB,
		 RW => RW,WE => regWr
	 );

	datam: data PORT MAP(
		Clk => clock, WrEn => WrEn,
		Addr => AluOut(5 downto 0), DataIn => BusB,
		DataOut => DataOut );
		
	mux22: Mux2 PORT MAP(
			A => AluOut, B => DataOut,
			COM => sel2, S => BusW
			
	);
end architecture;


