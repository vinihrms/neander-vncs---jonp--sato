LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY HLT IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE hlt OF HLT IS

BEGIN
    saida(10) <= '1';

    saida(9) <= '0';

    saida(8) <= '0';

    saida(7) <= '0';

    saida(6) <= '0';

    saida(5 DOWNTO 3) <= "000";

    saida(2) <= '0';

    saida(1) <= '0';

    saida(0) <= '1';

END ARCHITECTURE;