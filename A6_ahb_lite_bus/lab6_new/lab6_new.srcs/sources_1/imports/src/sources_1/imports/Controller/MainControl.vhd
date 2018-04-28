library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MainControl is

port(ins : in std_logic_vector(31 downto 0);
	state : in std_logic_vector(3 downto 0);
	inscd : in std_logic_vector(2 downto 0);
	p : in std_logic;
	----------------------------------------------
	pw : out std_logic;
	iord : out std_logic; -- multiplexer for outstruction read or data write
	mr : out std_logic;
	mw : out std_logic;
	offset : out std_logic_vector(1 downto 0);  --for PM path
	DType : out std_logic_vector(1 downto 0);  --for PM path
	opco : out std_logic_vector(2 downto 0);  -- for PM path
	iw : out std_logic;	
	dw : out std_logic;
	rsrc1 : out std_logic;
	rsrc2 : out std_logic_vector(1 downto 0); -- multiplexer for 2nd operand
	wsrc : out std_logic_vector(1 downto 0); -- multiplexer for write addr, pc, lr
	m2r : out std_logic_vector(1 downto 0); -- multiplexer for data to write...from memory or ALU  
	rw : out std_logic;
	aw : out std_logic;
	bw : out std_logic;
	cw : out std_logic;
	ew : out std_logic;
	ssrc1 : out std_logic; -- multiplexer
	ssrc2 : out std_logic_vector(1 downto 0); -- multiplexer
	asrc1 : out std_logic; -- multiplexer
    asrc2 : out std_logic_vector(2 downto 0); -- multiplexer
	rew : out std_logic;
	fset : out std_logic;
	typec : out std_logic_vector(1 downto 0); -- mode for shifter
	
	d_wr, d_rd : out std_logic;
	trans : out std_logic_vector(1 downto 0)
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
----------------------------------------------------------

--------------INSCD---------------
-- 000 -> DP Imm
-- 001 -> DP shift imm
-- 010 -> DP shift reg
-- 011 -> MUL, MLA
-- 100 -> Halfword DT ( I(22) is assumed to be 0, not 1)
-- 101 -> DT Imm
-- 110 -> DT Reg
-- 111 -> B, BL
-----------------------------


architecture Behavioral of MainControl is

begin
	process (ins,state,inscd,p)
	begin
		DType <= "01";

		case state is
			when "0000" => 
				pw <= '1';
				iord <= '0';
				mr <= '1';
				iw <= '1';
				asrc1 <= '0';
				asrc2 <= "001";
				mw <= '0';
				aw <= '0';
				bw <= '0';
				cw <= '0';
				rw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";	
				--------------------
			when "0001" =>
				rsrc1 <= '0';
				rsrc2 <= "00";
				aw <= '1';
				bw <= '1';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				rw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";					
				---------------------
			when "0010" =>
				rsrc1 <= '1';
				rsrc2 <= "00";
				aw <= '1';
				bw <= '1';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				rw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";				
				--------------------
			when "0011" =>
				rsrc2 <= "01";
				cw <= '1';
				aw <= '0';
				bw <= '0';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				rw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";				
				--------------------
			when "0100" =>
				ew <= '1';

				if (inscd = "000") then
					ssrc1 <= '1';
					ssrc2 <= "11";
					typec <= "11"; --ror
				elsif (inscd = "001" or inscd = "110") then
					ssrc1 <= '0';
					ssrc2 <= "10";
					typec <= ins(6 downto 5); --from ins
				elsif (inscd = "010") then
					ssrc1 <= '0';
					ssrc2 <= "00";
					typec <= ins(6 downto 5); --from ins
				elsif (inscd = "100") then
					ssrc1 <= '0';
					ssrc2 <= "11";  ---this is done bcoz in this case no shift is required and also 11-8 is 0 and option "11" adds 0 at its end. Thus effective shift is 0
					typec <= "11";
				end if;
				aw <= '0';
				bw <= '0';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				rw <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";				
				--------------------
			when "0101" =>
				rew <= '1';
				asrc1 <= '1';
				fset <= p;
				rsrc2 <= "10";
				
				aw <= '0';
				bw <= '1';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				rw <= '0';
				ew <= '0';
				dw <= '0';

				if (inscd = "000" or inscd ="001" or inscd = "010" or inscd = "100" or inscd = "110") then
					asrc2 <= "000";
				elsif (inscd = "011") then
					asrc2 <= "010";
				elsif (inscd = "101") then
					asrc2 <= "011";
				end if;
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";
				--------------------
			when "0110" =>
				wsrc <= "00";
				m2r <= "01";
				rw <= p;

				aw <= '0';
				bw <= '0';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";
                -----------------------------				
			when "0111" =>
				wsrc <= "11";
				m2r <= "01";
				rw <= p;

				aw <= '0';
				bw <= '0';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";
                --------------------------				
			when "1000" =>
				iord <= '1';
				mw <= '0';
				opco <= "000";
				offset <= "00";
				
                d_wr <= '1';
                d_rd <= '0';
                trans <= "10";
                
				mr <= '0';
				aw <= '0';
				bw <= '0';
				pw <= '0';
				iw <= '0';
				cw <= '0';
				rw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				---------------------------
			when "1001" =>
				iord <= '1';
				mr <= '1';
				dw <= '1';
				opco <= "001";
				offset <= "00";
                
                d_wr <= '0';
                d_rd <= '1';
                trans <= "10";
                
				aw <= '0';
				bw <= '0';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				rw <= '0';
				ew <= '0';
				rew <= '0';
			-------------------------------	
			when "1110" =>
			    aw <= '0';
                bw <= '0';
                pw <= '0';
                iw <= '0';
                mw <= '0';
                cw <= '0';
                rw <= '0';
                ew <= '0';
                rew <= '0';
                trans <= "00";		     
			 -------------------------------    
			when "1010" =>
				wsrc <= "00";
				m2r <= "00";
				rw <= p;

				aw <= '0';
				bw <= '0';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";				
				-----------------------
			when "1011" =>
				wsrc <= "01";
				m2r <= "10";
				if (ins(24) = '1') then
					rw <= '1';
				else 
					rw <= '0';
				end if;

				aw <= '0';
				bw <= '0';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";
                --------------------------------				
			when "1100" =>
				if (ins(24) = '1') then
					pw <= '1';
				elsif (ins(24) = '0') then
					pw <= p;
				end if;
				asrc1 <= '0';
				asrc2 <= "100";

				aw <= '0';
				bw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				rw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";
                ----------------------
			when others => 
				mr <= '1';

				aw <= '0';
				bw <= '0';
				pw <= '0';
				iw <= '0';
				mw <= '0';
				cw <= '0';
				rw <= '0';
				ew <= '0';
				rew <= '0';
				dw <= '0';
				d_wr <= '0';
                d_rd <= '0';
                trans <= "00";
                -------------------------
		end case;
	end process;

end Behavioral;