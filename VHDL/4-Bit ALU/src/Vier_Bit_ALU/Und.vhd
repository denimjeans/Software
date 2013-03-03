library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Und is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Und;

architecture Behavioral of Und is

begin

	Q <= A and B;

end Behavioral;