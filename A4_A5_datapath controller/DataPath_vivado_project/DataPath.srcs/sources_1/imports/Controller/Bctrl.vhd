library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Bctrl is

port(   cond : in std_logic_vector(3 downto 0);
		flags : in std_logic_vector(3 downto 0);
		p : out std_logic
);

end entity;

architecture Behavioral of Bctrl is
begin

process(cond,flags)
begin
	case cond is
	when "0000" => if flags(2) = '1' then p <= '1'; else p <= '0'; end if;
	when "0001" => if flags(2) = '0' then p <= '1'; else p <= '0'; end if;
	when "0010" => if flags(1) = '1' then p <= '1'; else p <= '0'; end if;
	when "0011" => if flags(1) = '0' then p <= '1'; else p <= '0'; end if;
	when "0100" => if flags(3) = '1' then p <= '1'; else p <= '0'; end if;
	when "0101" => if flags(2) = '0' then p <= '1'; else p <= '0'; end if;
	when "0110" => if flags(0) = '1' then p <= '1'; else p <= '0'; end if;
	when "0111" => if flags(0) = '0' then p <= '1'; else p <= '0'; end if;
	when "1000" => if ((flags(1) = '1') and (flags(2) = '0')) then p <= '1'; else p <= '0'; end if;
	when "1001" => if ((flags(1) = '0') or (flags(2) = '1')) then p <= '1'; else p <= '0'; end if;
	when "1010" => if (flags(3) = flags(2)) then p <= '1'; else p <= '0'; end if;
	when "1011" => if (flags(3) = not flags(2)) then p <= '1'; else p <= '0'; end if;
	when "1100" => if ((flags(3) = flags(2)) and (flags(2) = '0')) then p <= '1'; else p <= '0'; end if;
	when "1101" => if ((flags(3) = not flags(2)) or (flags(2) = '1')) then p <= '1'; else p <= '0'; end if;
	when "1110" => p <= '1';
	when others => null;
	end case;
end process;

end architecture;