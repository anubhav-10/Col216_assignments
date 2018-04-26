library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity position is

port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel : in std_logic;
		anode : out std_logic_vector(3 downto 0)
);
end entity;

architecture behav of position is

	signal state : std_logic_vector(1 downto 0):="00";
	signal temp_anode : std_logic_vector(3 downto 0):="1000";
begin
	process(clk,state)
	begin
		case state is 
			when "00" =>
				if(htrans="00") then state<="00";
				elsif (port_sel='0') then state<="00";
				else state<="01";
				end if;
			when "01" =>
				case temp_anode is
					when "1000" =>
						temp_anode<="0100";
					when "0100" =>
						temp_anode<="0010";
					when "0010" =>
						temp_anode<="0001";
					when "0001" =>
						temp_anode<="1000";
				end case;
				state<="00";
		end case;
	end process;
	anode<=temp_anode;
end behav;