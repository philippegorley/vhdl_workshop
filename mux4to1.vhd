library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
    port (
        i0, i1, i2, i3: in std_logic;
        sel: in std_logic_vector(1 downto 0);
        q: out std_logic
    );
end entity;

architecture structural of mux4to1 is
    component mux2to1
        port (
            i0, i1: in std_logic;
            sel: in std_logic;
            q: out std_logic
        );
    end component;

    signal mux0_out, mux1_out: std_logic;
begin

mux0: mux2to1 port map(
    i0 => i0,
    i1 => i1,
    sel => sel(0),
    q => mux0_out
);

mux1: mux2to1 port map(
    i0 => i2,
    i1 => i3,
    sel => sel(0),
    q => mux1_out
);

mux2: mux2to1 port map(
    i0 => mux0_out,
    i1 => mux1_out,
    sel => sel(1),
    q => q
);

end architecture;
