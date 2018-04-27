library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DC is

port(
        clk : in std_logic;
        reset: in std_logic;
        reg_out : out std_logic_vector(15 downto 0);
        -------------------------------------------
        ready : in std_logic;
        d_wr, d_rd : out std_logic;
        trans : out std_logic_vector(1 downto 0);
        -------------------------------------------
        rd_data : in std_logic_vector(31 downto 0);
        wr_data : out std_logic_vector(31 downto 0);        
        addr : out std_logic_vector(8 downto 0)
        
        );
        
end entity;

architecture Behavioral of DC is

component Datapath is
port (
        clk, pc_reset : in std_logic;
        ---------------------------------------------------------------
		pw : in std_logic;
		iord : in std_logic; -- multiplexer for instruction read or data write
		mr : in std_logic;
		mw : in std_logic;
		offset : in std_logic_vector(1 downto 0);  --for PM path
		DType : in std_logic_vector(1 downto 0);  --for PM path
		opco : in std_logic_vector(2 downto 0);  -- for PM path
		iw : in std_logic;
		dw : in std_logic;
		rsrc1 : in std_logic;
		rsrc2 : in std_logic_vector(1 downto 0); -- multiplexer for 2nd operand
		wsrc : in std_logic_vector(1 downto 0); -- multiplexer for write addr, pc, lrfrom
		m2r : in std_logic_vector(1 downto 0); -- multiplexer for data to write...from memory or ALU  
		rw : in std_logic;
		aw : in std_logic;
		bw : in std_logic;
		cw : in std_logic;
		ew : in std_logic;
		ssrc1 : in std_logic; -- multiplexer
		ssrc2 : in std_logic_vector(1 downto 0); -- multiplexer
		asrc1 : in std_logic; -- multiplexer
        asrc2 : in std_logic_vector(2 downto 0); -- multiplexer
		rew : in std_logic;
		fset : in std_logic;
		op : in std_logic_vector(3 downto 0);
		typec : in std_logic_vector(1 downto 0); -- mode for shifter
		ins_toC : out std_logic_vector(31 downto 0);
		F_out : out std_logic_vector(3 downto 0);
		reg_out : out std_logic_vector(31 downto 0);
		rd_data : in std_logic_vector(31 downto 0);
        wr_data : out std_logic_vector(31 downto 0);        
        addr : out std_logic_vector(8 downto 0)
	 );
end component;

component Controller is

port (
		ins : in std_logic_vector(31 downto 0);
		clk : in std_logic;
		flags : in std_logic_vector(3 downto 0);
		--------------------------------------------
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
		op : out std_logic_vector(3 downto 0);
		typec : out std_logic_vector(1 downto 0); -- mode for shifter;
		-----------------------------------------------------------------	
		ready : in std_logic;
        d_wr, d_rd : out std_logic;
        trans : out std_logic_vector(1 downto 0)
	);
end component;

signal pw_tmp : std_logic;
signal iord_tmp : std_logic; -- multiplexer for outstruction read or data write
signal mr_tmp : std_logic;
signal mw_tmp :  std_logic;
signal offset_tmp :std_logic_vector(1 downto 0);  --for PM path
signal DType_tmp : std_logic_vector(1 downto 0);  --for PM path
signal opco_tmp : std_logic_vector(2 downto 0);  -- for PM path
signal iw_tmp :  std_logic;	
signal dw_tmp :  std_logic;
signal rsrc1_tmp : std_logic;
signal rsrc2_tmp :  std_logic_vector(1 downto 0); -- multiplexer for 2nd operand
signal wsrc_tmp :  std_logic_vector(1 downto 0); -- multiplexer for write addr, pc, lr
signal m2r_tmp :  std_logic_vector(1 downto 0); -- multiplexer for data to write...from memory or ALU  
signal rw_tmp :  std_logic;
signal aw_tmp :  std_logic;
signal bw_tmp :  std_logic;
signal cw_tmp :  std_logic;
signal ew_tmp :  std_logic;
signal ssrc1_tmp :  std_logic; -- multiplexer
signal ssrc2_tmp :  std_logic_vector(1 downto 0); -- multiplexer
signal asrc1_tmp :  std_logic; -- multiplexer
signal asrc2_tmp :  std_logic_vector(2 downto 0); -- multiplexer
signal rew_tmp :  std_logic;
signal fset_tmp :  std_logic;
signal op_tmp :  std_logic_vector(3 downto 0);
signal typec_tmp :  std_logic_vector(1 downto 0); -- mode for shifter

signal ins_toC_tmp : std_logic_vector(31 downto 0);
signal F_out_tmp : std_logic_vector(3 downto 0);
signal reg_out_tmp : std_logic_vector(31 downto 0);

begin
    
Ctrl : Controller port map (ins_toC_tmp,clk,F_out_tmp,pw_tmp,iord_tmp,mr_tmp,mw_tmp,offset_tmp,DType_tmp,opco_tmp,iw_tmp,dw_tmp,rsrc1_tmp,rsrc2_tmp,wsrc_tmp,m2r_tmp,rw_tmp,aw_tmp,bw_tmp,cw_tmp,ew_tmp,ssrc1_tmp,ssrc2_tmp,asrc1_tmp,asrc2_tmp,rew_tmp,fset_tmp,op_tmp,typec_tmp,ready,d_wr,d_rd,trans);
DP : Datapath port map (clk,reset,pw_tmp,iord_tmp,mr_tmp,mw_tmp,offset_tmp,DType_tmp,opco_tmp,iw_tmp,dw_tmp,rsrc1_tmp,rsrc2_tmp,wsrc_tmp,m2r_tmp,rw_tmp,aw_tmp,bw_tmp,cw_tmp,ew_tmp,ssrc1_tmp,ssrc2_tmp,asrc1_tmp,asrc2_tmp,rew_tmp,fset_tmp,op_tmp,typec_tmp,ins_toC_tmp,F_out_tmp,reg_out_tmp,rd_data,wr_data,addr);

reg_out <= "11" & reg_out_tmp(13 downto 0);
    
end Behavioral;