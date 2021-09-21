LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity decider is
    port( sel: out std_logic;
			 clock: in std_logic;
			 enable: in std_logic;
			 number_to_check: in std_logic_vector(10 downto 0); 
          count2: in std_logic_vector(10 downto 0);
          count3: in std_logic_vector(10 downto 0);
          count5: in std_logic_vector(10 downto 0);
          count7: in std_logic_vector(10 downto 0);
          count11: in std_logic_vector(10 downto 0);
          count13: in std_logic_vector(10 downto 0);
          count17: in std_logic_vector(10 downto 0);
          count19: in std_logic_vector(10 downto 0);
          count23: in std_logic_vector(10 downto 0);
          count29: in std_logic_vector(10 downto 0);
          count31: in std_logic_vector(10 downto 0);
          count37: in std_logic_vector(10 downto 0)); 
end decider;

architecture behavioral of decider is

begin
    process(clock)
    variable not_prime: std_logic;
	 variable found_prime: integer := 0;
    begin
        if(clock'event and clock='1') then
			  
			  if (enable = '1') then
					found_prime := 0;
			  end if;
			  
			  if (number_to_check = count2) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count3) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count5) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count7) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count11) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count13) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count17) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count19) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count23) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count29) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count31) then
					
					found_prime := found_prime + 1;
			  elsif (number_to_check = count37) then
					
					found_prime := found_prime + 1;
			  else
					
					found_prime := found_prime;
			  end if;
			  
			  if (found_prime = 0) then
			      sel <= '0';
					not_prime := '0';
			  else
			      sel <= '1';
					not_prime := '1';
			  end if;
			        
				 
			  
			  
		  end if;
		  
	 end process;
	 
end behavioral;