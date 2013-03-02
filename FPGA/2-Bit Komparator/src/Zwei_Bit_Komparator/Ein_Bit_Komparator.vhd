library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Ein_Bit_Komparator is

    Port ( I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           O1 : out  STD_LOGIC);
			  
end Ein_Bit_Komparator;

architecture Ein_Bit_Komparator_Arch of Ein_Bit_Komparator is

	signal P0, P1 : STD_LOGIC;
	
begin

	O1 <= P0 or P1;

	P0 <= (not I1) and (not I2);
	P1 <= I1 and I2;

end Ein_Bit_Komparator_Arch;