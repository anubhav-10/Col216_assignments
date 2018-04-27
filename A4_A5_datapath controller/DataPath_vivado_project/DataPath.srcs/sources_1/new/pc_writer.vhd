library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pc_writer is
	port ( clk : in std_logic;
	       inp_val, current: in std_logic_vector(31 downto 0);
		   en,reset : in std_logic;
		   result: out std_logic_vector(31 downto 0)
		);
end entity;

architecture behav of pc_writer is

signal temp : std_logic_vector(31 downto 0);

begin
	process(clk,en,inp_val,current,reset)
	begin
		if (reset = '1') then
		  temp <= (others => '0');
		elsif (rising_edge(clk) and en = '1') then
		  temp <= inp_val;
		end if;
	end process;
	result <= temp;
end behav;