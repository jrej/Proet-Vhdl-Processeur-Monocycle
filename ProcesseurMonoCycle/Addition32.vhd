library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Addition32 is
port(
		A,B: in std_logic_vector(31 downto 0);
		S : out std_logic_vector(31 downto 0)
);
end Addition32;

architecture comportement of Addition32 is
begin
	S <= std_logic_vector(signed(A) + signed(B));
end architecture;
			
	
