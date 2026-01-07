LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY LDA IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE load OF LDA IS

BEGIN
    saida(10) <= '1';

    saida(9) <= ciclo(1) AND (ciclo(2) XOR ciclo(0));

    saida(8) <= ciclo(2) AND ciclo(1) AND ciclo(0);

    saida(7) <= ciclo(2) AND ciclo(1) AND ciclo(0);

    saida(6) <= '0';

    saida(5 DOWNTO 3) <= "000";

    saida(2) <= (ciclo(1) AND (ciclo(2) XNOR ciclo(0))) OR
    (ciclo(2) AND ciclo(1) AND ciclo(0));

    saida(1) <= (ciclo(2) AND ciclo(0)) OR
    (ciclo(2) AND ciclo(1) AND ciclo(0));

    saida(0) <= NOT(ciclo(2) AND NOT ciclo(1) AND ciclo(0));

END ARCHITECTURE;