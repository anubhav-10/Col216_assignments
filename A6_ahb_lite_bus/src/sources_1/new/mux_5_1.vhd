library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_5_1 is
	port ( operand1,operand2,operand3,operand4,operand5: in std_logic_vector(31 downto 0);
		   sel: in std_logic_vector(2 downto 0);
		   result: out std_logic_vector(31 downto 0)
		);
end entity;

architecture behav of mux_5_1 is
begin
	process(sel,operand1,operand2,operand3,operand4,operand5)
	begin
		if(sel="000") then result<=operand1;
		elsif(sel="001") then result<=operand2;
		elsif(sel="010") then result<=operand3;
		elsif (sel = "011")then result <= operand4;
		else result <= operand5;
		end if;
	end process;
end behav;