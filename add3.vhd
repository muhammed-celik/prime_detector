LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all;

entity add3 is
    port (B3: in STD_LOGIC;
          B2: in STD_LOGIC;
          B1: in STD_LOGIC;
          B0: in STD_LOGIC;
          D3: out STD_LOGIC;
          D2: out STD_LOGIC;
          D1: out STD_LOGIC;
          D0: out STD_LOGIC);
end add3;

architecture dataflow of add3 is

begin
    D3 <= B3 or (B2 and B1) or (B2 and B0);
    D2 <= (B3 and B0) or (B2 and not B1 and not B0) or (B3 and B2);
    D1 <= (not B2 and B1) or (B1 and B0) or (B3 and not B0);
    D0 <= (not B3 and not B2 and B0) or (B2 and B1 and not B0) or (B3 and not B0);
end dataflow;
