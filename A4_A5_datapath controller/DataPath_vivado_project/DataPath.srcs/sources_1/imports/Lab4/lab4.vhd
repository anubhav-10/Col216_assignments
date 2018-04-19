
library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity add is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity sub is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity rsb is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity adc is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	carry: in std_logic;
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity sbc is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	carry: in std_logic;
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity rsc is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	carry: in std_logic;
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity eor is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tst is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity teq is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity cmp is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity cmn is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	carry: in std_logic;
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity orr is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity mov is 
port (
	operand1: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity bic is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity mvn is 
port (
	operand1: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;





library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity ARM_shifter is
port (
	operand: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0);
	shifter_carry: out std_logic;
	cond : in std_logic_vector(1 downto 0);
	shift_amount: in std_logic_vector(4 downto 0)	
);
end entity;


library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity ARM_alu is
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0);
	cond: in std_logic_vector(3 downto 0);
	opcode: in std_logic_vector(3 downto 0);
	N_in, Z_in, C_in, V_in, carry_in : in std_logic;
	out_N, out_Z, out_C, out_V : out std_logic
);
end entity;


library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity ARM_multiplier is 
port (
	operand1: in std_logic_vector(31 downto 0);
	operand2: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
);
end entity;


library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity ARM_register_file is
port (
	operand: in std_logic_vector(31 downto 0);
	read_addr1,read_addr2,write_addr: in std_logic_vector(3 downto 0);
	clk,reset,write_enable: in std_logic;
	output1,output2: out std_logic_vector(31 downto 0);
	pc: out std_logic
);
end entity;