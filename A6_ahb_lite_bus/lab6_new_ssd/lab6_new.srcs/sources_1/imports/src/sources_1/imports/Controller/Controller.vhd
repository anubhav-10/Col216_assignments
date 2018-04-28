library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Controller is

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
		typec : out std_logic_vector(1 downto 0); -- mode for shifter
		-----------------------------------------------------------------
		ready : in std_logic;
		d_wr, d_rd : out std_logic;
		trans : out std_logic_vector(1 downto 0)
		-----------------------------------------------------------------		
	);

end entity;


architecture Behavioral of Controller is

component Actrl is 
port(state : in std_logic_vector(3 downto 0);
	ins: in std_logic_vector(31 downto 0);
	inscd : in std_logic_vector(2 downto 0);
	op : out std_logic_vector(3 downto 0)
);
end component;

component Bctrl is
port(   cond : in std_logic_vector(3 downto 0);
		flags : in std_logic_vector(3 downto 0);
		p : out std_logic
);

end component;

component Decoder is 
port(ins: in std_logic_vector(31 downto 0);
	inscd : out std_logic_vector(2 downto 0)
);
end component;

component MainControl is

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

end component;

component NextState is

port(ins : in std_logic_vector(31 downto 0);
	inscd : in std_logic_vector (2 downto 0);
	clk : in std_logic;
	ready : in std_logic;
	outState : out std_logic_vector(3 downto 0)
);

end component; 


signal ins_copy : std_logic_vector(31 downto 0);
signal inscd : std_logic_vector(2 downto 0);
signal state : std_logic_vector(3 downto 0);
signal p : std_logic;

begin

ins_copy <= ins;

Decode : Decoder port map (ins_copy,inscd);

States : NextState port map (ins_copy,inscd,clk,ready,state);

Acontrol : Actrl port map (state,ins_copy,inscd,op);

Bcontrol : Bctrl port map (ins_copy(31 downto 28),flags,p);

MC : MainControl port map (ins_copy,state,inscd,p,pw,iord,mr,mw,offset,Dtype,opco,iw,dw,rsrc1,rsrc2,wsrc,m2r,rw,aw,bw,cw,ew,ssrc1,ssrc2,asrc1,asrc2,rew,fset,typec,d_wr,d_rd,trans);


end Behavioral;