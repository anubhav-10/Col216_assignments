----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 20:59:38
-- Design Name: 
-- Module Name: shift - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shifter is
    Port ( operand : in STD_LOGIC_VECTOR (31 downto 0);
       typec : in STD_LOGIC_VECTOR (1 downto 0);
       amount : in STD_LOGIC_VECTOR (4 downto 0);
       result : out STD_LOGIC_VECTOR (31 downto 0);
       C: out std_logic);
end Shifter;

architecture Behavioral of Shifter is
signal temp,zero,one: std_logic_Vector(31 downto 0);
signal tempc: std_logic;
begin
  zero<= (others=>'0');
  one<= (others=>'1');
    process(operand,typec,amount,zero,one)
    begin
        case (typec) is
        when "00" =>    
            case (amount) is
            when "00000" =>
              temp<=operand;
              tempc<='0';
            when "00001" =>
              temp<=operand(30 downto 0)&zero(0);
              tempc<=operand(31);
            when "00010" =>
              temp<=operand(29 downto 0)&zero(1 downto 0);
              tempc<=operand(30);
            when "00011" =>
              temp<=operand(28 downto 0)&zero(2 downto 0);
              tempc<=operand(29);
            when "00100" =>
              temp<=operand(27 downto 0)&zero(3 downto 0);
              tempc<=operand(28);
            when "00101" =>
              temp<=operand(26 downto 0)&zero(4 downto 0);
              tempc<=operand(27);
            when "00110" =>
              temp<=operand(25 downto 0)&zero(5 downto 0);
              tempc<=operand(26);
            when "00111" =>
              temp<=operand(24 downto 0)&zero(6 downto 0);
              tempc<=operand(23);
            when "01000" =>
              temp<=operand(23 downto 0)&zero(7 downto 0);
              tempc<=operand(24);
            when "01001" =>
              temp<=operand(22 downto 0)&zero(8 downto 0);
              tempc<=operand(23);
            when "01010" =>
              temp<=operand(21 downto 0)&zero(9 downto 0);
              tempc<=operand(22);
            when "01011" =>
              temp<=operand(20 downto 0)&zero(10 downto 0);
              tempc<=operand(21);
            when "01100" =>
              temp<=operand(19 downto 0)&zero(11 downto 0);
              tempc<=operand(20);
            when "01101" =>
              temp<=operand(18 downto 0)&zero(12 downto 0);
              tempc<=operand(19);
            when "01110" =>
              temp<=operand(17 downto 0)&zero(13 downto 0);
              tempc<=operand(18);
            when "01111" =>
              temp<=operand(16 downto 0)&zero(14 downto 0);
              tempc<=operand(17);
            when "10000" =>
              temp<=operand(15 downto 0)&zero(15 downto 0);
              tempc<=operand(16);
            when "10001" =>
              temp<=operand(14 downto 0)&zero(16 downto 0);
              tempc<=operand(15);
            when "10010" =>
              temp<=operand(13 downto 0)&zero(17 downto 0);
              tempc<=operand(14);
            when "10011" =>
              temp<=operand(12 downto 0)&zero(18 downto 0);
              tempc<=operand(13);
            when "10100" =>
              temp<=operand(11 downto 0)&zero(19 downto 0);
              tempc<=operand(12);
            when "10101" =>
              temp<=operand(10 downto 0)&zero(20 downto 0);
              tempc<=operand(11);
            when "10110" =>
              temp<=operand(9 downto 0)&zero(21 downto 0);
              tempc<=operand(10);
            when "10111" =>
              temp<=operand(8 downto 0)&zero(22 downto 0);
              tempc<=operand(9);
            when "11000" =>
              temp<=operand(7 downto 0)&zero(23 downto 0);
              tempc<=operand(8);
            when "11001" =>
              temp<=operand(6 downto 0)&zero(24 downto 0);
              tempc<=operand(7);
            when "11010" =>
              temp<=operand(5 downto 0)&zero(25 downto 0);
              tempc<=operand(6);
            when "11011" =>
              temp<=operand(4 downto 0)&zero(26 downto 0);
              tempc<=operand(5);
            when "11100" =>
              temp<=operand(3 downto 0)&zero(27 downto 0);
              tempc<=operand(4);
            when "11101" =>
              temp<=operand(2 downto 0)&zero(28 downto 0);
              tempc<=operand(3);
            when "11110" =>
              temp<=operand(1 downto 0)&zero(29 downto 0);
              tempc<=operand(2);
            when "11111" =>
              temp<=operand(0)&zero(30 downto 0);
              tempc<=operand(1);
            when others => null;
          end case;

        when "01" =>    
            case (amount) is
            when "00000" =>
              temp<=operand;
              tempc<='0';
            when "00001" =>
              temp<=zero(0)&operand(31 downto 1);
              tempc<=operand(0);
            when "00010" =>
              temp<=zero(1 downto 0)&operand(31 downto 2);
              tempc<=operand(1);
            when "00011" =>
              temp<=zero(2 downto 0)&operand(31 downto 3);
              tempc<=operand(2);
            when "00100" =>
              temp<=zero(3 downto 0)&operand(31 downto 4);
              tempc<=operand(3);
            when "00101" =>
              temp<=zero(4 downto 0)&operand(31 downto 5);
              tempc<=operand(4);
            when "00110" =>
              temp<=zero(5 downto 0)&operand(31 downto 6);
              tempc<=operand(5);
            when "00111" =>
              temp<=zero(6 downto 0)&operand(31 downto 7);
              tempc<=operand(6);
            when "01000" =>
              temp<=zero(7 downto 0)&operand(31 downto 8);
              tempc<=operand(7);
            when "01001" =>
              temp<=zero(8 downto 0)&operand(31 downto 9);
              tempc<=operand(8);
            when "01010" =>
              temp<=zero(9 downto 0)&operand(31 downto 10);
              tempc<=operand(9);
            when "01011" =>
              temp<=zero(10 downto 0)&operand(31 downto 11);
              tempc<=operand(10);
            when "01100" =>
              temp<=zero(11 downto 0)&operand(31 downto 12);
              tempc<=operand(11);
            when "01101" =>
              temp<=zero(12 downto 0)&operand(31 downto 13);
              tempc<=operand(12);
            when "01110" =>
              temp<=zero(13 downto 0)&operand(31 downto 14);
              tempc<=operand(13);
            when "01111" =>
              temp<=zero(14 downto 0)&operand(31 downto 15);
              tempc<=operand(14);
            when "10000" =>
              temp<=zero(15 downto 0)&operand(31 downto 16);
              tempc<=operand(15);
            when "10001" =>
              temp<=zero(16 downto 0)&operand(31 downto 17);
              tempc<=operand(16);
            when "10010" =>
              temp<=zero(17 downto 0)&operand(31 downto 18);
              tempc<=operand(17);
            when "10011" =>
              temp<=zero(18 downto 0)&operand(31 downto 19);
              tempc<=operand(18);
            when "10100" =>
              temp<=zero(19 downto 0)&operand(31 downto 20);
              tempc<=operand(19);
            when "10101" =>
              temp<=zero(20 downto 0)&operand(31 downto 21);
              tempc<=operand(20);
            when "10110" =>
              temp<=zero(21 downto 0)&operand(31 downto 22);
              tempc<=operand(21);
            when "10111" =>
              temp<=zero(22 downto 0)&operand(31 downto 23);
              tempc<=operand(22);
            when "11000" =>
              temp<=zero(23 downto 0)&operand(31 downto 24);
              tempc<=operand(23);
            when "11001" =>
              temp<=zero(24 downto 0)&operand(31 downto 25);
              tempc<=operand(24);
            when "11010" =>
              temp<=zero(25 downto 0)&operand(31 downto 26);
              tempc<=operand(25);
            when "11011" =>
              temp<=zero(26 downto 0)&operand(31 downto 27);
              tempc<=operand(26);
            when "11100" =>
              temp<=zero(27 downto 0)&operand(31 downto 28);
              tempc<=operand(27);
            when "11101" =>
              temp<=zero(28 downto 0)&operand(31 downto 29);
              tempc<=operand(28);
            when "11110" =>
              temp<=zero(29 downto 0)&operand(31 downto 30);
              tempc<=operand(29);
            when "11111" =>
              temp<=zero(30 downto 0)&operand(31);
              tempc<=operand(30);
            when others => null;
          end case;

        when "10" =>    
            if(operand(31)='0') then
                case (amount) is
                when "00000" =>
                  temp<=operand;
                  tempc<='0';
                when "00001" =>
                  temp<=zero(0)&operand(31 downto 1);
                  tempc<=operand(0);
                when "00010" =>
                  temp<=zero(1 downto 0)&operand(31 downto 2);
                  tempc<=operand(1);
                when "00011" =>
                  temp<=zero(2 downto 0)&operand(31 downto 3);
                  tempc<=operand(2);
                when "00100" =>
                  temp<=zero(3 downto 0)&operand(31 downto 4);
                  tempc<=operand(3);
                when "00101" =>
                  temp<=zero(4 downto 0)&operand(31 downto 5);
                  tempc<=operand(4);
                when "00110" =>
                  temp<=zero(5 downto 0)&operand(31 downto 6);
                  tempc<=operand(5);
                when "00111" =>
                  temp<=zero(6 downto 0)&operand(31 downto 7);
                  tempc<=operand(6);
                when "01000" =>
                  temp<=zero(7 downto 0)&operand(31 downto 8);
                  tempc<=operand(7);
                when "01001" =>
                  temp<=zero(8 downto 0)&operand(31 downto 9);
                  tempc<=operand(8);
                when "01010" =>
                  temp<=zero(9 downto 0)&operand(31 downto 10);
                  tempc<=operand(9);
                when "01011" =>
                  temp<=zero(10 downto 0)&operand(31 downto 11);
                  tempc<=operand(10);
                when "01100" =>
                  temp<=zero(11 downto 0)&operand(31 downto 12);
                  tempc<=operand(11);
                when "01101" =>
                  temp<=zero(12 downto 0)&operand(31 downto 13);
                  tempc<=operand(12);
                when "01110" =>
                  temp<=zero(13 downto 0)&operand(31 downto 14);
                  tempc<=operand(13);
                when "01111" =>
                  temp<=zero(14 downto 0)&operand(31 downto 15);
                  tempc<=operand(14);
                when "10000" =>
                  temp<=zero(15 downto 0)&operand(31 downto 16);
                  tempc<=operand(15);
                when "10001" =>
                  temp<=zero(16 downto 0)&operand(31 downto 17);
                  tempc<=operand(16);
                when "10010" =>
                  temp<=zero(17 downto 0)&operand(31 downto 18);
                  tempc<=operand(17);
                when "10011" =>
                  temp<=zero(18 downto 0)&operand(31 downto 19);
                  tempc<=operand(18);
                when "10100" =>
                  temp<=zero(19 downto 0)&operand(31 downto 20);
                  tempc<=operand(19);
                when "10101" =>
                  temp<=zero(20 downto 0)&operand(31 downto 21);
                  tempc<=operand(20);
                when "10110" =>
                  temp<=zero(21 downto 0)&operand(31 downto 22);
                  tempc<=operand(21);
                when "10111" =>
                  temp<=zero(22 downto 0)&operand(31 downto 23);
                  tempc<=operand(22);
                when "11000" =>
                  temp<=zero(23 downto 0)&operand(31 downto 24);
                  tempc<=operand(23);
                when "11001" =>
                  temp<=zero(24 downto 0)&operand(31 downto 25);
                  tempc<=operand(24);
                when "11010" =>
                  temp<=zero(25 downto 0)&operand(31 downto 26);
                  tempc<=operand(25);
                when "11011" =>
                  temp<=zero(26 downto 0)&operand(31 downto 27);
                  tempc<=operand(26);
                when "11100" =>
                  temp<=zero(27 downto 0)&operand(31 downto 28);
                  tempc<=operand(27);
                when "11101" =>
                  temp<=zero(28 downto 0)&operand(31 downto 29);
                  tempc<=operand(28);
                when "11110" =>
                  temp<=zero(29 downto 0)&operand(31 downto 30);
                  tempc<=operand(29);
                when "11111" =>
                  temp<=zero(30 downto 0)&operand(31);
                  tempc<=operand(30);
                when others => null;
              end case;
            else
                case (amount) is
                when "00000" =>
                  temp<=operand;
                  tempc<='0';
                when "00001" =>
                  temp<=one(0)&operand(31 downto 1);
                  tempc<=operand(0);
                when "00010" =>
                  temp<=one(1 downto 0)&operand(31 downto 2);
                  tempc<=operand(1);
                when "00011" =>
                  temp<=one(2 downto 0)&operand(31 downto 3);
                  tempc<=operand(2);
                when "00100" =>
                  temp<=one(3 downto 0)&operand(31 downto 4);
                  tempc<=operand(3);
                when "00101" =>
                  temp<=one(4 downto 0)&operand(31 downto 5);
                  tempc<=operand(4);
                when "00110" =>
                  temp<=one(5 downto 0)&operand(31 downto 6);
                  tempc<=operand(5);
                when "00111" =>
                  temp<=one(6 downto 0)&operand(31 downto 7);
                  tempc<=operand(6);
                when "01000" =>
                  temp<=one(7 downto 0)&operand(31 downto 8);
                  tempc<=operand(7);
                when "01001" =>
                  temp<=one(8 downto 0)&operand(31 downto 9);
                  tempc<=operand(8);
                when "01010" =>
                  temp<=one(9 downto 0)&operand(31 downto 10);
                  tempc<=operand(9);
                when "01011" =>
                  temp<=one(10 downto 0)&operand(31 downto 11);
                  tempc<=operand(10);
                when "01100" =>
                  temp<=one(11 downto 0)&operand(31 downto 12);
                  tempc<=operand(11);
                when "01101" =>
                  temp<=one(12 downto 0)&operand(31 downto 13);
                  tempc<=operand(12);
                when "01110" =>
                  temp<=one(13 downto 0)&operand(31 downto 14);
                  tempc<=operand(13);
                when "01111" =>
                  temp<=one(14 downto 0)&operand(31 downto 15);
                  tempc<=operand(14);
                when "10000" =>
                  temp<=one(15 downto 0)&operand(31 downto 16);
                  tempc<=operand(15);
                when "10001" =>
                  temp<=one(16 downto 0)&operand(31 downto 17);
                  tempc<=operand(16);
                when "10010" =>
                  temp<=one(17 downto 0)&operand(31 downto 18);
                  tempc<=operand(17);
                when "10011" =>
                  temp<=one(18 downto 0)&operand(31 downto 19);
                  tempc<=operand(18);
                when "10100" =>
                  temp<=one(19 downto 0)&operand(31 downto 20);
                  tempc<=operand(19);
                when "10101" =>
                  temp<=one(20 downto 0)&operand(31 downto 21);
                  tempc<=operand(20);
                when "10110" =>
                  temp<=one(21 downto 0)&operand(31 downto 22);
                  tempc<=operand(21);
                when "10111" =>
                  temp<=one(22 downto 0)&operand(31 downto 23);
                  tempc<=operand(22);
                when "11000" =>
                  temp<=one(23 downto 0)&operand(31 downto 24);
                  tempc<=operand(23);
                when "11001" =>
                  temp<=one(24 downto 0)&operand(31 downto 25);
                  tempc<=operand(24);
                when "11010" =>
                  temp<=one(25 downto 0)&operand(31 downto 26);
                  tempc<=operand(25);
                when "11011" =>
                  temp<=one(26 downto 0)&operand(31 downto 27);
                  tempc<=operand(26);
                when "11100" =>
                  temp<=one(27 downto 0)&operand(31 downto 28);
                  tempc<=operand(27);
                when "11101" =>
                  temp<=one(28 downto 0)&operand(31 downto 29);
                  tempc<=operand(28);
                when "11110" =>
                  temp<=one(29 downto 0)&operand(31 downto 30);
                  tempc<=operand(29);
                when "11111" =>
                  temp<=one(30 downto 0)&operand(31);
                  tempc<=operand(30);
                when others => null;
              end case;          
            end if;

          when "11"=>
            case (amount) is
            when "00000" =>
              temp<=operand;
              tempc<='0';
            when "00001" =>
              temp<=operand(0)&operand(31 downto 1);
              tempc<=operand(0);
            when "00010" =>
              temp<=operand(1 downto 0)&operand(31 downto 2);
              tempc<=operand(1);
            when "00011" =>
              temp<=operand(2 downto 0)&operand(31 downto 3);
              tempc<=operand(2);
            when "00100" =>
              temp<=operand(3 downto 0)&operand(31 downto 4);
              tempc<=operand(3);
            when "00101" =>
              temp<=operand(4 downto 0)&operand(31 downto 5);
              tempc<=operand(4);
            when "00110" =>
              temp<=operand(5 downto 0)&operand(31 downto 6);
              tempc<=operand(5);
            when "00111" =>
              temp<=operand(6 downto 0)&operand(31 downto 7);
              tempc<=operand(6);
            when "01000" =>
              temp<=operand(7 downto 0)&operand(31 downto 8);
              tempc<=operand(7);
            when "01001" =>
              temp<=operand(8 downto 0)&operand(31 downto 9);
              tempc<=operand(8);
            when "01010" =>
              temp<=operand(9 downto 0)&operand(31 downto 10);
              tempc<=operand(9);
            when "01011" =>
              temp<=operand(10 downto 0)&operand(31 downto 11);
              tempc<=operand(10);
            when "01100" =>
              temp<=operand(11 downto 0)&operand(31 downto 12);
              tempc<=operand(11);
            when "01101" =>
              temp<=operand(12 downto 0)&operand(31 downto 13);
              tempc<=operand(12);
            when "01110" =>
              temp<=operand(13 downto 0)&operand(31 downto 14);
              tempc<=operand(13);
            when "01111" =>
              temp<=operand(14 downto 0)&operand(31 downto 15);
              tempc<=operand(14);
            when "10000" =>
              temp<=operand(15 downto 0)&operand(31 downto 16);
              tempc<=operand(15);
            when "10001" =>
              temp<=operand(16 downto 0)&operand(31 downto 17);
              tempc<=operand(16);
            when "10010" =>
              temp<=operand(17 downto 0)&operand(31 downto 18);
              tempc<=operand(17);
            when "10011" =>
              temp<=operand(18 downto 0)&operand(31 downto 19);
              tempc<=operand(18);
            when "10100" =>
              temp<=operand(19 downto 0)&operand(31 downto 20);
              tempc<=operand(19);
            when "10101" =>
              temp<=operand(20 downto 0)&operand(31 downto 21);
              tempc<=operand(20);
            when "10110" =>
              temp<=operand(21 downto 0)&operand(31 downto 22);
              tempc<=operand(21);
            when "10111" =>
              temp<=operand(22 downto 0)&operand(31 downto 23);
              tempc<=operand(22);
            when "11000" =>
              temp<=operand(23 downto 0)&operand(31 downto 24);
              tempc<=operand(23);
            when "11001" =>
              temp<=operand(24 downto 0)&operand(31 downto 25);
              tempc<=operand(24);
            when "11010" =>
              temp<=operand(25 downto 0)&operand(31 downto 26);
              tempc<=operand(25);
            when "11011" =>
              temp<=operand(26 downto 0)&operand(31 downto 27);
              tempc<=operand(26);
            when "11100" =>
              temp<=operand(27 downto 0)&operand(31 downto 28);
              tempc<=operand(27);
            when "11101" =>
              temp<=operand(28 downto 0)&operand(31 downto 29);
              tempc<=operand(28);
            when "11110" =>
              temp<=operand(29 downto 0)&operand(31 downto 30);
              tempc<=operand(29);
            when "11111" =>
              temp<=operand(30 downto 0)&operand(31);
              tempc<=operand(30);
            when others => null;
          end case;

        when others => null;
        end case;
   end process;
   result<=temp;
   C<=tempc;
end Behavioral;
