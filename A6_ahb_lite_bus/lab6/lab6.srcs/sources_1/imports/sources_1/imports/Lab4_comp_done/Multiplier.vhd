library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Multiplier is
    port( operand1, operand2 : in std_logic_vector(31 downto 0);
    	result : out std_logic_vector(31 downto 0));
 end Multiplier;

architecture Behavioral of Multiplier is
signal t: std_logic_vector(63 downto 0);
	begin
		t <= std_logic_vector(signed(operand1) * signed(operand2));
		result<= t(31 downto 0);
end Behavioral;