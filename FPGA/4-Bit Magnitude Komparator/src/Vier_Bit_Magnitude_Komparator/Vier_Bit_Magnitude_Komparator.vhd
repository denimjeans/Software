----------------------------------------------------------------------------------
-- Company: 		 www.kampis-elektroecke.de
-- Engineer: 		 Daniel Kampert
-- 
-- Create Date:    17:55:29 03/02/2013 
-- Design Name: 
-- Module Name:    Vier_Bit_Magnitude_Komparator - Vier_Bit_Magnitude_Komparator_Arch 
-- Project Name: 
-- Target Devices: XC3S250-4E
-- Tool versions:  ISE 14.4 
-- Description: 
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

entity Vier_Bit_Magnitude_Komparator is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC);
end Vier_Bit_Magnitude_Komparator;

architecture Vier_Bit_Magnitude_Komparator_Arch of Vier_Bit_Magnitude_Komparator is

	signal E1, E2, E3, E4 : STD_LOGIC;
	signal AB1, AB2, AB3, AB4 : STD_LOGIC;
	signal P1, P2, P3 : STD_LOGIC;

	component Magnitude_Komparator
		Port (A, B : in STD_LOGIC;
				Q1, Q2 : out STD_LOGIC);
	end component;	

begin

	M1 : Magnitude_Komparator PORT MAP (A(0), B(0), AB1, E1);
	M2 : Magnitude_Komparator PORT MAP (A(1), B(1), AB2, E2);
	M3 : Magnitude_Komparator PORT MAP (A(2), B(2), AB3, E3);
	M4 : Magnitude_Komparator PORT MAP (A(3), B(3), AB4, E4);
	
	P1 <= (AB1 and E2 and E3 and E4) or (AB2 and E3 and E4) or (AB3 and E4) or AB4;
	P2 <= E1 and E2 and E3 and E4;
	P3 <= not (P1 or P2);
	
	Q1 <= P1;
	Q2 <= P2;
	Q3 <= P3;
	
end Vier_Bit_Magnitude_Komparator_Arch;

