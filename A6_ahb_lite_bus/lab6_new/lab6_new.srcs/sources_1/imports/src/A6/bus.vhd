library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity buss is
port(	clk,reset: in std_logic;
		switch: in std_logic_vector(15 downto 0);
		led: out std_logic_vector(15 downto 0);
		cathode: out std_logic_vector(6 downto 0);
		anode: out std_logic_vector(3 downto 0)
);
end entity;

architecture behav of buss is

component DC is
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
end component;

component decoder_bus is
port(	addr : in std_logic_vector(8 downto 0);
		hwrite : in std_logic;
		mem_select : out std_logic;
		sw_sel,led_sel : out std_logic
);
end component; 

component mux is
port (	x1,x2 : in std_logic_vector(31 downto 0);
		mem_select,sw_sel: in std_logic;
		x : out std_logic_vector(31 downto 0)
);
end component;

component mem_state is
port(	clk,reset : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		mem_select : in std_logic;
		outState : out std_logic_vector(2 downto 0)
);
end component; 

component mem is
port(	clk, reset : in std_logic;
		
		state : in std_logic_vector(2 downto 0);
		hwrite : in std_logic;
		rd_en : in std_logic;
		mem_select : in std_logic;
		hwdata : in std_logic_vector(31 downto 0);
		haddr : in std_logic_vector(8 downto 0);
		
		hready : out std_logic;
		hrdata : out std_logic_vector(31 downto 0)
);
end component;

component switches is
port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel,rd_en : in std_logic;
		
		in_data : in std_logic_vector(15 downto 0); -- will be mapped to switches on the board
        
        hready : out std_logic;		
		hrdata : out std_logic_vector(15 downto 0)
);
end component;

component output is
port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel,wr_en : in std_logic;
		hwdata : in std_logic_vector(15 downto 0);
		
		hready : out std_logic;
        out_data : out std_logic_vector(15 downto 0) -- will be mapped to leds
);
end component;

component ssd is
port (  clk : in std_logic;
        hwdata : in std_logic_vector(15 downto 0);
        anode : out std_logic_vector(3 downto 0);
        cathode : out std_logic_Vector(6 downto 0)  
);
end component;


--wr_en = hwrite

signal temp : std_logic_vector(15 downto 0);
signal hready,rd_en,wr_en,hwrite : std_logic;
signal htrans : std_logic_vector(1 downto 0);
signal hrdata : std_logic_vector(31 downto 0):=(others => '0');
signal hwdata : std_logic_vector(31 downto 0);
signal haddr : std_logic_vector(8 downto 0);
signal mem_select,sw_sel,led_sel : std_logic;
signal state : std_logic_vector(2 downto 0);

signal hrdata1,hrdata2 : std_logic_vector(31 downto 0);
signal hready1,hready2,hready3 : std_logic;

signal temp_led : std_logic_vector(15 downto 0);

begin

	master: DC port map(clk,reset,temp,hready,hwrite,rd_en,htrans,hrdata,hwdata,haddr); 

	decode: decoder_bus port map(haddr,hwrite,mem_select,sw_sel,led_sel); 

	memory_state: mem_state port map(clk,reset,htrans,mem_select,state);

	memory: mem port map(clk,reset,state,hwrite,rd_en,mem_select,hwdata,haddr,hready1,hrdata1);	

	swit: switches port map(clk,htrans,sw_sel,rd_en,switch,hready2,hrdata2(15 downto 0));

	multi: mux port map(hrdata1,hrdata2,mem_select,sw_sel,hrdata);

	hready <= hready1 or hready2 or hready3;

	outp: output port map(clk,htrans,led_sel,hwrite,hwdata(15 downto 0),hready3,temp_led);

    led <= temp_led;

    ssdd : ssd port map(clk,temp_led,anode,cathode);

end behav;
