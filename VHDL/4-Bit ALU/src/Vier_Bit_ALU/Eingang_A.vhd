library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Eingang_A is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           InvertA : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (3 downto 0));
end Eingang_A;

architecture Eingang_A_Arch of Eingang_A is

	-- 4-Bit XOR erzeugen
	component Vier_Bit_XOR
		Port (A : in STD_LOGIC_VECTOR(3 downto 0);
				B : in STD_LOGIC_VECTOR(3 downto 0);
				Q : out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	signal XOR_Result : STD_LOGIC_VECTOR(3 downto 0);
	signal X : STD_LOGIC_VECTOR(3 downto 0);
	
begin
	
	X <= InvertA & InvertA & InvertA & InvertA;
	X1 : Vier_Bit_XOR PORT MAP (A, X, XOR_Result);
	
	QA <= XOR_Result;
	
end Eingang_A_Arch;