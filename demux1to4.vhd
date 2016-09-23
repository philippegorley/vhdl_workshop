library ieee;
use ieee.std_logic_1164.all;

entity demux1to4 is
    port (
        i: in std_logic;
        sel: in std_logic_vector(1 downto 0);
        q0, q1, q2, q3: out std_logic
    );
end demux1to4;

architecture arch of demux1to4 is
    signal i_sel: std_logic_vector(2 downto 0);
    signal f: std_logic_vector(3 downto 0);
begin

-- if i = 0, set to 0000
i_sel <= i & sel(1) & sel(0);
f <= "0001" when i_sel = "100" else
     "0010" when i_sel = "101" else
     "0100" when i_sel = "110" else
     "1000" when i_sel = "111" else
     "0000";

q0 <= f(0);
q1 <= f(1);
q2 <= f(2);
q3 <= f(3);

end architecture;
