library ieee;
use ieee.std_logic_1164.all;

entity tb_priority_enc is
end entity;

architecture tb of tb_priority_enc is
    component priority_enc
        port (
            in_vec : in std_logic_vector(3 downto 0);
            out_vec : out std_logic_vector(1 downto 0);
            valid : out std_logic
        );
    end component;
    signal in_vec : std_logic_vector(3 downto 0);
    signal out_vec : std_logic_vector(1 downto 0);
    signal valid : std_logic;
begin

uut: priority_enc port map(
    in_vec => in_vec,
    out_vec => out_vec,
    valid => valid
);

stimulus: process
begin
    assert false report "start of test" severity note;
    in_vec <= "0000";
    wait for 10 ns;
    assert valid = '0'
        report "should be invalid" severity error;
    in_vec <= "0001";
    wait for 10 ns;
    assert valid = '1' and out_vec = "00"
        report "not 00" severity error;
    in_vec <= "1001";
    wait for 10 ns;
    assert valid = '1' and out_vec = "11"
        report "not 11" severity error;
    assert false report "end of test" severity note;
    wait;
end process;

end architecture;
