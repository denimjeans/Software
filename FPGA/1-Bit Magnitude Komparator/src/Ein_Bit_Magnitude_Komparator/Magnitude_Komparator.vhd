----------------------------------------------------------------------------------
-- Company: 		 www.kampis-elektroecke.de
-- Engineer: 		 Daniel Kampert
--
-- Create Date:    17:35:41 03/02/2013 
-- Design Name: 
-- Module Name:    Magnitude_Komparator - Magnitude_Komparator_Arch 
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

entity Magnitude_Komparator is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC);
end Magnitude_Komparator;

architecture Magnitude_Komparator_Arch of Magnitude_Komparator is

	signal P1, P2 : STD_LOGIC;

begin

	P1 <= A and (not(A and B));
	P2 <= not(P1 or (B and (not(A and B))));

	Q1 <= P1;		-- A > B
	Q2 <= P2;		-- A = B

end Magnitude_Komparator_Arch;