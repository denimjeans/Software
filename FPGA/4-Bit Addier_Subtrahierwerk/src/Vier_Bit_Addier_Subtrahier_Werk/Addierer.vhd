library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Addierer is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  CarryIn : in  STD_LOGIC;
           Q : out  STD_LOGIC;
			  CarryOut : out  STD_LOGIC);
end Addierer;

architecture Addierer_Arch of Addierer is

	signal Q1, Q2, Q3, Q4, Q5  : STD_LOGIC;
	signal CO1, CO2, CO3, CO4, CO5, CO6, CO7 : STD_LOGIC;

begin

	Q <= Q1 or Q2 or Q3 or Q4 or Q5;
	CarryOut <= CO1 or CO2 or CO3 or CO4 or CO5 or CO6 or CO7;
	
	Q1 <= (not CarryIn) and (not B) and A;
	Q2 <= (not CarryIn) and B and (not B);
	Q3 <= CarryIn and (not A) and (not B);
	Q4 <= (not CarryIn) and (((not A) and B) or (A and (not B)));
	Q5 <= CarryIn and (((not A) and (not B)) or (A and B));
	
	
	CO1 <= (not CarryIn) and A and B;
	CO2 <= A and CarryIn and (not B);
	CO3 <= B and CarryIn and (not A);	
	CO4 <= CarryIn and A and B;
	CO5 <= A and B;
	CO6 <= CarryIn and B;
	CO7 <= CarryIn and A;

end Addierer_Arch;