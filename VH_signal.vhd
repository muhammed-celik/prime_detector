LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all ;


entity VH_signal is
	Port (
        reset : in STD_LOGIC;
        CLK : in STD_LOGIC;
		  digit1: in STD_LOGIC_VECTOR (3 downto 0);
		  digit2: in STD_LOGIC_VECTOR (3 downto 0);
		  digit3: in STD_LOGIC_VECTOR (3 downto 0);
		  digit4: in STD_LOGIC_VECTOR (3 downto 0);
        V_sync : out STD_LOGIC;
        H_sync : out STD_LOGIC;
        output_color: out STD_LOGIC_VECTOR (7 downto 0) := "00000000");
end VH_signal;

architecture Behavioral of VH_signal is
-- they were 800 and 521 but the image was tilted
    signal H_count: integer range 0 to 799 := 0;
    signal V_count: integer range 0 to 520 := 0;
	 
	 
begin
    process(CLK ,reset)
	 variable shift_value: integer := 120;
    begin
        shift_value := 120;
		  if (reset = '1') then
            V_count <= 0;
            H_count <= 0;
            V_sync <= '0';
            H_sync <= '0';
        elsif CLK 'event and CLK  = '1' then
                
            H_count <= H_count + 1;
					 -- it was 800 before but the image was tilted
                if (H_count = 799) then
                    H_count <= 0;
                    V_count <= V_count + 1;
                end if;
					 
                if (H_count < 96) then
                    H_sync <= '0';
                else
                    H_sync <= '1';
                end if; 
					 
                -- it was 521 before but the image was tilted
                if (V_count = 520) then
                    V_count <= 0;
                end if;

                if (V_count < 2) then
                    V_sync <= '0';
                else
                    V_sync <= '1';
                end if;
 
