library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Oder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Oder;

architecture Oder_Arch of Oder is

begin

	Q <= A or B;

end Oder_Arch;

