library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Datapath is
port (
        clk, pc_reset : in std_logic;
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
		wsrc : in std_logic_vector(1 downto 0); -- multiplexer for write addr, pc, lr
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
		-----------------------------------------------
		ins_toC : out std_logic_vector(31 downto 0);
		F_out : out std_logic_vector(3 downto 0);
		reg_out : out std_logic_vector(31 downto 0);
		------------------------------------------------
		rd_data : in std_logic_vector(31 downto 0);
        wr_data : out std_logic_vector(31 downto 0);        
        addr : out std_logic_vector(8 downto 0)
	 );

end Datapath;

architecture Behavioral of Datapath is

------------components----------------------------
component Shifter is 
 port (
 	operand: in std_logic_vector(31 downto 0);
 	typec : in std_logic_vector(1 downto 0);
 	amount : in std_logic_vector(4 downto 0);
 	result : out std_logic_vector(31 downto 0);
 	C : out std_logic
 	);
 end component;

component ALU is
    port ( operand1,operand2 : in std_logic_vector (31 downto 0);
            opcode : in std_logic_vector(3 downto 0);
           result : out std_logic_vector (31 downto 0);
           C_curr: in std_logic;
           N_new,Z_new,C_new,V_new : out std_logic     
         );
end component;

component Multiplier is
    port( operand1, operand2 : in std_logic_vector(31 downto 0);
    	result : out std_logic_vector(31 downto 0));
 end component;

component regF is
    port(wr_data: in signed(31 downto 0);
    rd_addr1,rd_addr2,wr_addr : in unsigned(3 downto 0);
    clk,reset,wr_en : in std_logic;
    rd_data1,rd_data2 : out signed(31 downto 0);
    pc : out unsigned(31 downto 0)
);
end component;

component PMpath is
	port(
		fromP, fromM : in std_logic_vector(31 downto 0);
		DType : in std_logic_vector(1 downto 0); -- 00 or 11
		opco : in std_logic_vector(2 downto 0); -- from controller, 0BL for DType 00 and SHL for DType 
		offset : in std_logic_vector(1 downto 0);
		wr_en : out std_logic_vector(3 downto 0);
		toP, toM : out std_logic_vector(31 downto 0)
		); 
end component;

component Memory is 
port (
        clk : in std_logic;
		operand : in std_logic_vector(31 downto 0);
		addr : in std_logic_vector(8 downto 0); -- 4 kilobytes memory, i.e 2^12
		wr_en : in std_logic;
		result : out std_logic_vector(31 downto 0)
	);
end component;

component mux_2_1 is
	port ( operand1,operand2: in std_logic_vector(31 downto 0);
		   sel: in std_logic;
		   result: out std_logic_vector(31 downto 0)
		);
end component;

component mux_4_1 is
	port ( operand1,operand2,operand3,operand4: in std_logic_vector(31 downto 0);
		   sel: in std_logic_vector(1 downto 0);
		   result: out std_logic_vector(31 downto 0)
		);
end component;
component mux_3_1 is
	port ( operand1,operand2,operand3: in std_logic_vector(31 downto 0);
		   sel: in std_logic_vector(1 downto 0);
		   result: out std_logic_vector(31 downto 0)
		);
end component;

component mux_2_1_4bit is
	port ( operand1,operand2: in std_logic_vector(3 downto 0);
		   sel: in std_logic;
		   result: out std_logic_vector(3 downto 0)
		);
end component;

component mux_4_1_4bit is
	port ( operand1,operand2,operand3,operand4: in std_logic_vector(3 downto 0);
		   sel: in std_logic_vector(1 downto 0);
		   result: out std_logic_vector(3 downto 0)
		);
end component;

component mux_3_1_4bit is
	port ( operand1,operand2,operand3: in std_logic_vector(3 downto 0);
		   sel: in std_logic_vector(1 downto 0);
		   result: out std_logic_vector(3 downto 0)
		);
end component;

component mux_4_1_5bit is
	port ( operand1,operand2,operand3,operand4: in std_logic_vector(4 downto 0);
		   sel: in std_logic_vector(1 downto 0);
		   result: out std_logic_vector(4 downto 0)
		);
end component;

component writer is
	port ( inp_val, current: in std_logic_vector(31 downto 0);
		   en : in std_logic;
		   result: out std_logic_vector(31 downto 0)
		);
end component;

component pc_writer is
	port ( clk : in std_logic;
	       inp_val, current: in std_logic_vector(31 downto 0);
		   en,reset : in std_logic;
		   result: out std_logic_vector(31 downto 0)
		);
end component;

component writer_4bit is
	port ( inp_val, current: in std_logic_vector(3 downto 0);
		   en : in std_logic;
		   result: out std_logic_vector(3 downto 0)
		);
end component;

component mux_5_1 is
	port ( operand1,operand2,operand3,operand4,operand5: in std_logic_vector(31 downto 0);
		   sel: in std_logic_vector(2 downto 0);
		   result: out std_logic_vector(31 downto 0)
		);
end component;
------------components----------------------------

----------------------------------------------------------------------

-----------------signals--------------------------
--These signals are defined as #From 'a component' and #To 'a component'.
--For example, FromPC and ToPC
--Multiplexers are labelled as M1,M2,M3,M4,M5 starting from left to right, M5 being the 4x1 MUX

signal IR, DR, A, B, C, E, RES : std_logic_vector(31 downto 0);
signal PC : std_logic_vector(31 downto 0) := (others=> '0');
signal F : std_logic_vector(3 downto 0); -- has the flags VCZN

