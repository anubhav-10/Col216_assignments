library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity master is
port(	clk, hreset : in std_logic;
		hready : in std_logic;
		hrdata : in std_logic_vector(31 downto 0);
		
		wr : in std_logic;
		state : in std_logic_vector(3 downto 0);
		size : in std_logic_vector(3 downto 0);
		address : in std_logic_vector(11 downto 0);
		in_data : in std_logic_vector(31 downto 0);

		hwdata : out std_logic_vector(31 downto 0);
		hwrite : out std_logic;
		hsize : out std_logic_vector(3 downto 0);
		haddr : out std_logic_vector(11 downto 0);
		htrans : out std_logic_vector(1 downto 0)
);

end entity; 
--htrans
--00 -> idle
--10 -> non seq

--state
--0000 -> address phase
--0001 -> wait 1
--0010 -> wait 2
--0011 -> wait 3
--0100 -> switches
--0101 -> led
--0110 -> position
--0111 -> pattern
--1111 -> default

architecture behav of master is

	signal trans_temp : std_logic_vector(1 downto 0);
	signal addr_temp : std_logic_vector(11 downto 0);
	signal temp_write,temp_ready : std_logic;
	signal size_temp : std_logic_vector(3 downto 0);
	signal temp_data : std_logic_vector(31 downto 0);

begin
	process(state,wr,size,address,hrdata,in_data)
	begin
		case state is 

			when "0000" =>
				if(wr='0') then
					addr_temp <= address;
					trans_temp <= "10";
					temp_write <= '0';
					size_temp <= size;
				else
					addr_temp <= address;
					trans_temp <= "10";
					temp_write <= '1';
					temp_data <= in_data;
					size_temp <= size;
				end if;

			when "0001" =>
				trans_temp <= "00";
				temp_ready <= '0';
			when "0010" =>
				trans_temp <= "00";
				temp_ready <= '0';
			when "0011" =>
				if (wr = '0') then
					trans_temp <= "00";
					temp_data <= hrdata;
					temp_ready <= '1';
				else
					trans_temp <= "00";
					temp_ready <= '1';
				end if;
			when "0100" =>
				trans_temp <= "00";
				temp_ready <= '1';
				temp_data <= hrdata;
			when "0101" =>
				trans_temp <= "00";
				temp_ready <= '1';
				temp_data <= in_data;
			when "0110" =>
				trans_temp <= "00";
				temp_ready <= '1';
				temp_data <= in_data;
			when "0111" =>
				trans_temp <= "00";
				temp_ready <= '1';
				temp_data <= in_data;
            when others => 
                temp_ready <= '0';
		end case;

		hwdata <= temp_data;
		hwrite <= temp_write;
--		hready <= temp_ready;
		hsize <= size_temp;
		htrans <= trans_temp;
		haddr <= addr_temp;

 	end process;
end behav;
