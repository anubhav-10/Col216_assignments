library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity output is

port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel,wr_en : in std_logic;
		hwdata : in std_logic_vector(15 downto 0);
		
		hready : out std_logic;
        out_data : out std_logic_vector(15 downto 0) -- will be mapped to leds
--        cathode : out std_logic_vector(6 downto 0);
--        anode : out std_logic_vector(3 downto 0)
);
end output;

architecture behav of output is

	signal state : std_logic_vector(1 downto 0):="11";
	signal temp_data : std_logic_vector(15 downto 0);
--    signal temp_anode : std_logic_vector(3 downto 0):="1000";
--    signal temp_cathode : std_logic_vector(6 downto 0);
    signal temp_ready: std_logic;
    signal num : std_logic_vector(3 downto 0):=hwdata(15 downto 12);
begin
    --num <= hwdata(15 downto 12);
    
	process(state,clk,htrans,port_sel,wr_en,hwdata)
	begin
	   if (clk='1' and clk'event) then
            case state is
                when "11" => state<="00"; 
                when "00" => 
                    if(htrans="00") then state<="00";
                    elsif(port_sel='0') then state<="00";
                    elsif(wr_en='0') then state<="00";
                    else state<="01";
                    end if;
                    temp_ready <= '0';
                when "01" =>
                    temp_data <= hwdata;
                    temp_ready <= '1';
                    

                    state <="00";	
                when others =>
                     state <="00";
                    temp_ready <= '0';
            end case;
        end if;
	end process;

	out_data <= temp_data;
--    anode <= temp_anode;
--    cathode <= temp_cathode;
    hready <= temp_ready;
end behav;