LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity prime_displayer is
    port ( 
    MY_CLK: in std_logic;
    vsync: out std_logic;
    hsync: out std_logic;
    red: out std_logic_vector(2 downto 0);
    green: out std_logic_vector(2 downto 0);
    blue: out std_logic_vector(1 downto 0));
end prime_displayer;

architecture structural of prime_displayer is

    component VH_signal is
		Port (
        reset : in STD_LOGIC;
        CLK : in STD_LOGIC;
		  digit1: in STD_LOGIC_VECTOR (3 downto 0);
		  digit2: in STD_LOGIC_VECTOR (3 downto 0);
		  digit3: in STD_LOGIC_VECTOR (3 downto 0);
		  digit4: in STD_LOGIC_VECTOR (3 downto 0);
        V_sync : out STD_LOGIC;
        H_sync : out STD_LOGIC;
        output_color: out STD_LOGIC_VECTOR (7 downto 0));
	 end component;
	 
	 component clock_divider is
		port (               
         CLK: in std_logic; 
			reset : in std_logic;	      
         dividedclock: out std_logic);
	 end component;
	 
	 component nexys3_sseg_driver is
        port( 
            MY_CLK 	: in  STD_LOGIC;
            DIGIT0  : in  STD_LOGIC_VECTOR (7 downto 0);
            DIGIT1  : in  STD_LOGIC_VECTOR (7 downto 0);
            DIGIT2  : in  STD_LOGIC_VECTOR (7 downto 0);
            DIGIT3  : in  STD_LOGIC_VECTOR (7 downto 0);
            SSEG_CA : out STD_LOGIC_VECTOR (7 downto 0);
            SSEG_AN : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    component freq_divider 
        port( slowCLK: out std_logic;
          boardCLK: in std_logic; 
          reset : in std_logic);
    end component;

    component binary_to_bcd is
        port ( bin: in STD_LOGIC_VECTOR (10 downto 0);
               D0: out STD_LOGIC_VECTOR (3 downto 0);
               D1: out STD_LOGIC_VECTOR (3 downto 0);
               D2: out STD_LOGIC_VECTOR (3 downto 0);
               D3: out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component BCD_to_seven_segment is
        port ( d: in std_logic_vector (3 downto 0);
               s: out std_logic_vector ( 7 downto 0));
    end component;

    component prime_detector_circuit is
        port( Q: out std_logic_vector(10 downto 0);
              clock: in std_logic; 
              enable: in std_logic; 
              reset : in std_logic);
    end component;

signal slowCLK,quarter_clock: std_logic;
signal primeNum: std_logic_vector (10 downto 0);
signal digit1,digit2,digit3,digit4: std_logic_vector (3 downto 0);
signal output_color: std_logic_vector (7 downto 0);
begin
    f1: freq_divider PORT MAP(slowCLK,MY_CLK,'0');
    p1: prime_detector_circuit PORT MAP(primeNum,MY_CLK,slowCLK,'0');
    b1: binary_to_bcd PORT MAP(primeNum,digit1,digit2,digit3,digit4);
    v1: VH_signal PORT MAP('0',quarter_clock,digit1,digit2,digit3,digit4,vsync,hsync,output_color);
	 c1: clock_divider PORT MAP(MY_CLK,'0',quarter_clock);
	 blue <= output_color (1 downto 0);
	 green <= output_color (4 downto 2);
	 red <= output_color (7 downto 5);

end structural;


















