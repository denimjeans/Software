----------------------------------------------------------------------------------
-- Company: 		 www.kampis-elektroecke.de	
-- Engineer: 		 Daniel Kampert
-- 
-- Create Date:    21:40:46 02/25/2013 
-- Design Name: 	
-- Module Name:    Komparator - Komparator_Arch 
-- Project Name: 	 2-Bit Komparator
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

    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           Q : out  STD_LOGIC);
			  
end Komparator;


architecture Komparator_Arch of Komparator is

	signal P0, P1 : STD_LOGIC;
	
	Component Ein_Bit_Komparator
	
		Port ( I1, I2 : in STD_LOGIC;
				O1 : out STD_LOGIC);
				
	end Component;

begin

	U1 : Ein_Bit_Komparator PORT MAP (A(0), B(0), P0);
	U2 : Ein_Bit_Komparator PORT MAP (A(1), B(1), P1);
	
	Q <= P0 AND P1;

end Komparator_Arch;

