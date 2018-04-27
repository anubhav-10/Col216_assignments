library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity led is

port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel,hwrite : in std_logic;
		hwdata : in std_logic_vector(15 downto 0);
		out_data : out std_logic_vector(15 downto 0)
);
end entity;

architecture behav of led is

	signal state : std_logic_vector(1 downto 0):="11";
	signal temp_data : std_logic_vector(15 downto 0);
begin

	process(state,clk,htrans,port_sel,hwrite,hwdata)
	begin
	   if (clk='1' and clk'event) then
            case state is
                when "11" => state<="00"; 
                when "00" => 
                    if(htrans="00") then state<="00";
                    elsif(port_sel='0') then state<="00";
                    elsif(hwrite='0') then state<="00";
                    else state<="01";
                    end if;
                when "01" =>
                    temp_data <= hwdata;
                    state <="00";	
                when others =>
                     state <="00";
            end case;
        end if;
	end process;

	out_data <= temp_data;

end behav;