----------------------------------------------------------------------------------
-- Company: 		 www.kampis-elektroecke.de
-- Engineer: 		 Daniel Kampert
-- 
-- Create Date:    16:19:16 03/01/2013 
-- Design Name: 
-- Module Name:    Addier_Subtrahier_Werk - Addier_Subtrahier_Werk_Arch 
-- Project Name: 	 4-Bit Addier/Subtrahier Werk
-- Target Devices: XC3S250-4E
-- Tool versions:  ISE 14.4
-- Description:    Addiert oder subtrahiert zwei 4-Bit Zahlen. Die Rechenoperation
--						 wird dabei duch den CTRL-Pin gesteuert (0 = Addition, 1 = Subtraktion).
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

entity Addier_Subtrahier_Werk is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           CTRL : in  STD_LOGIC;
			  Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  CarryOut : out STD_LOGIC);
end Addier_Subtrahier_Werk;

architecture Addier_Subtrahier_Werk_Arch of Addier_Subtrahier_Werk is
	
	-- Komponente "Addierer" erzeugen
	component Addierer
		Port (A, B, CarryIn : in STD_LOGIC;
				Q, CarryOut : out STD_LOGIC);
	end component;
	
	-- Signale für die Addierer
	signal R1, R2, R3, R4 : STD_LOGIC;
	signal C, C1, C2, C3, C4 : STD_LOGIC;
	
	-- Signale für die Multiplexer
	signal P1, P2, P3, P4 : STD_LOGIC;

begin

	-- Carry Bit in Abhängigkeit von der Rechenoperation (Control) setzen
	C <= CTRL;
	
	P1 <= ((not CTRL) and B(0)) or (CTRL and not(B(0))); 
	P2 <= ((not CTRL) and B(1)) or (CTRL and not(B(1))); 
	P3 <= ((not CTRL) and B(2)) or (CTRL and not(B(2))); 
	P4 <= ((not CTRL) and B(3)) or (CTRL and not(B(3))); 
	
	A1 : Addierer PORT MAP (A(0), P1, C, R1, C1);
	A2 : Addierer PORT MAP (A(1), P2, C1, R2, C2);
	A3 : Addierer PORT MAP (A(2), P3, C2, R3, C3);
	A4 : Addierer PORT MAP (A(3), P4, C3, R4, C4);
	
	Q <= R4 & R3 & R2 & R1;
	CarryOut <= C4;

end Addier_Subtrahier_Werk_Arch;

