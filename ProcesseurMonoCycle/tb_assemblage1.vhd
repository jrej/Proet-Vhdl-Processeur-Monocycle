library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity tb_assemblage1 is
End entity
;

Architecture bench  of tb_assemblage1 is
Signal clock : std_logic:= '0';
Signal We : std_logic;
signal RA,RB,RW : std_logic_vector(3 downto 0);
signal OP : std_logic_vector(1 downto 0);

Component Assemblage1
	port
		(RW,RA,RB : in std_logic_vector(3 downto 0);
		We : in std_logic;
		Op : in std_logic_vector(1 downto 0);
		S : out std_logic_vector(31 downto 0);
		clock : in std_logic;
		N : out  std_logic
);

end component;

Begin

u1 : Assemblage1
  port map(OP => OP, RA=>RA, RB=>RB, RW=>RW, clock=>clock,We => We);
-- R(1) == R(15)
process 
	begin
We <= '1';
Rb <= "1111";
Rw <= "0001";
OP <= "00";
wait for 20 NS;
We <= '1';
Rb <= "1111";
Rw <= "0001";
OP <= "01";
wait for 20 NS;
We <= '1';
Rb <= "1111";
Rw <= "0001";
OP <= "10";
wait for 20 NS;

We <= '1';
Rb <= "1111";
Rw <= "0001";
OP <= "11";

wait for 20 NS;
--R(1) =  R(1) + R(15)





--Horloge
clock <= not clock after 50 ns;
END PROCESS;
end bench;
