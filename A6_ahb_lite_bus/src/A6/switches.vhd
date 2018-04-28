library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity switches is

port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel,rd_en : in std_logic;
		
		in_data : in std_logic_vector(15 downto 0); -- will be mapped to switches on the board
        
        hready : out std_logic;		
		hrdata : out std_logic_vector(15 downto 0)
);
end entity;

architecture behav of switches is

	signal state : std_logic_vector(1 downto 0):="11";
	signal temp_data : std_logic_vector(15 downto 0);
    signal temp_ready : std_logic;
begin

	process(state,clk,htrans,port_sel,in_data)
	begin
	   if (clk='1' and clk'event) then
            case state is
                when "11" => state<="00";
                when "00" => 
                    if(htrans="00") then state<="00";
                    elsif(port_sel='0') then state<="00";
                    elsif(rd_en='0') then state<="00";
                    else state<="01";
                    end if;
                    temp_ready <= '0';
                when "01" =>
                    temp_data <= in_data;
                    temp_ready <= '1';
                    state <="00";	
                when others =>
                    state <="00";
            end case;
        end if;
	end process;

	hrdata <= temp_data;
    hready <= temp_ready;

end behav;