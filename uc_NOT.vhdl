--Not
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY UC_NOT IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE UC_not OF UC_NOT IS

BEGIN
    saida(10) <= '1';

    saida(9) <= NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0);

    saida(8) <= NOT ciclo(2) AND ciclo(1) AND NOT ciclo(0);

    saida(7) <= ciclo(2) AND ciclo(1) AND ciclo(0);

    saida(6) <= '0';

    saida(5 DOWNTO 3) <= "100";

    saida(2) <= NOT ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0);

    saida(1) <= NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0);

    saida(0) <= '1';

END ARCHITECTURE;