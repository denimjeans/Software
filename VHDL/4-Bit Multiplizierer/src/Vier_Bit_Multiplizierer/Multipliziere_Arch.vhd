----------------------------------------------------------------------------------
-- Company: 		 www.kampis-elektroecke.de
-- Engineer: 		 Daniel Kampert 
-- 
-- Create Date:    15:39:16 03/02/2013 
-- Design Name: 
-- Module Name:    Multiplizierer - Multiplizierer_Arch 
-- Project Name: 
-- Target Devices: XC3S250-4E
-- Tool versions:  ISE 14.4
-- Description: 	 4-Bit Multiplizierer
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplizierer is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end Multiplizierer;

architecture Multiplizierer_Arch of Multiplizierer is

	signal C1, C2, C3 : STD_LOGIC;
	signal U1, U2, U3, U4 : STD_LOGIC_VECTOR(3 downto 0);
	signal A01 : STD_LOGIC_VECTOR(3 downto 0);
	signal Z1, Z2, Z3 : STD_LOGIC_VECTOR(3 downto 0);
	signal P1, P2 : STD_LOGIC_VECTOR(3 downto 0);

	component Vier_Bit_Addierer
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  Overflow : out  STD_LOGIC);
	end component;

begin

	U1 <= (A(3) and B(0)) & (A(2) and B(0)) & (A(1) and B(0)) & (A(0) and B(0));
	U2 <= (A(3) and B(1)) & (A(2) and B(1)) & (A(1) and B(1)) & (A(0) and B(1));
	U3 <= (A(3) and B(2)) & (A(2) and B(2)) & (A(1) and B(2)) & (A(0) and B(2));
	U4 <= (A(3) and B(3)) & (A(2) and B(3)) & (A(1) and B(3)) & (A(0) and B(3));
	
	A01 <= '0' & U1(3) & U1(2) & U1(1);

	-- Erstes Zwischenergebnis generieren
	A1 : Vier_Bit_Addierer PORT MAP (A01, U2, Z1, C1);
	P1 <= C1 & Z1(3) & Z1(2) & Z1(1);
	-- Zweites Zwischenergebnis generieren
	A2 : Vier_Bit_Addierer PORT MAP (P1, U3, Z2, C2);
	P2 <= C2 & Z2(3) & Z2(2) & Z2(1);
	-- Drittes Zwischenergebnis generieren
	A3 : Vier_Bit_Addierer PORT MAP (P2, U4, Z3, C3);

	-- Ergebnis generieren	
	Q <= C3 & Z3(3) & Z3(2) & Z3(1) & Z3(0) & Z2(0) & Z1(0) & U1(0); 

end Multiplizierer_Arch;