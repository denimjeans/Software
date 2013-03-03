library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EXOR is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end EXOR;

architecture EXOR_Arch of EXOR is

begin

	Q <= A XOR B;

end EXOR_Arch;