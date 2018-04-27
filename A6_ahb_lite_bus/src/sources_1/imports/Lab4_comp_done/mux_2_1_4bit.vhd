library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_1_4bit is
	port ( operand1,operand2: in std_logic_vector(3 downto 0);
		   sel: in std_logic;
		   result: out std_logic_vector(3 downto 0)
		);
end entity;

architecture behav of mux_2_1_4bit is
begin
	process(sel,operand1,operand2)
	begin
		if(sel='0') then result<=operand1;
		else result<=operand2;
		end if;
	end process;
end behav;