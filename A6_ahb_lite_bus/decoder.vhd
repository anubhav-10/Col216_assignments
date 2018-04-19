library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder is
port(	addr : in std_logic_vector(11 downto 0);
		mem_select,io : out std_logic;
		port0,port1,port2,port3 : out std_logic
);

end entity; 

--io
--0 -> i
--1 -> o
architecture behav of decoder is

begin
	signal mem_temp,io_temp : std_logic;

	mem_select <= addr(11) and addr(10) and addr(9) and addr(8) and addr(7) and addr(6) and addr(5) and addr(4) and addr(3) and addr(2);
	io <= not (mem_select);

	port0 <= (not addr(1)) and (not addr(0));
	port1 <= (not addr(1)) and (addr(0));
	port2 <= (addr(1)) and (not addr(0));
	port3 <= (addr(1)) and (addr(0));

end behav;