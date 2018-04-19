----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/12/2018 02:18:48 PM
-- Design Name: 
-- Module Name: shifter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifter is
    Port ( operand : in STD_LOGIC_VECTOR (31 downto 0);
           typec : in STD_LOGIC_VECTOR (1 downto 0);
           amount : in STD_LOGIC_VECTOR (4 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0);
           C: out std_logic);
end shifter;

architecture Behavioral of shifter is
signal one,zero:std_logic_vector(31 downto 0);
signal temp:std_logic_vector(31 downto 0);
begin
one<=(others=>'1');
zero<=(others=>'0');
---   00  => LSL
---   01 => LSR
---   10 =>
process(typec,amount,operand,zero,one)
variable amt:natural;
begin
amt:= to_integer(unsigned(amount(4 downto 0)));
case (typec) is
when "00" => if amt>0 then
            temp<=operand(31-amt downto 0)&zero(amt-1 downto 0);
            C<=operand(32-amt);
            else 
            temp<=operand;
             C<='0';
            end if;
when "01" =>if amt>0 then
             temp<=zero(amt-1 downto 0)&operand(31 downto amt);
            C<=operand(amt-1);
            else
             temp<=operand;
             C<='0';
             end if;
when "10" =>if amt>0 then
            if(operand(31)='0') then 
            temp<=zero(amt-1 downto 0)&operand(31 downto amt);
            C<=operand(amt-1);
            else
            temp<=one(amt-1 downto 0)&operand(31 downto amt);
            end if;
            else
            temp<=operand;
            C<='0';
            end if;
when "11" => if amt>0 then 
             temp<=operand(amt-1 downto 0)&operand(31 downto amt);
             C <= operand(amt - 1);
             else
             temp <= operand;
             C<='0';
             end if;
when others =>null;
            
end case;
end process;
result<=temp;
end Behavioral;
