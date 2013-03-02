library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Acht_Bit_Multiplexer is
    Port ( I1 : in  STD_LOGIC_VECTOR(7 downto 0);
           I2 : in  STD_LOGIC_VECTOR(7 downto 0);
           I3 : in  STD_LOGIC_VECTOR(7 downto 0);
           I4 : in  STD_LOGIC_VECTOR(7 downto 0);
           O : out  STD_LOGIC_VECTOR(7 downto 0);
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC);
end Acht_Bit_Multiplexer;

architecture Acht_Bit_Multiplexer_Arch of Acht_Bit_Multiplexer is

	signal S : STD_LOGIC_VECTOR(1 downto 0);

begin

	S <= S1 & S0;
	
   process (S, I1, I2, I3, I4) is
   begin
      case S is
         when "00"  => O <= I1;
         when "01"  => O <= I2;
         when "10"  => O <= I3;
         when "11"  => O <= I4;
         when others => O <= "01010101";
      end case;
   end process;
	
end Acht_Bit_Multiplexer_Arch;