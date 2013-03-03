library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Eingang_B is
    Port ( B : in  STD_LOGIC_VECTOR (7 downto 0);
           EnableB : in  STD_LOGIC;
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end Eingang_B;

architecture Eingang_B_Arch of Eingang_B is

	-- 8-Bit Und erzeugen
	component Acht_Bit_Und
		Port (A : in STD_LOGIC_VECTOR(7 downto 0);
				B : in STD_LOGIC_VECTOR(7 downto 0);
				Q : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	signal Und_Result : STD_LOGIC_VECTOR(7 downto 0);
	signal Enable : STD_LOGIC_VECTOR(7 downto 0);
	
begin
	
	Enable <= EnableB & EnableB & EnableB & EnableB & EnableB & EnableB & EnableB & EnableB;
	U1 : Acht_Bit_Und PORT MAP (B, Enable, Und_Result);
	
	QB <= Und_Result;
	
end Eingang_B_Arch;