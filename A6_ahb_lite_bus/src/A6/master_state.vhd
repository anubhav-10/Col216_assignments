library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity master_state is

port(	clk,reset : in std_logic;
		mem_sel : in std_logic;
		port0,port1,port2,port3 : in std_logic;
		outState : out std_logic_vector(3 downto 0)
);

end entity; 

--0000 -> address phase
--0001 -> wait 1
--0010 -> wait 2
--0011 -> wait 3
--0100 -> switches
--0101 -> led
--0110 -> position
--0111 -> pattern
--1111 -> default
architecture behav of master_state is

	signal state : std_logic_vector(3 downto 0):="1111";

begin
	process(clk,reset)
	begin
		if(reset='1') then state<="0000";
		end if;
		if (clk='1' and clk'event) then
			case state is

				when "1111" => state <="0000";
				when "0000" => 
					if(mem_sel='1') then 
						state <="0001";
					elsif(port0='1') then
						state <="0100";
					elsif(port1='1') then
						state <="0101";
					elsif(port2='1') then
						state <="0110";
					elsif(port3='1') then
						state <="0111";
					end if;
				when "0001" => state <="0010";
				when "0010" => state <="0011";
				when "0011" => state <="0000";
				when "0100" => state <="0000";
				when "0101" => state <="0000";
				when "0110" => state <="0000";
				when "0111" => state <="0000";
                when others => state <="0000";

			end case;
		end if;
	end process;

end behav;