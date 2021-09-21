LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all;

entity binary_to_bcd is
    port ( bin: in STD_LOGIC_VECTOR (10 downto 0);
           D0: out STD_LOGIC_VECTOR (3 downto 0);
           D1: out STD_LOGIC_VECTOR (3 downto 0);
           D2: out STD_LOGIC_VECTOR (3 downto 0);
           D3: out STD_LOGIC_VECTOR (3 downto 0));
end binary_to_bcd;
    
architecture structural of binary_to_bcd is

    component add3
        port (
        B3: in STD_LOGIC;
		  B2: in STD_LOGIC;
		  B1: in STD_LOGIC;
		  B0: in STD_LOGIC;
		  D3: out STD_LOGIC;
		  D2: out STD_LOGIC;
		  D1: out STD_LOGIC;
		  D0: out STD_LOGIC);
    end component;

-- signal asg
    signal s: STD_LOGIC_VECTOR (60 downto 1);
begin
    add3_1: add3 PORT MAP('0',bin(10),bin(9),bin(8),s(1),s(2),s(3),s(4));
    add3_2: add3 PORT MAP(s(2),s(3),s(4),bin(7),s(5),s(6),s(7),s(8));
    add3_3: add3 PORT MAP(s(6),s(7),s(8),bin(6),s(9),s(10),s(11),s(12));
    add3_4: add3 PORT MAP('0',s(1),s(5),s(9),s(13),s(14),s(15),s(16));
    add3_5: add3 PORT MAP(s(10),s(11),s(12),bin(5),s(17),s(18),s(19),s(20));
    add3_6: add3 PORT MAP(s(14),s(15),s(16),s(17),s(21),s(22),s(23),s(24));
    add3_7: add3 PORT MAP(s(18),s(19),s(20),bin(4),s(25),s(26),s(27),s(28));
    add3_8: add3 PORT MAP(s(22),s(23),s(24),s(25),s(29),s(30),s(31),s(32));
    add3_9: add3 PORT MAP(s(26),s(27),s(28),bin(3),s(33),s(34),s(35),s(36));
    add3_10: add3 PORT MAP('0',s(13),s(21),s(29),s(48),s(37),s(38),s(39));
    add3_11: add3 PORT MAP(s(30),s(31),s(32),s(33),s(40),s(41),s(42),s(43));
    add3_12: add3 PORT MAP(s(34),s(35),s(36),bin(2),s(44),s(45),s(46),s(47));
    add3_13: add3 PORT MAP(s(37),s(38),s(39),s(40),s(49),s(50),s(51),s(52));
    add3_14: add3 PORT MAP(s(41),s(42),s(43),s(44),s(53),s(54),s(55),s(56));
    add3_15: add3 PORT MAP(s(45),s(46),s(47),bin(1),s(57),s(58),s(59),s(60));

    D3 <= '0' & '0' & s(48) & s(49);
    D2 <= s(50) & s(51) & s(52) & s(53);
    D1 <= s(54) & s(55) & s(56) & s(57);
    D0 <= s(58) & s(59) & s(60) & bin(0);

end structural;
    
        