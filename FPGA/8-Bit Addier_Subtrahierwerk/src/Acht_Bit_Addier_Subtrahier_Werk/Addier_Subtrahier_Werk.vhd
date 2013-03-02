----------------------------------------------------------------------------------
-- Company: 		 www.kampis-elektroecke.de
-- Engineer: 		 Daniel Kampert
-- 
-- Create Date:    16:19:16 03/01/2013 
-- Design Name: 
-- Module Name:    Addier_Subtrahier_Werk - Addier_Subtrahier_Werk_Arch 
-- Project Name: 	 8-Bit Addier/Subtrahier Werk
-- Target Devices: XC3S250-4E
-- Tool versions:  ISE 14.4
-- Description:    Addiert oder subtrahiert zwei 8-Bit Zahlen (A-B). Die Rechenoperation
--						 wird dabei duch den CTRL-Pin gesteuert (0 = Addition, 1 = Subtraktion).
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
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
    Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           CTRL : in  STD_LOGIC;
			  Q : out  STD_LOGIC_VECTOR(7 downto 0);
			  CarryOut : out STD_LOGIC);
end Addier_Subtrahier_Werk;

architecture Addier_Subtrahier_Werk_Arch of Addier_Subtrahier_Werk is
	
	-- Zwischenergebnis für den 8-Bit Multiplexer
	signal Mult : STD_LOGIC_VECTOR(7 downto 0);
	
	-- Zwischenergebnis für den 8-Bit Addierer
	signal Result : STD_LOGIC_VECTOR(7 downto 0);
	signal Ci, Co : STD_LOGIC;
	
	-- 8-Bit Multiplexer erzeugen
	component Acht_Bit_Multiplexer
		Port (B : in STD_LOGIC_VECTOR(7 downto 0);
				CTRL : in STD_LOGIC;
				Q : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	-- 8-Bit Addierer erzeugen
	component Acht_Bit_Addierer
		Port (A, B : in STD_LOGIC_VECTOR(7 downto 0);
				Q : out STD_LOGIC_VECTOR(7 downto 0);
				CarryIn : in STD_LOGIC;
				CarryOut : out STD_LOGIC);			
	end component;

begin

	-- Carry Bit in Abhängigkeit von der Rechenoperation (Control) setzen
	Ci <= CTRL;
	
	-- Die Zahl B in Abhängigkeit vom Control-Signal invertieren
	M1 : Acht_Bit_Multiplexer PORT MAP (B, CTRL, Mult);
	
	-- Ergebnis berechnen
	A1 : Acht_Bit_Addierer PORT MAP (A, Mult, Result, Ci, Co); 
	
	Q <= Result;
	CarryOut <= Co;
	
end Addier_Subtrahier_Werk_Arch;