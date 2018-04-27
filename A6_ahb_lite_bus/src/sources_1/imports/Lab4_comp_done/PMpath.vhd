library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PMpath is
	port(
		fromP, fromM : in std_logic_vector(31 downto 0);
		DType : in std_logic_vector(1 downto 0); -- 00 or 11
		opco : in std_logic_vector(2 downto 0); -- from controller, 0BL for DType 00 and SHL for DType 
		offset : in std_logic_vector(1 downto 0);
		wr_en : out std_logic_vector(3 downto 0);
		toP, toM : out std_logic_vector(31 downto 0)
		); 
end PMpath;

architecture Behavioral of PMpath  is
	signal toP_tmp,toM_tmp : std_logic_vector(31 downto 0) := (others => '0');
    signal wr_temp : std_logic_vector(3 downto 0) := (others => '0');
begin
	

	process(Dtype,opco,offset,fromM,fromP)
		begin
		--------------------------------------------------------------------
			if (DType = "01") then

				if (opco = "000") then -- str word
					toM_tmp <= fromP;
					toP_tmp <= fromP;
					wr_temp <= "1111";

				elsif (opco = "001") then  -- ldr word
					toM_tmp <= fromM;
					toP_tmp <= fromM;
					wr_temp <= "1111";

				elsif (opco = "010") then -- str byte
					toM_tmp <= fromP;
					toP_tmp <= fromP;
					if (offset = "00") then
						wr_temp <= "0001";
					elsif (offset = "01") then
						wr_temp <= "0010";
					elsif (offset = "10") then
						wr_temp <= "0100";
					elsif (offset = "11") then
						wr_temp <= "1000";
					end if;	

				elsif (opco = "011") then --ldr byte
					toM_tmp <= fromM;
					toP_tmp <= fromM;	
					if (offset = "00") then
						wr_temp <= "0001";
					elsif (offset = "01") then
						wr_temp <= "0010";
					elsif (offset = "10") then
						wr_temp <= "0100";
					elsif (offset = "11") then
						wr_temp <= "1000";
					end if;	

				end if ;
			-----------------------------------------------------------------------
			-- opco  = "000" and "001" is not considered here because it stands for store/load unisgned byte, which is covered in the above case also.
			elsif (DType = "00") then
				
				if (opco = "010") then --str unsigned halfwords
					toP_tmp <= fromP;
					toM_tmp <= fromP;
					if (offset = "01") then
						wr_temp <= "0011";
					elsif (offset = "10") then
					 	 wr_temp <= "1100";
					end if;

				elsif (opco = "011") then --ldr unsigned halfwords
					toM_tmp <= fromM;
					toP_tmp <= fromM;
					if (offset = "01") then
						wr_temp <= "0011";
					elsif (offset = "10") then
					 	 wr_temp <= "1100";
					end if;

				elsif (opco = "101") then  --ldr signed byte
					toM_tmp <= fromM;
					if (offset = "00") then
						wr_temp <= "0001";
						toP_tmp(31 downto 8) <= (others => fromM(7));
						toP_tmp(7 downto 0) <= fromM(7 downto 0);
					elsif (offset = "01") then
						wr_temp <= "0010";
						toP_tmp(31 downto 16) <= (others => fromM(15));
						toP_tmp(15 downto 8) <= fromM(15 downto 8);
						toP_tmp(7 downto 0) <= (others => fromM(8));
					elsif (offset = "10") then
						wr_temp <= "0100";
						toP_tmp(31 downto 24) <= (others => fromM(23));
						toP_tmp(23 downto 16) <= fromM(23 downto 16);
						toP_tmp(15 downto 0) <= (others => fromM(16));
					elsif (offset = "11") then
						wr_temp <= "1000";
						toP_tmp(31 downto 24) <= fromM(31 downto 24);
						toP_tmp(23 downto 0) <= (others => fromM(24));
					end if;	
					--bit extension--

				elsif (opco = "111") then  -- ldr signed halfword
					toM_tmp <= fromM;
					if (offset = "01") then
						wr_temp <= "0011";
						toP_tmp(31 downto 16) <= (others => fromM(15));
						toP_tmp(15 downto 0) <= fromM(15 downto 0);
					elsif (offset = "10") then
					 	 wr_temp <= "1100";
					 	 toP_tmp(31 downto 16) <= fromM(31 downto 16);
						 toP_tmp(15 downto 0) <= (others => fromM(16));
					end if;
					--bit extension--
					
				end if ;

			end if;
			------------------------------------------------------------------------
	end process;

	wr_en <= wr_temp;
	toP <= toP_tmp;
	toM <= toM_tmp;

end Behavioral;