library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
    port ( clk,pushbutton: in std_logic;
             clock_out: out std_logic);
end clock_divider;

architecture behavorial of clock_divider is
        
        signal tmp : std_logic := '0';
    begin
    process(clk)
       variable count: integer:=1;
        begin
            if(clk'event and clk='1') then
                count :=count+1;
                if (count = 2000000) then
                    tmp <= NOT tmp;
                    count := 1;
                end if;
        end if;
        if (pushbutton='0') then clock_out<=tmp;
        else clock_out<=clk;
        end if;
    end process;
end behavorial;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity output is

port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel,wr_en : in std_logic;
		hwdata : in std_logic_vector(15 downto 0);
		
        out_data : out std_logic_vector(15 downto 0); -- will be mapped to leds
        cathode : out std_logic_vector(6 downto 0);
        anode : out std_logic_vector(3 downto 0)
);
end output;

architecture behav of output is

component clock_divider 
    port( clk,pushbutton: in std_logic;
            clock_out: out std_logic
          );
end component;

	signal state : std_logic_vector(1 downto 0):="11";
	signal temp_data : std_logic_vector(15 downto 0);
    signal temp_anode : std_logic_vector(3 downto 0):="1000";
    signal temp_cathode : std_logic_vector(6 downto 0);
    signal num : std_logic_vector(3 downto 0):=hwdata(15 downto 12);
    signal clk_out: std_logic;
begin
    --num <= hwdata(15 downto 12);
    clk_div : clock_divider port map(clk,'0',clk_out);
	process(state,clk,htrans,port_sel,wr_en,hwdata,clk_out)
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
                when "01" =>
                    temp_data <= hwdata;

                    if(clk_out='1' and clk_out'event) then
                        case temp_anode is
                            when "1000" =>
                                temp_anode<="0100";
                                num <= hwdata(11 downto 8);
                            when "0100" =>
                                temp_anode<="0010";
                                num <= hwdata(7 downto 4);
                            when "0010" =>
                                temp_anode<="0001";
                                num <= hwdata(3 downto 0);
                            when others =>
                                temp_anode<="1000";
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

                    state <="00";	
                when others =>
                     state <="00";
            end case;
        end if;
	end process;

	out_data <= temp_data;
    anode <= temp_anode;
    cathode <= temp_cathode;
end behav;