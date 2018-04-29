library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_3_1_4bit is
	port ( operand1,operand2,operand3: in std_logic_vector(3 downto 0);
		   sel: in std_logic_vector(1 downto 0);
		   result: out std_logic_vector(3 downto 0)
		);
end entity;

architecture behav of mux_3_1_4bit is
begin
	process(sel,operand1,operand2,operand3)
	begin
		if(sel="00") then result<=operand1;
		elsif(sel="01") then result<=operand2;
		elsif(sel="10") then result<=operand3;
		end if;
	end process;
end behav;