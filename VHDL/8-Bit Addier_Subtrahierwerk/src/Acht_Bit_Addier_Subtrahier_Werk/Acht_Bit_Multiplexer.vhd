library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Acht_Bit_Multiplexer is
    Port ( B : in  STD_LOGIC_VECTOR(7 downto 0);
           CTRL : in  STD_LOGIC;
			  Q : out STD_LOGIC_VECTOR(7 downto 0));

end Acht_Bit_Multiplexer;

architecture Acht_Bit_Multiplexer_Arch of Acht_Bit_Multiplexer is

	component Multiplexer
		Port (A, B, Control : in STD_LOGIC;
				Q : out STD_LOGIC);
	end component;

	signal Mult : STD_LOGIC_VECTOR(7 downto 0);

begin

	M1 : Multiplexer PORT MAP (B(0), not(B(0)), CTRL, Mult(0));
	M2 : Multiplexer PORT MAP (B(1), not(B(1)), CTRL, Mult(1));
	M3 : Multiplexer PORT MAP (B(2), not(B(2)), CTRL, Mult(2));
	M4 : Multiplexer PORT MAP (B(3), not(B(3)), CTRL, Mult(3));
	M5 : Multiplexer PORT MAP (B(4), not(B(4)), CTRL, Mult(4));
	M6 : Multiplexer PORT MAP (B(5), not(B(5)), CTRL, Mult(5));
	M7 : Multiplexer PORT MAP (B(6), not(B(6)), CTRL, Mult(6));
	M8 : Multiplexer PORT MAP (B(7), not(B(7)), CTRL, Mult(7));
	
	Q <= Mult;

end Acht_Bit_Multiplexer_Arch;