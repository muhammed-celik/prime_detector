----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:58:42 06/07/2021 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity clock_divider is
  port (               
         CLK: in std_logic; 
			reset : in std_logic;	      
         dividedclock: out std_logic);
end clock_divider;

ARCHITECTURE behavioral OF clock_divider IS


signal count: std_logic_vector (1 downto 0):= "00";

BEGIN
my_clock_divider: PROCESS(CLK, reset)

BEGIN
if(CLK'event and CLK='1') then
		if (reset = '1') THEN
		  count <= "00";
		else count <= count + "01";
		end if;
		
end if;

if (count = "11") then
	dividedclock <= '1';
	else dividedclock <= '0';
end if;
		

END PROCESS my_clock_divider;

END behavioral;

