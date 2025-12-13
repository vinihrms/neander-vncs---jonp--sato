LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY controle IS
    PORT (
        q : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        j, k : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE controlamento OF controle IS
BEGIN

    j(0) <= '1';
    k(0) <= '1';

    j(1) <= q(0);
    k(1) <= q(0);

    j(2) <= q(1) AND q(0);
    k(2) <= q(1) AND q(0);

END ARCHITECTURE;