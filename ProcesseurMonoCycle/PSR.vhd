library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PSR is
port(
	clk, rst, we : in std_logic;
	DataIn : in std_logic;
	DataOut : out std_logic_vector(31 downto 0) := (others => '0')
	);
end entity;


Architecture archi of PSR is 
	signal  Int : std_logic_vector(31 downto 0);
	begin
	process(rst, clk)
	begin
		if (rst = '1') then
			int <= (others => '0');
		elsif( clk'event and clk = '1') then
			if(we = '1') then
				Int <= (0 => DataIn, others => '0');
			end if;
		end if;
	end process;
	
	DataOut <= Int ;
end architecture ;