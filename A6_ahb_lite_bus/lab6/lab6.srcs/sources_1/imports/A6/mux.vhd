library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux is
port (	x1,x2 : in std_logic_vector(31 downto 0);
		mem_select,sw_sel: in std_logic;
		x : out std_logic_vector(31 downto 0)
);
end entity;

--x1 -> mem
--x2 -> switch

architecture behav of mux is
	signal temp : std_logic_vector(31 downto 0);
begin
	process(mem_select,x1,x2,sw_sel)
	begin
		if(mem_select='1') then
			temp <= x1;
		elsif(sw_sel='1') then
			temp <= x2;
		end if;
	end process;
	x <= temp;
end behav;