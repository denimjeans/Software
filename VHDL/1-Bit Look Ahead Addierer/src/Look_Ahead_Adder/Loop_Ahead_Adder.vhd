----------------------------------------------------------------------------------
-- Company: 		 www.kampis-elektroecke.de
-- Engineer: 		 Daniel Kampert
-- 
-- Create Date:    13:37:38 03/01/2013 
-- Design Name: 
-- Module Name:    Look_Ahead_Adder - Look_Ahead_Adder_Arch 
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

entity Look_Ahead_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CarryIn : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Gen : out  STD_LOGIC;
           Propagate : out  STD_LOGIC);
end Look_Ahead_Adder;

architecture Look_Ahead_Adder_Arch of Look_Ahead_Adder is

	signal P1 : STD_LOGIC;

begin

	P1 <= A xor B;
	Propagate <= P1;
	Gen <= A and B;
	Q <= P1 xor CarryIn;

end Look_Ahead_Adder_Arch;

