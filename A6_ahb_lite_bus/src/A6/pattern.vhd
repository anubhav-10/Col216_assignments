library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity pattern is

port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel : in std_logic;
		num : in std_logic_vector(3 downto 0);
		cathode : out std_logic_vector(6 downto 0)
);
end entity;

architecture behav of pattern is

	signal state : std_logic_vector(1 downto 0):="11";
	signal temp_cathode : std_logic_vector(6 downto 0);

begin

	process(clk,state,htrans,port_sel,num)
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
                    case num is
                        when "0000" => temp_cathode<="1000000"; --40
                        when "0001" => temp_cathode<="1111001"; --79
                        when "0010" => temp_cathode<="0100100"; --24
                        when "0011" => temp_cathode<="0110000"; --30
                        when "0100" => temp_cathode<="0011001"; --19
                        when "0101" => temp_cathode<="0010010"; --12
                        when "0110" => temp_cathode<="0000010"; --2
                        when "0111" => temp_cathode<="1111000"; --78
                        when "1000" => temp_cathode<="0000000"; --0
                        when "1001" => temp_cathode<="0010000"; --10
                        
                        when "1010" => temp_cathode<="0001000"; --8
                        when "1011" => temp_cathode<="0000011"; --3
                        when "1100" => temp_cathode<="1000110"; --46
                        when "1101" => temp_cathode<="0100001"; --21
                        when "1110" => temp_cathode<="0000110"; --6
                        when others => temp_cathode<="0001110"; --e
                    end case;
                    state<="00";
                when others =>
                    state<="00";
            end case;
        end if;
	end process;
	cathode <= temp_cathode;

end behav;
