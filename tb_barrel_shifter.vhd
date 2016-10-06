library ieee;
use ieee.std_logic_1164.all;

entity tb_barrel_shifter is
end entity;

architecture tb of tb_barrel_shifter is
    component barrel_shifter
        port (
            in_vec : in std_logic_vector(31 downto 0);
            right : in std_logic;
            rotation : in std_logic;
            count : in std_logic_vector(4 downto 0);
            out_vec : out std_logic_vector(31 downto 0)
        );
    end component;
    signal in_vec : std_logic_vector(31 downto 0);
    signal right : std_logic;
    signal rotation : std_logic;
    signal count : std_logic_vector(4 downto 0);
    signal out_vec : std_logic_vector(31 downto 0);

    function to_string(sl : std_logic) return string is
        variable sl_str : string(1 to 3); -- std_logic image with quotes around
    begin
        sl_str := std_logic'image(sl);
        return "" & sl_str(2); -- "" & character to get string
    end function;

    function to_string(slv : std_logic_vector) return string is
        alias slv_upto : std_logic_vector(1 to slv'length) is slv;
        variable sl_str : string(1 to 1);  -- String of std_logic
        variable res_v : string(1 to slv'length);
    begin
        for idx in slv_upto'range loop
            sl_str := to_string(slv_upto(idx));
            res_v(idx) := sl_str(1);
        end loop;
        return res_v;
    end function;
begin

uut: barrel_shifter port map(
    in_vec => in_vec,
    right => right,
    rotation => rotation,
    count => count,
    out_vec => out_vec
);

stimulus: process
begin
    assert false report "start of test" severity note;
    in_vec <= (3 downto 0 => '1', 31 downto 28 => '1', others => '0');
    right <= '0';
    rotation <= '0';
    count <= "00011";
    wait for 10 ns;
    assert false report "shift left" severity note;
    assert false report to_string(in_vec) severity note;
    assert false report to_string(out_vec) severity note;
    assert false report " " severity note;

    in_vec <= (3 downto 0 => '1', 31 downto 28 => '1', others => '0');
    right <= '1';
    rotation <= '0';
    count <= "00011";
    wait for 10 ns;
    assert false report "shift right" severity note;
    assert false report to_string(in_vec) severity note;
    assert false report to_string(out_vec) severity note;
    assert false report " " severity note;

    in_vec <= (3 downto 0 => '1', 31 downto 28 => '1', others => '0');
    right <= '0';
    rotation <= '1';
    count <= "00011";
    wait for 10 ns;
    assert false report "rotate left" severity note;
    assert false report to_string(in_vec) severity note;
    assert false report to_string(out_vec) severity note;
    assert false report " " severity note;

    in_vec <= (3 downto 0 => '1', 31 downto 28 => '1', others => '0');
    right <= '1';
    rotation <= '1';
    count <= "00011";
    wait for 10 ns;
    assert false report "rotate right" severity note;
    assert false report to_string(in_vec) severity note;
    assert false report to_string(out_vec) severity note;
    assert false report " " severity note;
    wait;
end process;

end architecture;
