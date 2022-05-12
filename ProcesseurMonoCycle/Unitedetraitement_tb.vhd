library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Unitedetraitement_tb is
End entity;

architecture bench of Unitedetraitement_tb is 
	
signal		RW,RA,RB :  std_logic_vector(3 downto 0);
signal		We: std_logic;
signal      clock : std_logic:= '0';
--signal		COM1,COM2 :  std_logic;
signal		sel1,sel2: std_logic;
signal		Op :  std_logic_vector(1 downto 0);
signal		Imm :  std_logic_vector(7  downto 0 );
signal      regWr,WrEn :  std_logic;
signal		flag :  std_logic;
signal		W : std_logic_vector(31 downto 0);
signal		S :  std_logic_vector(31 downto 0);
signal		N1,N2 :  std_logic;

component Unitedetraitement 	
	port(
		RW,RA,RB : in std_logic_vector(3 downto 0);
		clock : in std_logic;
	--	COM1,COM2 : in std_logic;
		sel1,sel2: in std_logic;
		Op : in std_logic_vector(1 downto 0);
		regWr,WrEn : in std_logic;
		Imm : in std_logic_vector(7  downto 0 );
		flag : out std_logic;
		W : in std_logic_vector(31 downto 0);
		S : out std_logic_vector(31 downto 0);
		N1,N2 : out std_logic
		);
end component;

	begin
	u1 : Unitedetraitement 
	port map ( RW => RW,RA => RA, RB => RB, WrEn => WrEn, clock => clock,
				 sel1 => sel1, sel2 => sel2,
				Op => Op , Imm => Imm ,flag => flag , W => W , S => S,
				N1 => N1 , N2 => N2 , regWr => regWr);

	process
		begin
			regWr <= '1';
			OP <= "00" ;
			sel1 <= '0';
			sel2 <= '0';
			Ra <= "0001";
			Rb <= "1111";
			Rw <= "0001";
			WrEn <= '0';
	
		wait for 100 NS ;


			regWr <= '1';
			OP <= "00" ;
			sel1 <= '1';
			sel2 <= '0';
			Ra <= "1111";
			--Rb <= "0011";
			Rw <= "0011";
			WrEn <= '0';
			Imm <= "00000010";
	
		wait for 100 NS ;

			regWr <= '1';
			OP <= "10" ;
			sel1 <= '0';
			sel2 <= '0';
			Ra <= "0011";
			Rb <= "0001";
			Rw <= "0100";
			WrEn <= '0';
			Imm <= "00000010";
	
		wait for 100 NS ;

			regWr <= '1';
			OP <= "10" ;
			sel1 <= '1';
			sel2 <= '0';
			Ra <= "1111";
			Rb <= "0001";
			Rw <= "0101";
			WrEn <= '0';
			Imm <= "00001000";
	
		wait for 100 NS;

			sel1 <= '1';
			Imm <= "00000001";
			OP <= "01";
			WrEn <= '1';
			Rb <= "1111";

		wait for 100 ns;


			RW <= "1110";
			SEL2 <= '1';
			WrEn <= '0';

			wait;
			
		

end process;

clock <= not clock after 50 ns;
end architecture;
			
			
		


