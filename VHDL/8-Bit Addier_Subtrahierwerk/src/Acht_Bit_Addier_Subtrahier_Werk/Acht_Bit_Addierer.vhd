library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Acht_Bit_Addierer is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
			  Q : out  STD_LOGIC_VECTOR (7 downto 0);
			  CarryIn : in STD_LOGIC;
			  CarryOut : out STD_LOGIC);
end Acht_Bit_Addierer;

architecture Acht_Bit_Addierer_Arch of Acht_Bit_Addierer is

	-- Komponente "Addierer" erzeugen
	component Addierer
		Port (A, B, CarryIn : in STD_LOGIC;
				Q, CarryOut : out STD_LOGIC);
	end component;
	
	-- Signale für die Addierer
	signal R : STD_LOGIC_VECTOR(7 downto 0);
	signal C : STD_LOGIC_VECTOR(7 downto 0);	

begin

	-- Berechnung des Ergebnisses
	A1 : Addierer PORT MAP (A(0), B(0), CarryIn, R(0), C(0));
	A2 : Addierer PORT MAP (A(1), B(1), C(0), R(1), C(1));
	A3 : Addierer PORT MAP (A(2), B(2), C(1), R(2), C(2));
	A4 : Addierer PORT MAP (A(3), B(3), C(2), R(3), C(3));
	A5 : Addierer PORT MAP (A(4), B(4), C(3), R(4), C(4));
	A6 : Addierer PORT MAP (A(5), B(5), C(4), R(5), C(5));
	A7 : Addierer PORT MAP (A(6), B(6), C(5), R(6), C(6));
	A8 : Addierer PORT MAP (A(7), B(7), C(6), R(7), C(7));
	
	Q <= R;
	CarryOut <= C(7);

end Acht_Bit_Addierer_Arch;