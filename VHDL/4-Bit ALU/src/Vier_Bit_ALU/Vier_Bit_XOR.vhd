library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Vier_Bit_XOR is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Vier_Bit_XOR;

architecture Vier_Bit_XOR_Arch of Vier_Bit_XOR is

	-- 1-Bit XOR erzeugen
	component EXOR
		Port (A, B : in STD_LOGIC;
				Q : out STD_LOGIC);
	end component;

begin

		X1 : EXOR PORT MAP (A(0), B(0), Q(0));
		X2 : EXOR PORT MAP (A(1), B(1), Q(1));
		X3 : EXOR PORT MAP (A(2), B(2), Q(2));
		X4 : EXOR PORT MAP (A(3), B(3), Q(3));

end Vier_Bit_XOR_Arch;