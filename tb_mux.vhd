library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mux is
end entity;

architecture tb of tb_mux is
    component mux4to1
        port (
            i0, i1, i2, i3: in std_logic;
            sel: in std_logic_vector(1 downto 0);
            q: out std_logic
        );
    end component;

    signal i: std_logic_vector(3 downto 0) := "0000";
    signal sel: std_logic_vector(1 downto 0) := "00";
    signal q: std_logic := '0';
begin

uut: mux4to1 port map(
    i0 => i(0),
    i1 => i(1),
    i2 => i(2),
    i3 => i(3),
    sel => sel,
    q => q
);

stimulus: process
begin
    assert false report "start of test" severity note;
    for x in 0 to 15 loop
        i <= std_logic_vector(to_unsigned(x, 4));
        for y in 0 to 3 loop
            sel <= std_logic_vector(to_unsigned(y, 2));
            wait for 5 ns;
        end loop;
    end loop;
    assert false report "end of test" severity note;
    wait;
end process;

end architecture;
