library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4_1_5bit is
	port ( operand1,operand2,operand3,operand4: in std_logic_vector(4 downto 0);
		   sel: in std_logic_vector(1 downto 0);
		   result: out std_logic_vector(4 downto 0)
		);
end entity;

architecture behav of mux_4_1_5bit is
begin
	process(sel,operand1,operand2,operand3,operand4)
	begin
		if(sel="00") then result<=operand1;
		elsif(sel="01") then result<=operand2;
		elsif(sel="10") then result<=operand3;
		else result<=operand4;
		end if;
	end process;
end behav;