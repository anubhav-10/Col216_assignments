library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NextState is

port(ins : in std_logic_vector(31 downto 0);
	inscd : in std_logic_vector (2 downto 0);
	clk : in std_logic;
	ready : in std_logic; 
	outState : out std_logic_vector(3 downto 0)
);

end entity; 

architecture Behavioral of NextState is

signal state : std_logic_vector(3 downto 0) := "1111";
-- 0000 -> fetch
-- 0001 -> rdAll
-- 0010 -> rdMul
-- 0011 -> rd3rd
-- 0100 -> Shift
-- 0101 -> Result
-- 0110 -> wrDP
-- 0111 -> wrMul
-- 1000 -> wrM
-- 1001 -> rdM
-- 1010 -> M2RF
-- 1011 -> LRupd
-- 1100 -> PCupd
-- 1110 -> Bus wait state
-- 1111 -> default

--------------inscd---------------
-- 000 -> DP Imm
-- 001 -> DP shift imm
-- 010 -> DP shift reg
-- 011 -> MUL, MLA
-- 100 -> Halfword DT ( I(22) is assumed to be 0, not 1)
-- 101 -> DT Imm
-- 110 -> DT Reg
-- 111 -> B, BL
-----------------------------

begin	

	process(clk,inscd,ins,ready)
	begin

		if(clk'event and clk =
 '1') then
			case state is
				when "1111" => state <= "0000";
				
				when "0000" => if (inscd = "011") then 
									state <= "0010";
							   else
									state <= "0001";
							   end if;
				when "0001" => state <= "0011";
				when "0010" => state <= "0011";
				when "0011" => state <= "0100";
				when "0100" => state <= "0101";
				when "0101" => if (inscd = "011") then	
									state <= "0111"; --wrMul
								elsif ((inscd = "100" or inscd = "101" or inscd = "110") and ins(20) = '0') then
									state <= "1000"; --wrM
								elsif ((inscd = "100" or inscd = "101" or inscd = "110") and ins(20) = '1') then
									state <= "1001"; --rdM
								elsif (inscd = "111") then
									state <= "1011"; --LRupd
								elsif (inscd = "000" or inscd = "001" or inscd = "010") then
									state <= "0110"	; --wrDP	
							   end if;

				when "0110" => state <= "0000";
				when "0111" => state <= "0000";				
				
				when "1000" => state <= "1110";
				when "1001" => state <= "1110";
				
				when "1110" => if(ready = '0') then
				                    state <= "1110";
				               elsif (ins(20) = '1') then
				                    state <= "1010";
				               elsif (ins(20) = '0') then
				                    state <= "0000";
				               end if;
				
				when "1011" => state <= "1100";

				when "1010" => state <= "0000";
				when "1100" => state <= "0000";
				when others => state <= state;
			end case;
		end if;

	end process;

outState <= state;

end Behavioral;