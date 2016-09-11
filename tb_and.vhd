library ieee;
use ieee.std_logic_1164.all;

entity tb_and is
end entity;

architecture tb of tb_and is
    component and_gate
        port (
            a, b : in std_logic;
            q : out std_logic
        );
    end component;

    signal a: std_logic := '0';
    signal b: std_logic := '0';
    signal q: std_logic;
begin

uut: and_gate port map(
    a => a,
    b => b,
    q => q
);

stimulus: process
begin
    assert false report "start of test" severity note;
    wait for 10 ns;
    assert q = '0'
        report "'0 and 0' is not '0'" severity error;
    a <= '1';
    wait for 10 ns;
    assert q = '0'
        report "'1 and 0' is not '0'" severity error;
    b <= '1';
    wait for 10 ns;
    assert q = '1'
        report "'1 and 1' is not '1'" severity error;
    a <= '0';
    wait for 10 ns;
    assert q = '0'
        report "'0 and 1' is not '0'" severity error;
    assert false report "end of test" severity note;
    wait;
end process;

end architecture;
