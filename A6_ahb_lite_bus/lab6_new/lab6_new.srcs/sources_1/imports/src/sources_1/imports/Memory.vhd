library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-----------------------------------------
--this is implemented assuming that instructions have bits 31 to 24 in PC, 23 to 16 in PC +1, 15 to 8 in PC +2 and 7 to 0 in PC +3
-----------------------------------------

entity Memory is 
port (
        clk : in std_logic;
		operand : in std_logic_vector(31 downto 0);
		addr : in std_logic_vector(8 downto 0); -- 4 kilobytes memory, i.e 2^12
		wr_en : in std_logic;
		result : out std_logic_vector(31 downto 0)
	);
end Memory;

architecture Behavioral of Memory is

	type memF is array(127 downto 0) of std_logic_vector(31 downto 0);
    signal t : std_logic_vector(31 downto 0) := (others => '0');

    signal memo : memF := (others => t);
    signal rd_data : std_logic_vector(31 downto 0);
    --signal rd_data : std_logic_vector(31 downto 0);

    signal rd ,wd: unsigned(8 downto 0);
	signal rd_i,wd_i: integer := 0;

begin
	
	rd <= unsigned(addr);
	wd <= unsigned(addr);

	rd_i <= to_integer(rd);
	wd_i <= to_integer(wd);
    
    memo(0) <= "11100011101000000000000011000101";
    memo(1) <= "11100101100000000000000000000000";
    --memo(2) <= "11100101100000000010000000000000";
--    memo(2) <= "11100101100100000010000000000000";
--    memo(0) <= "11100011";
--    memo(1) <= "00000000";
--    memo(3) <= "00000100";        
      
	process (operand)
	begin
    memo(0) <= "11100011101000000000000011000101";
    memo(1) <= "11100101100000000000000000000000";
    --memo(2) <= "11100101100000000010000000000000";
--        memo(2) <= "11100101100100000010000000000000";
	end process;
	
	rd_data <= memo(rd_i);
	result <= rd_data;

end Behavioral;