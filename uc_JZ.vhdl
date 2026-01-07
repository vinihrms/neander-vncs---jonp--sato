LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY JZ IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        flags : IN STD_LOGIC_VECTOR (1 DOWNTO 0); -- flags(0)=Z
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE jz_arch OF JZ IS
    signal jmp_en : std_logic;
BEGIN
    -- habilita JMP se Z = 1
    jmp_en <= flags(0);

    saida(10) <= '1';

    saida(9) <= jmp_en AND
        ((NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0)) OR
         (ciclo(2) AND NOT ciclo(1) AND ciclo(0)));

    saida(8) <= jmp_en AND (NOT ciclo(2) AND ciclo(1) AND NOT ciclo(0));

    saida(7) <= '0';

    saida(6) <= '0';

    saida(5 DOWNTO 3) <= "000";

    saida(2) <= jmp_en AND
        ((NOT ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0)) OR
         (NOT ciclo(2) AND ciclo(1) AND ciclo(0)));

    saida(1) <= jmp_en AND
        ((NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0)) OR
         (ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0)));

    saida(0) <= NOT (jmp_en AND (ciclo(2) AND NOT ciclo(1) AND ciclo(0)));

END ARCHITECTURE;
