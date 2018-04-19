library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity writer is
	port ( inp_val, current: in std_logic_vector(31 downto 0);
		   en : in std_logic;
		   result: out std_logic_vector(31 downto 0)
		);
end entity;

architecture behav of writer is
begin
	process(en,inp_val,current)
	begin
		if(en = '1') then
			result <= inp_val;
		else
		 	result <= current; 
		end if;
	end process;
end behav;