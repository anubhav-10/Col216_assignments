library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Actrl is 
port(state : in std_logic_vector(3 downto 0);
	ins: in std_logic_vector(31 downto 0);
	inscd : in std_logic_vector(2 downto 0);
	op : out std_logic_vector(3 downto 0)
);
end entity;

---------------------STATES FOR REFERENCE---------------
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
----------------------------------------------------------

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

architecture Behavioral of Actrl is
begin
	process(state, ins, inscd)
	begin
		case state is
			when "0000" => op <= "0100"; --add only
			when "1100" => op <= "0100"; --add only
			--------------------------------------------------------
			when "0101" => if (inscd = "011") then	
									op <= "0100";
							elsif ((inscd = "100" or inscd = "101" or inscd = "110") and ins(23) = '1') then
									op <= "0100";  --add offset
							elsif ((inscd = "100" or inscd = "101" or inscd = "110") and ins(23) = '0') then
									op <= "0010";  --subtract offset
							elsif (inscd = "000") then
								op <= ins(24 downto 21);
							end if;
			----------------------------------------------------------
			when others => op <= "0100";
		end case;
	end process;
end Behavioral;