-- Digit4
                if (digit4 = "0000") then
						if (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-2*shift_value and H_count < 414-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394-2*shift_value and H_count < 414-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						else
							output_color <= "00000000";
						end if;
						
					 elsif (digit4 = "0001") then
						if (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						else
							output_color <= "00000000";						
						end if;
					 
					 elsif (digit4 = "0010") then
						 if (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-2*shift_value and H_count < 414-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						else
							output_color <= "00000000";						
						end if;
						
					 elsif (digit4 = "0011") then
						if (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						else
							output_color <= "00000000";						
						end if;
						
					 elsif (digit4 = "0100") then
						if (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394-2*shift_value and H_count < 414-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						else
							output_color <= "00000000";						
						end if;
						
					 elsif (digit4 = "0101") then
						if (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-2*shift_value and H_count < 414-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						else
							output_color <= "00000000";						
						end if;
						
					 elsif (digit4 = "0110") then
						if (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-2*shift_value and H_count < 414-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394-2*shift_value and H_count < 414-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						else
							output_color <= "00000000";						
						end if;
						
					 elsif (digit4 = "0111") then
						if (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100"; 
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						else
							output_color <= "00000000";						
						end if;
						
					 elsif (digit4 = "1000") then
						if (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-2*shift_value and H_count < 414-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394-2*shift_value and H_count < 414-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						else
							output_color <= "00000000";						
						end if;
						
					 elsif (digit4 = "1001") then
						if (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-2*shift_value and H_count < 534-2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-2*shift_value and H_count < 414-2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-2*shift_value and H_count < 514-2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						else
							output_color <= "00000000";													
						end if;
					 end if;
					 
-- Digit3
                if (digit3 = "0000") then
						if (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-shift_value+40 and H_count < 414-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394-shift_value+40 and H_count < 414-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 314 and H_count < 784) then
							output_color <= "00000000";						
						end if;
						
					 elsif (digit3 = "0001") then
						if (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 314 and H_count < 784) then
							output_color <= "00000000";							
						end if;
					 
					 elsif (digit3 = "0010") then
						 if (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-shift_value+40 and H_count < 414-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 314 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit3 = "0011") then
						if (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 314 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit3 = "0100") then
						if (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394-shift_value+40 and H_count < 414-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 314 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit3 = "0101") then
						if (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-shift_value+40 and H_count < 414-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 314 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit3 = "0110") then
						if (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-shift_value+40 and H_count < 414-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394-shift_value+40 and H_count < 414-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 314 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit3 = "0111") then
						if (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100"; 
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 314 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit3 = "1000") then
						if (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-shift_value+40 and H_count < 414-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394-shift_value+40 and H_count < 414-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 314 and H_count < 784) then
							output_color <= "00000000";							
						end if;
					 elsif (digit3 = "1001") then
						if (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514-shift_value+40 and H_count < 534-shift_value+40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394-shift_value+40 and H_count < 414-shift_value+40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414-shift_value+40 and H_count < 514-shift_value+40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 314 and H_count < 784) then
							output_color <= "00000000";							
						end if;
					 end if;

-- Digit2
                if (digit2 = "0000") then
						if (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+shift_value-40 and H_count < 414+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394+shift_value-40 and H_count < 414+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 474 and H_count < 784) then
							output_color <= "00000000";						
						end if;
						
					 elsif (digit2 = "0001") then
						if (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 474 and H_count < 784) then
							output_color <= "00000000";							
						end if;
					 
					 elsif (digit2 = "0010") then
						 if (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+shift_value-40 and H_count < 414+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 474 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit2 = "0011") then
						if (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 474 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit2 = "0100") then
						if (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394+shift_value-40 and H_count < 414+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 474 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit2 = "0101") then
						if (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+shift_value-40 and H_count < 414+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 474 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit2 = "0110") then
						if (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+shift_value-40 and H_count < 414+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394+shift_value-40 and H_count < 414+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 474 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit2 = "0111") then
						if (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100"; 
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 474 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit2 = "1000") then
						if (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+shift_value-40 and H_count < 414+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394+shift_value-40 and H_count < 414+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 474 and H_count < 784) then
							output_color <= "00000000";							
						end if;
					 elsif (digit2 = "1001") then
						if (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+shift_value-40 and H_count < 534+shift_value-40 and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+shift_value-40 and H_count < 414+shift_value-40 and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+shift_value-40 and H_count < 514+shift_value-40 and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 474 and H_count < 784) then
							output_color <= "00000000";							
						end if;
					 end if; 

-- Digit 1
                if (digit1 = "0000") then
						if (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+2*shift_value and H_count < 414+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394+2*shift_value and H_count < 414+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 634 and H_count < 784) then
							output_color <= "00000000";							
						end if;
						
					 elsif (digit1 = "0001") then
						if (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 634 and H_count < 784) then
							output_color <= "00000000";						
						end if;
					 
					 elsif (digit1 = "0010") then
						 if (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+2*shift_value and H_count < 414+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 634 and H_count < 784) then
							output_color <= "00000000";						
						end if;
						
					 elsif (digit1 = "0011") then
						if (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 634 and H_count < 784) then
							output_color <= "00000000";						
						end if;
						
					 elsif (digit1 = "0100") then
						if (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394+2*shift_value and H_count < 414+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 634 and H_count < 784) then
							output_color <= "00000000";						
						end if;
						
					 elsif (digit1 = "0101") then
						if (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+2*shift_value and H_count < 414+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 634 and H_count < 784) then
							output_color <= "00000000";					
						end if;
						
					 elsif (digit1 = "0110") then
						if (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+2*shift_value and H_count < 414+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394+2*shift_value and H_count < 414+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 634 and H_count < 784) then
							output_color <= "00000000";						
						end if;
						
					 elsif (digit1 = "0111") then
						if (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100"; 
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 634 and H_count < 784) then
							output_color <= "00000000";						
						end if;
						
					 elsif (digit1 = "1000") then
						if (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+2*shift_value and H_count < 414+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 394+2*shift_value and H_count < 414+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 634 and H_count < 784) then
							output_color <= "00000000";						
						end if;
					 elsif (digit1 = "1001") then
						if (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 171 and V_count < 191) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 514+2*shift_value and H_count < 534+2*shift_value and V_count > 311 and V_count < 411) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 411 and V_count < 431) then
							output_color <= "00011100";
						elsif (H_count > 394+2*shift_value and H_count < 414+2*shift_value and V_count > 191 and V_count < 291) then
							output_color <= "00011100";
						elsif (H_count > 414+2*shift_value and H_count < 514+2*shift_value and V_count > 291 and V_count < 311) then
							output_color <= "00011100";
						elsif (H_count > 634 and H_count < 784) then
							output_color <= "00000000";						
						end if;
					 end if;					 		 
        end if;
		  
    end process;
end Behavioral;