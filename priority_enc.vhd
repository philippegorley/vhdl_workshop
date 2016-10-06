library ieee;
use ieee.std_logic_1164.all;

entity priority_enc is
    port (
        in_vec : in std_logic_vector(3 downto 0);
        out_vec : out std_logic_vector(1 downto 0);
        valid : out std_logic
    );
end entity;

architecture arch of priority_enc is
begin

process(in_vec)
begin
    if in_vec(3) = '1' then
        out_vec <= "11";
        valid <= '1';
    elsif in_vec(2) = '1' then
        out_vec <= "10";
        valid <= '1';
    elsif in_vec(1) = '1' then
        out_vec <= "01";
        valid <= '1';
    elsif in_vec(0) = '1' then
        out_vec <= "00";
        valid <= '1';
    else
        out_vec <= "XX";
        valid <= '0';
    end if;
end process;

end architecture;
