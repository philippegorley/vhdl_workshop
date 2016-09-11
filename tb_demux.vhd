library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_demux is
end entity;

architecture tb of tb_demux is
    component demux1to4
        port (
            i: in std_logic;
            sel: in std_logic_vector(1 downto 0);
            q0, q1, q2, q3: out std_logic
        );
    end component;

    signal i: std_logic := '0';
    signal sel: std_logic_vector(1 downto 0) := "00";
    signal q: std_logic_vector(3 downto 0) := "0000";
begin

uut: demux1to4 port map(
    i => i,
    sel => sel,
    q0 => q(0),
    q1 => q(1),
    q2 => q(2),
    q3 => q(3)
);

stimulus: process
begin
    assert false report "start of test" severity note;
    for x in std_logic range '0' to '1' loop
        i <= std_logic(x);
        for y in 0 to 3 loop
            sel <= std_logic_vector(to_unsigned(y, 2));
            wait for 5 ns;
        end loop;
    end loop;
    assert false report "end of test" severity note;
    wait;
end process;

end architecture;
