----------------------------------------------------------------------------------
-- Company: 		 www.kampis-elektroecke.de	
-- Engineer: 		 Daniel Kampert
-- 
-- Create Date:    15:44:46 02/24/2013 
-- Design Name: 	
-- Module Name:    Komparator - Komparator_Arch 
-- Project Name: 	 1-Bit Komparator
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

entity Komparator is

    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q : out  STD_LOGIC);
			  
end Komparator;

architecture Komparator_Arch of Komparator is

	signal P0, P1 : STD_LOGIC;
	
begin

	Q <= P0 or P1;

	P0 <= (not A) and (not B);
	P1 <= A and B;

end Komparator_Arch;

