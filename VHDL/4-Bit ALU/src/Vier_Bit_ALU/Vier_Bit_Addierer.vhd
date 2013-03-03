library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Vier_Bit_Addierer is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  CarryIn : in STD_LOGIC;
			  CarryOut : out STD_LOGIC);
end Vier_Bit_Addierer;

architecture Vier_Bit_Addierer_Arch of Vier_Bit_Addierer is

	-- 1-Bit Addierer erzeugen
	component Addierer
		Port (A, B, CarryIn : in STD_LOGIC;
				Q, CarryOut : out STD_LOGIC);
	end component;
	
	-- Signale für die Addierer
	signal R : STD_LOGIC_VECTOR(3 downto 0);
	signal C : STD_LOGIC_VECTOR(3 downto 0);	

begin

	-- Berechnung des Ergebnisses
	A1 : Addierer PORT MAP (A(0), B(0), CarryIn, R(0), C(0));
	A2 : Addierer PORT MAP (A(1), B(1), C(0), R(1), C(1));
	A3 : Addierer PORT MAP (A(2), B(2), C(1), R(2), C(2));
	A4 : Addierer PORT MAP (A(3), B(3), C(2), R(3), C(3));
	
	Q <= R;
	CarryOut <= C(3);

end Vier_Bit_Addierer_Arch;