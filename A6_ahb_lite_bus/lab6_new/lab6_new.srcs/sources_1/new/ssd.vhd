library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
port(   clk : in std_logic;
        clk_out : out std_logic
);
end entity;

architecture behav of clock_divider is

    signal tmp : std_logic := '0';
begin
    
    process(clk,tmp)
        variable count : integer := 1;
    begin
        if(clk='1' and clk'event) then
            count:=count+1;
            if(count=20000000) then
                tmp <= not tmp;
                count := 1;
            end if;
        end if;  
        clk_out <= tmp;
    end process;
    
end behav;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ssd is
port (  clk : in std_logic;
        hwdata : in std_logic_vector(15 downto 0);
        anode : out std_logic_vector(3 downto 0);
        cathode : out std_logic_Vector(6 downto 0)  
);
end entity;

architecture behav of ssd is

component clock_divider is
port(   clk : in std_logic;
        clk_out : out std_logic
);
end component;

    signal clk_out: std_logic;
    signal temp_anode : std_logic_vector(3 downto 0):="1000";
    signal num : std_logic_vector(3 downto 0);
    signal temp_cathode : std_logic_vector(6 downto 0);
begin

    clk_div : clock_divider port map(clk,clk_out);

    process(clk,hwdata,clk_out)
    begin
            if(clk_out='1'and clk_out'event) then
            case temp_anode is
                when "0111" =>
                    temp_anode<="1011";
                    num <= hwdata(11 downto 8);
                when "1011" =>
                    temp_anode<="1101";
                    num <= hwdata(7 downto 4);
                when "1101" =>
                    temp_anode<="1110";
                    num <= hwdata(3 downto 0);
                when others =>
                    temp_anode<="0111";
                    num <= hwdata(15 downto 12);
            end case;
        end if;
        
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
    end process;
    
    anode <= temp_anode;
    cathode <= temp_cathode;
    
end behav;