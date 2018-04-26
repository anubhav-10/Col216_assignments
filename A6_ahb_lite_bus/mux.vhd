library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux is
port (	x1 : in std_logic_vector(31 downto 0);
		z1 : in std_logic;
		x2 : in std_logic_vector(31 downto 0);
		z2 : in std_logic;
		x3 : in std_logic_vector(31 downto 0);
		z3 : in std_logic;
		x4 : in std_logic_vector(31 downto 0);
		z4 : in std_logic;
		x5 : in std_logic_vector(31 downto 0);
		z5 : in std_logic;
		mem_select,port0,port1,port2,port3: in std_logic;
		x : out std_logic_vector(31 downto 0);
		z : out std_logic
);
end entity;

architecture behav of mux is
begin
	process(mem_select)
	begin
		if(mem_select='1') then
			x <= x1;
			z <= z1;
		elsif(port0='1') then
			x <= x2;
			z <= z2;
		elsif(port1='1') then
			x <= x3;
			z <= z3;
		elsif(port2='1') then
			x <= x4;
			z <= z4;
		elsif(port3='1') then
			x <= x5;
			z <= z5;
		end if;
	end process;
end behav;