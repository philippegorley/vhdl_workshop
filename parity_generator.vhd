library ieee;
use ieee.std_logic_1164.all;

entity parity_generator is
    port (
        in_vec : in std_logic_vector(7 downto 0);
        parity : out std_logic
    );
end entity;

architecture behavioural of parity_generator is
begin

process(in_vec)
    variable odd : std_logic := '0';
begin
    odd := '0';
    for i in 7 downto 0 loop
        odd := odd xor in_vec(i);
    end loop;
    parity <= odd;
end process;

end architecture;
