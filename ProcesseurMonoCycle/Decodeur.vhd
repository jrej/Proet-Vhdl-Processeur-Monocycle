library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


Entity Decodeur is 
port( 
		instruction : in std_logic_vector(31 downto 0 );
		N : in std_logic_vector(31 downto 0);
		nPCSel , regWr , ALUSrc : out std_logic;
		AluCtr : out std_logic_vector(1 downto 0);
		PSREn , MemWr, WrSrc, regSel : out std_logic;
		Ra, Rb, Rw : out std_logic_vector(3 downto 0 );
		Imm : out std_logic_vector(7 downto 0);
		Offset : out std_logic_vector(23 downto 0)
	);
end Entity;


Architecture controle of Decodeur is 
	
	constant addi : std_logic_vector(11 downto 0) := "111000101000" ;
		constant addr : std_logic_vector(11 downto 0) := "111000001000" ;
		constant mov : std_logic_vector(11 downto 0) := "111000111010" ;
		constant cmp : std_logic_vector(11 downto 0) := "111000110101" ;
		constant ldr : std_logic_vector(11 downto 0) := "111001100001" ;
		constant str : std_logic_vector(11 downto 0) := "111001100000" ;
		constant bal : std_logic_vector(11 downto 0) := "111010100000" ;
		constant blt : std_logic_vector(11 downto 0) := "101010100000" ;
	signal instruction_cour : std_logic_vector(11 downto 0);
	signal Int : std_logic_vector(11 downto 0);
	signal Int2 : std_logic_vector(11 downto 0);
	begin	
		process(instruction, Int)
		
		begin
			case Int is
				when "111000101000" => instruction_cour <= addi ;
				when "111000001000" => instruction_cour <= addr ;
				when "111000111010" => instruction_cour <= mov ;
				when "111000110101" => instruction_cour <= cmp ;
				when "111001100001" => instruction_cour <= ldr ;
				when "111001100000" => instruction_cour <= str ;
				when "111010101111" => instruction_cour <= bal ;
				when "101010101111" => instruction_cour <= blt ;
				when others  => instruction_cour <= instruction_cour ;
			end case;
		end process;
		
		
		process(instruction_cour, Int2)
		begin	
			case Int2 is 
				when addi => nPCSel <= '0';
							 regWr <= '1';
							 ALUSrc <= '1';
							 AluCtr <= "00";
							 MemWr <= '0';
							 WrSrc <= '0';
							 regSel <= '0';
							 PSREn <= '0';
							 
				when addr => nPCSel <= '0';
							 regWr <= '1';
							 ALUSrc <= '0';
							 AluCtr <= "00";
							 MemWr <= '0';
							 WrSrc <= '0';
							 regSel <= '0';
							 PSREn <= '0';
							 
				when bal => nPCSel <= '1';
							 regWr <= '0';
							 ALUSrc <= '-';
							 AluCtr <= "--";
							 MemWr <= '0';
							 WrSrc <= '-';
							 regSel <= '0';
							 PSREn <= '0';
			
				when blt => if(N(0) = '1') then
							nPCSel <= '1';
							 regWr <= '0';
							 ALUSrc <= '-';
							 AluCtr <= "--";
							 MemWr <= '0';
							 WrSrc <= '-';
							 regSel <= '0';
							 PSREn <= '0';
							 end if;
						
				when cmp => nPCSel <= '0';
							 regWr <= '0';
							 ALUSrc <= '1';
							 AluCtr <= "10";
							 MemWr <= '0';
							 WrSrc <= '0';
							 regSel <= '0';
							 PSREn <= '1';
				
				when ldr => nPCSel <= '0';-- on considere l'offset sur 8bits plutot que 12 bits
							 regWr <= '1';
							 ALUSrc <= '1';
							 AluCtr <= "00";
							 MemWr <= '0';
							 WrSrc <= '1';
							 regSel <= '0';
							 PSREn <= '0';
							 
				when mov => nPCSel <= '0';
							 regWr <= '1';
							 ALUSrc <= '1';
							 AluCtr <= "01";
							 MemWr <= '0';
							 WrSrc <= '0';
							 regSel <= '0';
							 PSREn <= '0';
				
				when str => nPCSel <= '0';
							 regWr <= '1';
							 ALUSrc <= '1';
							 AluCtr <= "00";
							 MemWr <= '1';
							 WrSrc <= 'X';
							 regSel <= '1';
							 PSREn <= '0';
							 
				when others => nPCSel <= 'X';
							 regWr <= 'X';
							 ALUSrc <= 'X';
							 AluCtr <= "XX";
							 MemWr <= 'X';
							 WrSrc <= 'X';
							 regSel <= 'X';
							 PSREn <= 'X';
			end case;
		end process;
		
		Rw <= instruction(15 downto 12);
		Ra <= instruction(19 downto 16);
		Rb <= instruction(3 downto 0);
		Imm <= instruction(7 downto 0);
		Offset <= instruction(23 downto 0);
		Int <= instruction(31 downto 20);
		Int2 <= instruction_cour;
		end Architecture;
	
				