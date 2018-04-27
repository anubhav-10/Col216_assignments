library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mem_state is

port(	clk,reset : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		mem_select : in std_logic;
		outState : out std_logic_vector(2 downto 0)
);

end entity; 

--000 -> address phase
--001 -> wait 1
--010 -> wait 2
--011 -> wait 3
--111 -> default
architecture behav of mem_state is

	signal state : std_logic_vector(2 downto 0):="111";

begin
	process(clk,reset,htrans,mem_select)
	begin
		if(reset='1') then state<="000";
		end if;
		if (clk='1' and clk'event) then
			case state is

				when "111" => state <="000";
				when "000" => 
					if(htrans = "00") then state <= "000";
					elsif (mem_select='0') then state <= "000";
					else state <="001";
					end if;
				when "001" => state <="010";
				when "010" => state <="011";
				when "011" => state <="000";
				when others =>
					state <="000";
			end case;
		end if;
	end process;
	outState <= state;
end behav;