----------------------------------------------------------------------------------
-- Company: 		 www.kampis-elektroecke.de
-- Engineer: 		 Daniel Kampert
-- 
-- Create Date:    22:25:15 02/28/2013 
-- Design Name: 
-- Module Name:    Vier_Bit_Addierer - Vier_Bit_Addierer_Arch 
-- Project Name:   4-Bit Addierer
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
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Vier_Bit_Addierer is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  Overflow : out  STD_LOGIC);
end Vier_Bit_Addierer;

architecture Vier_Bit_Addierer_Arch of Vier_Bit_Addierer is
 
	signal R1, R2, R3, R4 : STD_LOGIC;
	signal C1, C2, C3, C4 : STD_LOGIC;
 
	component Addierer
		Port (A, B, CarryIn : in STD_LOGIC;
				Q, CarryOut : out STD_LOGIC);
	end component;
		
begin

		A1 : Addierer PORT MAP (A(0), B(0), '0', R1, C1);
		A2 : Addierer PORT MAP (A(1), B(1), C1, R2, C2);
		A3 : Addierer PORT MAP (A(2), B(2), C2, R3, C3);
		A4 : Addierer PORT MAP (A(3), B(3), C3, R4, C4);
		Q <= R4 & R3 & R2 & R1;
		Overflow <= C4;

end Vier_Bit_Addierer_Arch;

