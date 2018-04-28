----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 09:42:22 PM
-- Design Name: 
-- Module Name: LAB4 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    port ( operand1,operand2 : in std_logic_vector (31 downto 0);
           opcode : in std_logic_vector(3 downto 0);
           result : out std_logic_vector (31 downto 0);
           C_curr: in std_logic;
           N_new,Z_new,C_new,V_new : out std_logic     
         );
end entity;             

architecture Behavioral of ALU is
    signal check_flag,c31,c32:std_logic;
    signal temp:std_logic_vector(32 downto 0);
begin  
    process (operand1,operand2,opcode,C_curr,temp,c31,c32)
        begin
            if(opcode="0000") then
                temp<= ('0' & operand1) and ('0' & operand2);   
            elsif(opcode="0001") then
                temp<= ('0' & operand1) xor ('0' & operand2); 
            elsif(opcode="0010") then
                temp<= ('0' & operand1) + (not ('0' & operand2)) + 1; 
            elsif(opcode="0011") then
                temp<= ('0' & operand2) + (not ('0' & operand1)) + 1; 
            elsif(opcode="0100") then
                temp<= ('0' & operand1) + ('0' & operand2); 
            elsif(opcode="0101") then
                temp<= ('0' & operand1) + ('0' & operand2) + C_curr; 
            elsif(opcode="0110") then
                temp<= ('0' & operand1) + (not ('0' & operand2)) + C_curr; 
            elsif(opcode="0111") then
                temp<= ('0' & operand2) + (not ('0' & operand1)) + C_curr; 
            elsif(opcode="1000") then
                temp<= ('0' & operand1) and ('0' & operand2);   
            elsif(opcode="1001") then
                temp<= ('0' & operand1) xor ('0' & operand2);   
            elsif(opcode="1010") then
                temp<= ('0' & operand1) + (not ('0' & operand2)) + 1; 
            elsif(opcode="1011") then
                temp<= ('0' & operand1) + ('0' & operand2); 
            elsif(opcode="1100") then
                temp<= ('0' & operand1) or ('0' & operand2); 
            elsif(opcode="1101") then
                temp<= ('0' & operand2); 
            elsif(opcode="1110") then
                temp<= ('0' & operand1) and  (not ('0' & operand2)); 
            elsif(opcode="1111") then
                temp<= not ('0' & operand2); 
            end if;    

            if(temp(31 downto 0)="00000000000000000000000000000000") then Z_new<='1';
            else Z_new<='0';
            end if;
            c31<=operand1(31) xor operand2(31) xor temp(31);
            c32<=(operand1(31) and operand2(31)) or (operand1(31) and temp(31)) or (operand2(31) and temp(31));
            C_new<=c32;
            V_new<=c31 xor c32;   
            N_new<=temp(31);

    end process;
    result<=temp(31 downto 0);
end Behavioral; 