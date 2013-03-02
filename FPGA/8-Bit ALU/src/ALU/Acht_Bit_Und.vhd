library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Acht_Bit_Und is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end Acht_Bit_Und;

architecture Acht_Bit_Und of Acht_Bit_Und is

	-- 1-Bit Und erzeugen
	component Und
		Port (A, B : in STD_LOGIC;
				Q : out STD_LOGIC);
	end component;

begin

	U1 : Und PORT MAP (A(0), B(0), Q(0));
	U2 : Und PORT MAP (A(1), B(1), Q(1));
	U3 : Und PORT MAP (A(2), B(2), Q(2));
	U4 : Und PORT MAP (A(3), B(3), Q(3));
	U5 : Und PORT MAP (A(4), B(4), Q(4));
	U6 : Und PORT MAP (A(5), B(5), Q(5));
	U7 : Und PORT MAP (A(6), B(6), Q(6));
	U8 : Und PORT MAP (A(7), B(7), Q(7));
	
end Acht_Bit_Und;