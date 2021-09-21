LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity prime_check is
    port( sel: in std_logic;
          new_num: in std_logic_vector(10 downto 0);
          old_num: in std_logic_vector(10 downto 0);
          clock: in std_logic;
          enable: in std_logic;
			 output_num: out std_logic_vector(10 downto 0)); 
end prime_check;

architecture behavioral of prime_check is
--signal asg
begin
    process(clock)
    begin
        if (clock'event and clock='1') then
            if (enable = '1') then
					 if (sel = '0') then
						  output_num <= new_num;
					 else
						  output_num <= old_num;
					 end if;	
			   end if;
        end if;
    
    end process;  
    
end behavioral;
