LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity freq_divider is
    port( slowCLK: out std_logic;
          boardCLK: in std_logic; 
          reset : in std_logic);
end freq_divider;

architecture behavioral of freq_divider is

signal count : std_logic_vector (25 downto 0) := "00000000000000000000000000";

begin
freq_divider: process(boardCLK, reset)

begin

if(boardCLK'event and boardCLK='1') then
        if (reset = '1') THEN
            count <= "00000000000000000000000000";
        else
            count <= count + "00000000000000000000000001";
        end if;
end if;

if (count = "11111111111111111111111111") then
	slowCLK <= '1';
else
	slowCLK <= '0';
end if;

END PROCESS freq_divider;

END behavioral;