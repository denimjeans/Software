library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Acht_Bit_Oder is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end Acht_Bit_Oder;

architecture Acht_Bit_Oder_Arch of Acht_Bit_Oder is

	-- 1-Bit Oder erzeugen
	component Oder
		Port (A, B : in STD_LOGIC;
				Q : out STD_LOGIC);
	end component;

begin

	O1 : Oder PORT MAP (A(0), B(0), Q(0));
	O2 : Oder PORT MAP (A(1), B(1), Q(1));
	O3 : Oder PORT MAP (A(2), B(2), Q(2));
	O4 : Oder PORT MAP (A(3), B(3), Q(3));
	O5 : Oder PORT MAP (A(4), B(4), Q(4));
	O6 : Oder PORT MAP (A(5), B(5), Q(5));
	O7 : Oder PORT MAP (A(6), B(6), Q(6));
	O8 : Oder PORT MAP (A(7), B(7), Q(7));

end Acht_Bit_Oder_Arch;