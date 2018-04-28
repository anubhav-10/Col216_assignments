library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-----------------------------------------
--this is implemented assuming that instructions have bits 31 to 24 in PC, 23 to 16 in PC +1, 15 to 8 in PC +2 and 7 to 0 in PC +3
-----------------------------------------

entity Memory2 is 
port (
        clk : in std_logic;
		operand : in std_logic_vector(31 downto 0);
		addr : in std_logic_vector(8 downto 0); -- 4 kilobytes memory, i.e 2^12
		mem_select,rd_en,wr_en : in std_logic;
		result : out std_logic_vector(31 downto 0)
	);
end Memory2;

architecture Behavioral of Memory2 is

	type memF is array(127 downto 0) of std_logic_vector(31 downto 0);
    signal t : std_logic_vector(31 downto 0) := (others => '0');

    signal memo : memF := (others => t);
    signal rd_data : std_logic_vector(31 downto 0);

    signal rd ,wd: unsigned(8 downto 0);
	signal rd_i,wd_i: integer := 0;

begin
	
	rd <= unsigned(addr);
	wd <= unsigned(addr);

	rd_i <= to_integer(rd);
	wd_i <= to_integer(wd);
    
      
	process (clk,operand,wr_en,wd_i)
	begin
		if(clk='1' and clk'event and mem_select='1') then
			if(wr_en='1') then
			     memo(wd_i) <= operand;
		    elsif(rd_en='1') then
	             rd_data <= memo(rd_i);
	        end if;
		end if;
	end process;
	
	result <= rd_data;

end Behavioral;