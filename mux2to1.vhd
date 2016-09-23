library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
    port (
        i0, i1: in std_logic;
        sel: in std_logic;
        q: out std_logic
    );
end mux2to1;

architecture behavioural of mux2to1 is
begin

process(i0, i1, sel)
begin
case sel is
    when '0' => q <= i0;
    when '1' => q <= i1;
    when others => null;
end case;
end process;

end behavioural;

architecture rtl of mux2to1 is
begin

q <= (not sel and i0) or (sel and i1);

end rtl;
