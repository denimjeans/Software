library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  Control : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Multiplexer;

architecture Multiplexer_Arch of Multiplexer is

begin

		Q <= (A and not(Control)) or (B and Control);

end Multiplexer_Arch;