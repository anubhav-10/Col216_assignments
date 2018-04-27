library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder_bus is
port(	addr : in std_logic_vector(8 downto 0);
		hwrite : in std_logic;
		mem_select : out std_logic;
		sw_sel,led_sel : out std_logic
);

end entity; 

architecture behav of decoder_bus is
	signal mem_temp : std_logic;
begin

    mem_temp <= not(addr(8) or addr(7));
    sw_sel <= not(mem_temp) and not(hwrite);
    led_sel <= not(mem_temp) and hwrite; 
    mem_select <= mem_temp;

end behav;