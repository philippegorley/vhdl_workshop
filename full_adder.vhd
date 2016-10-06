library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        a, b, cin : in std_logic;
        s, cout : out std_logic
    );
end entity;

architecture arch of full_adder is
    component half_adder
        port (
            a, b : in std_logic;
            c, s : out std_logic
        );
    end component;
    signal inter_sum, cout1, cout2 : std_logic;
begin

ha0 : half_adder port map(
    a => a,
    b => b,
    c => cout1,
    s => inter_sum
);

ha1 : half_adder port map(
    a => cin,
    b => inter_sum,
    c => cout2,
    s => s
);

cout <= cout1 or cout2;

end architecture;
