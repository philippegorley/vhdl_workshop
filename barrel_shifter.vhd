library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity barrel_shifter is
    port (
        in_vec : in std_logic_vector(31 downto 0);
        right : in std_logic;
        rotation : in std_logic;
        count : in std_logic_vector(4 downto 0);
        out_vec : out std_logic_vector(31 downto 0)
    );
end entity;

-- using mux (fml)
-- architecture struct of barrel_shifter is
-- begin
--
--
--
-- end architecture;

-- using functions
architecture func of barrel_shifter is
    -- shift left/right
    function barrel_shift(
        bs_in_vec: in std_logic_vector(31 downto 0);
        sh_right: in std_logic;
        cnt: in std_logic_vector(4 downto 0)
    ) return std_logic_vector is
    begin
        if (sh_right = '1') then
            return std_logic_vector((SHR(unsigned(bs_in_vec), unsigned(cnt))));
        else
            return std_logic_vector((SHL(unsigned(bs_in_vec), unsigned(cnt))));
        end if;
    end function;

    -- rotate left/right
    function barrel_rotate(
        bs_in_vec: in std_logic_vector(31 downto 0);
        rot_right: in std_logic;
        cnt: in std_logic_vector(4 downto 0)
    ) return std_logic_vector is
        variable tmp1, tmp2: std_logic_vector(63 downto 0);
    begin
        case rot_right is
        when '1' => -- rotate right cnt times
            tmp1 := bs_in_vec & bs_in_vec; --concat
            tmp2 := std_logic_vector(SHR(unsigned(tmp1),unsigned(cnt)));
            return tmp2(31 downto 0);
        when others => -- rotate left cnt times
            tmp1 := bs_in_vec & bs_in_vec; -- concat
            tmp2 := std_logic_vector(SHL(unsigned(tmp1),unsigned(cnt)));
            return tmp2(63 downto 32);
        end case;
    end function;
begin

process(in_vec, right, rotation, count)
begin
    if (rotation = '0') then -- shift
        out_vec <= barrel_shift(in_vec, right, count);
    else -- rotate
        out_vec <= barrel_rotate(in_vec, right, count);
    end if;
end process;

end architecture;
