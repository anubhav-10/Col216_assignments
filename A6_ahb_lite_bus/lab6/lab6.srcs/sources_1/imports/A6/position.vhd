library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity position is

port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel : in std_logic;
		hwdata : in std_logic_vector(3 downto 0);
		anode : out std_logic_vector(3 downto 0)
);
end entity;

architecture behav of position is

	signal state : std_logic_vector(1 downto 0):="11";
	signal temp_anode : std_logic_vector(3 downto 0);
begin
	process(clk,state,hwdata,port_sel,hwdata)
	begin
        if (clk='1' and clk'event) then
            case state is 
                when "11" => state<="00";
                when "00" =>
                    if(htrans="00") then state<="00";
                    elsif (port_sel='0') then state<="00";
                    else state<="01";
                    end if;
                when "01" =>
                    temp_anode <= hwdata;
--                    case temp_anode is
--                        when "1000" =>
--                            temp_anode<="0100";
--                        when "0100" =>
--                            temp_anode<="0010";
--                        when "0010" =>
--                            temp_anode<="0001";
--                        when others =>
--                            temp_anode<="1000";
--                    end case;
                    state<="00";
                when others => 
                    state <="00";
            end case;
        end if;
	end process;
	anode<=temp_anode;
end behav;