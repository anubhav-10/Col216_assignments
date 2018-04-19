library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memo is 
port (
		operand : in signed(31 downto 0);
		rd_addr, wr_addr : in unsigned(11 downto 0); -- 4 kilobytes memory, i.e 2^12
		wr_en, clk : in std_logic;
		result : out signed(31 downto 0)
	);
end Memo;

architecture Behavioral of Memo is

	type memF is array(4095 downto 0) of signed(31 downto 0);
    signal t : std_logic_vector(7 downto 0) := (others => '0');

    signal memo : memF := (others => '0');

	begin

	process (clk,wr_en)
	begin
		if(clk'event and clk = '1' and wr_en = '1') then
			memo(to_integer(wr_addr)) <= operand;
		end if;
	end process;

	result <= memo(to_integer(rd_addr));

end Behavioral;