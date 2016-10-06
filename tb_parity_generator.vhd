library ieee;
use ieee.std_logic_1164.all;

entity tb_parity_generator is
end entity;

architecture tb of tb_parity_generator is
    component parity_generator
        port (
            in_vec : in std_logic_vector(7 downto 0);
            parity : out std_logic
        );
    end component;
    signal in_vec_v : std_logic_vector(7 downto 0) := "00000000";
    signal parity_v : std_logic;
begin

uut: parity_generator port map(
    in_vec => in_vec_v,
    parity => parity_v
);

stimulus: process
begin
    assert false report "start of test" severity note;
    wait for 10 ns;
    in_vec_v <= "11111111";
    wait for 10 ns;
    assert parity_v = '0'
        report "1: parity is '1'" severity error;
    in_vec_v <= "00000001";
    wait for 10 ns;
    assert parity_v = '1'
        report "2: parity is '0'" severity error;
    in_vec_v <= "00000011";
    wait for 10 ns;
    assert parity_v = '0'
        report "3: parity is '1'" severity error;
    assert false report "end of test" severity note;
    wait;
end process;

end architecture;
