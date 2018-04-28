library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity regF is
    port(wr_data: in signed(31 downto 0);
    rd_addr1,rd_addr2,wr_addr : in unsigned(3 downto 0);
    clk,reset,wr_en : in std_logic;
    rd_data1,rd_data2 : out signed(31 downto 0);
    pc : out unsigned(31 downto 0)
);
end entity;

architecture Behavioral of regF is
    type regF is array(15 downto 0) of signed(31 downto 0);
    signal t : signed(31 downto 0) := (others => '0');

	signal registers : regF := (others => t);
	
    begin
    process(clk, wr_en, reset,t)
        begin
            if (clk'event and clk = '1' and wr_en = '1' ) then
                    registers(to_integer(wr_addr)) <= wr_data;
            end if;
            if (reset = '1') then
                registers(15) <= t;
            end if;
    end process;
    
    rd_data1 <= registers(to_integer(rd_addr1));
    rd_data2 <= registers(to_integer(rd_addr2));
    pc <= unsigned(registers(0));
    
end Behavioral;