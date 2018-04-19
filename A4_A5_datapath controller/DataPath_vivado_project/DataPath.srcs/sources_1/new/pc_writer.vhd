library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pc_writer is
	port ( inp_val, current: in std_logic_vector(31 downto 0);
		   en,reset : in std_logic;
		   result: out std_logic_vector(31 downto 0)
		);
end entity;

architecture behav of pc_writer is
begin
	process(en,inp_val,current,reset)
	begin
		if(en = '1') then
			result <= inp_val;
		else
		 	result <= current; 
		end if;
		if(reset='1') then
		    result <= (others => '0');
		end if;
	end process;
end behav;