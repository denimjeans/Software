library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  Control : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Multiplexer;

architecture Multiplexer_Arch of Multiplexer is

	signal P1, P2 : STD_LOGIC;

begin
	
	Q <= P1 or P2;
	
	P1 <= A and (not Control);
	P2 <= B and Control;

end Multiplexer_Arch;