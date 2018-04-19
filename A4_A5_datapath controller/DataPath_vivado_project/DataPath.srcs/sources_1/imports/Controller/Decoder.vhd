library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Decoder is 
port(ins: in std_logic_vector(31 downto 0);
	inscd : out std_logic_vector(2 downto 0)
);
end entity;

-----------------------------
-- 000 -> DP Imm
-- 001 -> DP shift imm
-- 010 -> DP shift reg
-- 011 -> MUL, MLA
-- 100 -> Halfword DT ( I(22) is assumed to be 0, not 1)
-- 101 -> DT Imm
-- 110 -> DT Reg
-- 111 -> B, BL
-----------------------------

architecture Behavioral of Decoder is

begin

process(ins)

	begin
		if (ins(27 downto 26) = "01") then
			if(ins(25) = '0') then
				inscd <= "101";
				--------------------
			elsif (ins(25) = '1') then
				inscd <= "110";
				-----------------------
			end if;
		elsif(ins(27 downto 26) = "10") then
			inscd <= "111";
			------------------------------
		elsif (ins(27 downto 26) = "00") then
			if(ins (25) = '1') then
				inscd <= "000";
				---------------------------
			elsif (ins(25) = '0') then
				if(ins(4) = '0') then
					inscd <= "001";
					-------------------------
				elsif (ins(7) = '0') then
					inscd <= "010";
					------------------------
				elsif (ins(7) = '1' and ins (4) = '1') then
					if (ins(6 downto 5) = "00") then
						inscd <= "011";
						------------------------
					elsif (ins (6 downto 5) /= "00") then
						inscd <= "100";
						---------------------------						
					end if ;
					
				end if;
				
			end if;

		end if;
	end process;

end Behavioral; 