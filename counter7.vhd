LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity counter7 is
    port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic; 
          reset : in std_logic);
end counter7;

architecture behavioral of counter7 is

signal count : std_logic_vector (10 downto 0) := "00000000000";

begin
counter7: process(clock, reset)

begin

if (clock'event and clock='1') then
        if (reset = '1') then
			count <= "00000000000";
        elsif(count = "00000000000") then
            count <= count + "00000001110";
        elsif(count = "11001010001") then
            count <= count;
        else 
            count <= count + "00000000111";
        end if;
end if;
Q <= count; -- assign count signal to output
END PROCESS counter7;

END behavioral;