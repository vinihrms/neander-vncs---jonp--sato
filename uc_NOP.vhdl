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
            -- NOT(BUS)/INC
        saida(10)           <= NOT ciclo(2) AND (NOT ciclo(1) OR NOT ciclo(0));
        -- NOT(BUS)/PC
        saida(0)            <= NOT ciclo(2) AND (NOT ciclo(1) OR NOT ciclo(0));
        -- ULA_OP
        saida(5 downto 3)   <= "000";
        -- PC_NOT(READ)/WRITE
        saida(9)            <= NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0);
        -- AC_NOT(READ)/WRITE
        saida(7)            <= '0';
        -- MEM_NOT(READ)/WRITE
        saida(6)            <= '0';
        -- REM_NOT(READ)/WRITE
        saida(2)            <= NOT ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0);
        -- RDM_NOT(READ)/WRITE
        saida(1)            <= NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0);
        -- RI_NOT(READ)/WRITE
        saida(8)            <= NOT ciclo(2) AND ciclo(1) AND NOT ciclo(0);

END ARCHITECTURE nop;