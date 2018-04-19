library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-----------------------------------------
--this is implemented assuming that instructions have bits 31 to 24 in PC, 23 to 16 in PC +1, 15 to 8 in PC +2 and 7 to 0 in PC +3
-----------------------------------------

entity Memory is 
port (
		operand : in std_logic_vector(31 downto 0);
		addr : in std_logic_vector(11 downto 0); -- 4 kilobytes memory, i.e 2^12
		wr_en : in std_logic;
		result : out std_logic_vector(31 downto 0)
	);
end Memory;

architecture Behavioral of Memory is

	type memF is array(4095 downto 0) of std_logic_vector(7 downto 0);
    signal t : std_logic_vector(7 downto 0) := (others => '0');

    signal memo : memF := (others => t);
    signal rd_data : std_logic_vector(31 downto 0);
    --signal rd_data : std_logic_vector(31 downto 0);

    signal rd ,wd: unsigned(11 downto 0);
	signal rd_i,wd_i: integer;

begin
	
	rd <= unsigned(addr);
	wd <= unsigned(addr);

	rd_i <= to_integer(rd);
	wd_i <= to_integer(wd);
    
--    memo(0) <= "11100011";
--    memo(1) <= "00000000";
--    memo(3) <= "00000100";        
      
	process (addr,addr,wr_en,operand)
	begin
		if(wr_en = '1') then
			memo(to_integer(wd)) <= operand(31 downto 24);
			memo(to_integer(wd)+1) <= operand(23 downto 16);
			memo(to_integer(wd)+2) <= operand(15 downto 8);
			memo(to_integer(wd)+3) <= operand(7 downto 0);
		end if;
	end process;

	rd_data(31 downto 24) <= memo(to_integer(rd));
	rd_data(23 downto 16) <= memo(to_integer(rd)+1);
	rd_data(15 downto 8) <= memo(to_integer(rd)+2);
	rd_data(7 downto 0) <= memo(to_integer(rd)+3);

	result <= rd_data;

end Behavioral;