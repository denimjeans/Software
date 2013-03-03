----------------------------------------------------------------------------------
-- Company: 		 www.kampis-elektroecke.de
-- Engineer: 		 Daniel Kampert
-- 
-- Create Date:    21:06:13 03/01/2013 
-- Design Name: 
-- Module Name:    ALU - ALU_Arch 
-- Project Name: 
-- Target Devices: XC3S250-4E
-- Tool versions:  ISE 14.4
-- Description: 	 8-Bit Arithmetisch-Logische Einheit
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           Q : out  STD_LOGIC_VECTOR(7 downto 0);
			  F0, F1, F2, F3 : in STD_LOGIC;
			  Carryflag : out STD_LOGIC);
end ALU;

architecture ALU_Arch of ALU is

	signal C : STD_LOGIC;
	signal Und_Result : STD_LOGIC_VECTOR(7 downto 0);
	signal Oder_Result : STD_LOGIC_VECTOR(7 downto 0);
	signal XOR_Result : STD_LOGIC_VECTOR(7 downto 0);
	signal Adder_Result : STD_LOGIC_VECTOR(7 downto 0);
	signal QA, QB : STD_LOGIC_VECTOR(7 downto 0);
	
	-- 8-Bit Addierer erzeugen
	component Acht_Bit_Addierer
		Port (A, B : in STD_LOGIC_VECTOR(7 downto 0);
				Q : out STD_LOGIC_VECTOR(7 downto 0);
				CarryIn : in STD_LOGIC;
				CarryOut : out STD_LOGIC);
	end component;	

	-- 8-Bit Und erzeugen
	component Acht_Bit_Und
		Port (A : in STD_LOGIC_VECTOR(7 downto 0);
				B : in STD_LOGIC_VECTOR(7 downto 0);
				Q : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	-- 8-Bit Oder erzeugen
	component Acht_Bit_Oder
		Port (A : in STD_LOGIC_VECTOR(7 downto 0);
				B : in STD_LOGIC_VECTOR(7 downto 0);
				Q : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	-- 8-Bit XOR erzeugen
	component Acht_Bit_XOR
		Port (A : in STD_LOGIC_VECTOR(7 downto 0);
				B : in STD_LOGIC_VECTOR(7 downto 0);
				Q : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
	
	-- Eingangsstufe A
	component Eingang_A
		Port (A : in STD_LOGIC_VECTOR(7 downto 0);
				InvertA : in  STD_LOGIC;
				QA : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	-- Eingangsstufe B
	component Eingang_B
		Port (B : in STD_LOGIC_VECTOR(7 downto 0);
				EnableB : in  STD_LOGIC;
				QB : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	-- Ausgangs Multiplexer
	component Acht_Bit_Multiplexer
		    Port ( I1 : in  STD_LOGIC_VECTOR (7 downto 0);
           I2 : in  STD_LOGIC_VECTOR (7 downto 0);
           I3 : in  STD_LOGIC_VECTOR (7 downto 0);
           I4 : in  STD_LOGIC_VECTOR (7 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0);
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC);
	end component;
	
begin

	EA : Eingang_A PORT MAP (A, F3, QA);
	EB : Eingang_B PORT MAP (B, F2, QB);
	U1 : Acht_Bit_Und PORT MAP (QA, QB, Und_Result);
	O1 : Acht_Bit_Oder PORT MAP (QA, QB, Oder_Result);
	X1 : Acht_Bit_XOR PORT MAP (QA, QB, XOR_Result);
	A1 : Acht_Bit_Addierer PORT MAP (QA, QB, Adder_Result, F3, C);
	M1 : Acht_Bit_Multiplexer PORT MAP (Und_Result, Oder_Result, XOR_Result, Adder_Result, Q, F0, F1); 
	
	Carryflag <= C;

end ALU_Arch;