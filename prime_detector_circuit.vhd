LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity prime_detector_circuit is
    port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic; 
          enable: in std_logic; 
          reset : in std_logic);
end prime_detector_circuit;

architecture structural of prime_detector_circuit is

    component counter2 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component counter3 is
        port( Q: out std_logic_vector(10 downto 0);
        clock: in std_logic;  
        reset : in std_logic);
    end component;

    component counter5 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component counter7 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component counter11 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component counter13 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component counter17 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component counter19 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component counter23 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component counter29 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component counter31 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component counter37 is
        port( Q: out std_logic_vector(10 downto 0);
          clock: in std_logic;  
          reset : in std_logic);
    end component;

    component decider is
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
    end component;

    component prime_check is
        port( sel: in std_logic;
              new_num: in std_logic_vector(10 downto 0);
              old_num: in std_logic_vector(10 downto 0);
              clock: in std_logic;
              enable: in std_logic;  
              output_num: out std_logic_vector(10 downto 0)); 
    end component;

    component slow_counter is
        port( Q: out std_logic_vector(10 downto 0);
              clock: in std_logic; 
              enable: in std_logic;
              reset : in std_logic);
    end component;


--signal asg
SIGNAL currentNum,out2,out3,out5,out7,out11,out13,out17,out19,out23,out29,out31,out37: STD_LOGIC_VECTOR (10 downto 0);
SIGNAL oldNum: STD_LOGIC_VECTOR (10 downto 0);
SIGNAL sel: STD_LOGIC;
begin
    
	 sc: slow_counter PORT MAP(currentNum,clock,enable,'0');
    c1: counter2 PORT MAP(out2,clock,enable);
    c2: counter3 PORT MAP(out3,clock,enable);
    c3: counter5 PORT MAP(out5,clock,enable);
    c4: counter7 PORT MAP(out7,clock,enable);
    c5: counter11 PORT MAP(out11,clock,enable);
    c6: counter13 PORT MAP(out13,clock,enable);
    c7: counter17 PORT MAP(out17,clock,enable);
    c8: counter19 PORT MAP(out19,clock,enable);
    c9: counter23 PORT MAP(out23,clock,enable);
    c10: counter29 PORT MAP(out29,clock,enable);
    c11: counter31 PORT MAP(out31,clock,enable);
    c12: counter37 PORT MAP(out37,clock,enable);
    d1: decider PORT MAP(sel,clock,enable,currentNum,out2,out3,out5,out7,out11,out13,out17,out19,out23,out29,out31,out37);
    p1: prime_check PORT MAP(sel,currentNum,oldNum,clock,enable,oldNum);
	 Q <= oldNum;
	 
	 
	 
	 
end structural;