library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bus is
port(	clk,reset: in std_logic;
		size : in std_logic_vector(3 downto 0);
		address : in std_logic_vector(11 downto 0);
		data : in std_logic_vector(31 downto 0);
		wr : in std_logic
		out_data : out std_logic_vector(31 downto 0)
);
end entity;

architecture behav of bus

component master is
port(	clk, hreset : in std_logic;
		hready : in std_logic;
		hrdata : in std_logic_vector(31 downto 0);
		
		wr : in std_logic;
		state : in std_logic_vector(3 downto 0);
		size : in std_logic_vector(3 downto 0)
		address : in std_logic_vector(12 downto 0);
		out_data : out std_logic_vector(31 downto 0);

		hwdata : in std_logic_vector(31 downto 0);

		hwrite : out std_logic;
		hsize : out std_logic_vector(3 downto 0);
		haddr : out std_logic_vector(11 down to 0);
		htrans : out std_logic(1 downto 0)
);
end component; 

component master_state is
port(	clk,reset : in std_logic;
		mem_sel : in std_logic;
		port0,port1,port2,port3 : in std_logic;
		outState : out std_logic_vector(3 downto 0)
);
end component; 

component decoder is
port(	addr : in std_logic_vector(11 downto 0);
		mem_select,io : out std_logic;
		port0,port1,port2,port3 : out std_logic
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
		
		hready : out std_logic;
		hrdata : out std_logic_vector(31 downto 0);
		
		state : in std_logic_vector(2 downto 0);
		in_data : in std_logic_vector(31 downto 0);
		addr : out std_logic_vector(11 downto 0);
		wr : out std_logic;
		size : out std_logic_vector(3 downto 0); 
		out_data : out std_logic_vector(31 downto 0);

		hwrite : in std_logic;
		hwdata : in std_logic_vector(31 downto 0);
		hsize : in std_logic_vector(3 downto 0);
		haddr : in std_logic_vector(11 down to 0);
		htrans : in std_logic(1 downto 0)
);
end component; 

component switches is
port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel,hwrite : in std_logic;
		in_data : in std_logic_vector(15 downto 0);
		hrdata : out std_logic_vector(15 downto 0)
);
end component;

component led is
port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel,hwrite : in std_logic;
		hwdata : in std_logic_vector(15 downto 0);
		out_data : out std_logic_vector(15 downto 0)
);
end component;

component position is
port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel : in std_logic;
		anode : out std_logic_vector(3 downto 0)
);
end component;

entity pattern is
port(	clk : in std_logic;
		htrans : in std_logic_vector(1 downto 0);
		port_sel : in std_logic;
		num : in std_logic_vector(3 downto 0);
		cathode : out std_logic_vector(6 downto 0)
);
end entity;

begin

	decode : decoder port map(address,mem_sel,io,port0,port1,port2,port3); 

	mast_st : master_state port map(clk,reset,mem_sel,port0,port1,port2,port3,ms_state);

	mast : master port map(clk,reset,hready,hrdata,wr,ms_state,size,address,out_data,data,hwrite,hsize,haddr,htrans);	

	mem_st : mem_state port map(clk,reset,htrans,mem_sel,memory_state);

	memory : mem port map(clk,reset,hready,hrdata,memory_state,in_data,mem_addr,mem_wr,mem_size,mem_out_data,hwrite,hwdata,hsize,haddr,htrans);;

	led1 : led port map(clk,htrans,port1,hwrite,hwdata,outdat);

	swit : switches port map(clk,htrans,port0,hwrite,in_data,hrdata);

	pos : position port map(clk,htrans,port2,anode);

	pat : pattern port map(clk,htrans,port3,num,cathode);

end behav;
