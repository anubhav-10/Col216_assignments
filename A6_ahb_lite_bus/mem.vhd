library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mem is
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

end entity; 

--htrans
--00 -> idle
--10 -> non seq

--state
--000 -> address phase
--001 -> wait 1
--010 -> wait 2
--011 -> wait 3
--111 -> default

architecture behav of mem is

	signal addr_temp : std_logic_vector(11 downto 0);
	signal temp_ready,temp_write : std_logic;
	signal size_temp : std_logic_vector(3 downto 0);
	signal temp_data : std_logic_vector(31 downto 0);

begin
	process(state)
	begin

		case state is
			when "000" =>
				addr_temp <= haddr;
				temp_ready <= '0';
				temp_write <= hwrite;
				size_temp <= hsize;
			when "001" =>
				temp_hready <='0';
			when "010" =>
				temp_hready <='0';
			when "011" =>
				temp_ready <='1';
				if(hwrite ='1') then
					temp_data <= in_data;
				else 
					temp_data <= hwdata;	
				end if;
		end case;
	end process;

	hready <= temp_ready;
	hrdata <= temp_data;
	addr <= addr_temp;
	wr <= temp_write;
	size <= size_temp;
	out_data <= temp_data;

end behav;