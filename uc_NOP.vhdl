LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NOP IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE nop OF NOP IS
BEGIN
    -- NOP
        saida(10)           <= NOT ciclo(2) AND (NOT ciclo(1) OR NOT ciclo(0));
        saida(9)            <= NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0);
        saida(8)            <= NOT ciclo(2) AND ciclo(1) AND NOT ciclo(0);
        saida(7)            <= '0';
        saida(6)            <= '0';
        saida(5 downto 3)   <= "000";
        saida(2)            <= NOT ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0);
        saida(1)            <= NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0);
        saida(0)            <= NOT ciclo(2) AND (NOT ciclo(1) OR NOT ciclo(0));

END ARCHITECTURE nop;