library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder is
end entity;

architecture tb of tb_full_adder is
    component full_adder
        port (
            a, b, cin : in std_logic;
            s, cout : out std_logic
        );
    end component;
    signal a, b, cin, s, cout : std_logic;
begin

uut: full_adder port map(
    a => a,
    b => b,
    cin => cin,
    s => s,
    cout => cout
);

stimulus: process
begin
    assert false report "start of test" severity note;
    a <= '0';
    b <= '0';
    cin <= '0';
    wait for 10 ns;
    assert s = '0' and cout = '0'
        report "s and cout aren't 0" severity error;
    a <= '1';
    b <= '1';
    cin <= '1';
    wait for 10 ns;
    assert s = '1' and cout = '1'
        report "s and cout aren't 1" severity error;
    assert false report "end of test" severity note;
    wait;
end process;

end architecture;