signal mem_in1: std_logic_vector(31 downto 0); -- the other input being 
signal mem_inf : std_logic_vector(8 downto 0);

signal rad1_in,rad2_in, wad_in : std_logic_vector(3 downto 0);
signal wd_in : std_logic_vector(31 downto 0);
signal rd1_out, rd2_out, PC_in : std_logic_vector(31 downto 0);
signal rd1_outt, rd2_outt : signed(31 downto 0);
signal PC_inn : unsigned(31 downto 0);

signal ssrc1_in2 : std_logic_vector(31 downto 0);
signal ssrc2_in2 : std_logic_vector(4 downto 0) := "00010";
signal ssrc2_in4 : std_logic_vector(4 downto 0);

-------------------for PM path
signal en_out : std_logic_vector(3 downto 0);
signal m2r_in1, BRAM_din : std_logic_vector(31 downto 0);
-------------------

signal shifter_in1: std_logic_vector(31 downto 0);
signal shifter_in2 : std_logic_vector(4 downto 0);
signal shifter_out : std_logic_vector(31 downto 0);
signal C_dump : std_logic;

signal mul_out : std_logic_vector(31 downto 0);
signal asrc2_in2 : std_logic_vector(31 downto 0) := "00000000000000000000000000000100"; --4, in1 is from shifter,in3 is from multiplier
signal alu_in1, alu_in2 : std_logic_vector(31 downto 0); -- ALU signals
signal alu_out : std_logic_vector(31 downto 0) := (others=> '0');
signal F_in : std_logic_vector(3 downto 0);

signal dout : std_logic_vector(31 downto 0); ---to be used to input to DR and IR
signal bram_en : std_logic;

signal asrc2_in4 : std_logic_vector(31 downto 0);
signal res_in : std_logic_vector(31 downto 0);
signal asrc_in5 : std_logic_vector(31 downto 0);

-----------------signals--------------------------


begin

--PC <= (others => '0');
--PC <= (others => '0') when (pc_reset = '1') ;

ssrc1_in2 <= "000000000000000000000000"&IR(7 downto 0);
ssrc2_in4 <= IR(11 downto 8)&'0';

asrc2_in4(31 downto 12) <= (others => IR(11));
asrc2_in4(11 downto 0) <= IR(11 downto 0);

asrc_in5 <= ("000000" & IR(23 downto 0) & "00") + "00000000000000000000000000000100";

bram_en <= mr OR mw;

PC_write : pc_writer port map (clk,alu_out,PC,pw,pc_reset,PC);
IORD_mux : mux_2_1 port map(PC,RES,iord,mem_in1);


PMP : PMpath port map(B,DR,DType,opco,offset,en_out,m2r_in1,BRAM_din);
M2r_mux : mux_3_1 port map(m2r_in1,RES,PC,m2r,wd_in);

mem_inf <= "00" & mem_in1(8 downto 2);
MEM : memory port map (clk,BRAM_din,mem_inf,bram_en,dout);

IR_write : writer port map (dout,IR,iw,IR);

-----------------------------------------------------------------------
DR_write : writer port map (rd_data, DR, dw, DR);  --read data into DR
addr <= RES(8 downto 0);  -- read/write data from RES
wr_data <= B; -- write data in mem from B
-----------------------------------------------------------------------

Rsrc1_mux : mux_2_1_4bit port map(IR(19 downto 16),IR(15 downto 12),rsrc1,rad1_in);
Rsrc2_mux : mux_3_1_4bit port map (IR(3 downto 0),IR(11 downto 8),IR(15 downto 12), rsrc2, rad2_in);
Wsrc_mux : mux_4_1_4bit port map (IR(15 downto 12),"1110","1111",IR(19 downto 16),wsrc,wad_in);

---------------------------------------------------------------------------------------------------------
Reg : regF port map (signed(wd_in),unsigned(IR(19 downto 16)), unsigned(rad2_in), unsigned(wad_in),clk,pc_reset,rw,rd1_outt,rd2_outt,PC_inn); --changes required
----------------------------------------------------------------------------------------------------------
rd1_out <= std_logic_vector(rd1_outt);
rd2_out <= std_logic_vector(rd2_outt);
PC_in <= std_logic_vector(PC_inn);

A_write : writer port map (rd1_out,A,aw,A);
B_write : writer port map (rd2_out,B,bw,B);                                              
C_write : writer port map (rd2_out,C,cw,C);

Mult : Multiplier port map(B,C,mul_out);

Ssrc1_mux : mux_2_1 port map (B,ssrc1_in2,ssrc1,shifter_in1);
Sscr2_mux : mux_4_1_5bit port map (E(4 downto 0),ssrc2_in2,IR(11 downto 7),ssrc2_in4,ssrc2,shifter_in2);

Shift : Shifter port map (shifter_in1,typec,shifter_in2,shifter_out,C_dump);
E_write : writer port map (shifter_out,E,ew,E);

Asrc1_mux : mux_2_1 port map(PC,A,Asrc1,alu_in1);
Asrc2_mux : mux_5_1 port map(E,asrc2_in2,mul_out,asrc2_in4,asrc_in5,asrc2,alu_in2);
ALUz : ALU port map(alu_in1,alu_in2,op,alu_out,F(2),F_in(0),F_in(1),F_in(2),F_in(3));
F_write : writer_4bit port map(F_in,F,fset,F);

RES_write : writer port map(alu_out, RES, rew, RES);	

F_out <= F;
ins_toC <= IR;
reg_out <= PC_in;

end architecture;