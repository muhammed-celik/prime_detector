LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity slow_counter is
    port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic; 
          enable: in std_logic;
			 reset : in std_logic);
end slow_counter;

architecture behavioral of slow_counter is

signal count : std_logic_vector (10 downto 0) := "00000000000";

begin
slow_counter: process(clock, reset)

begin

if (clock'event and clock='1') then
        if (reset = '1') then
			count <= "00000000000";
		  elsif (count = "11001010011") then
		   count <= "00000000010";
        elsif (enable = '1') then
            if (count = "00000000000") then
					count <= "00000000010";
				else
					count <= count + "00000000001";
				end if;
		  else 
            count <= count;
        end if;
end if;
Q <= count; -- assign count signal to output
END PROCESS slow_counter;

END behavioral;