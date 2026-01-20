LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY UC_ADD IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE UC_add OF UC_ADD IS

BEGIN
 -- LDA
    saida(10) <= '1'; -- barr_inc

    saida(9) <= (NOT ciclo(1) AND (ciclo(2) XOR ciclo(0))); -- PC nrw

    saida(8) <= (NOT ciclo(2) AND ciclo(1) AND NOT ciclo(0)); -- RI_rw

    saida(7) <= (ciclo(2) AND ciclo(1) AND ciclo(0)); -- AC_rw

    saida(6) <= '0'; -- MEM_rw

    saida(5 DOWNTO 3) <= "001"; -- ULA_op

    --saida(2) <= ((NOT ciclo(0) AND NOT ciclo(2) AND NOT ciclo(1)) OR
    --(ciclo(0) AND (ciclo(2) XOR ciclo(1)))); -- REM_rw

    saida(2) <= (NOT ciclo(1) AND (ciclo(2) XNOR ciclo(0))) OR (NOT ciclo(2) AND ciclo(1) AND ciclo(0));

    saida(1) <= ((ciclo(2) AND NOT ciclo(0)) OR
    ((NOT ciclo(2)) AND (NOT ciclo(1)) AND ciclo(0))); -- RDM_rw

    saida(0) <= NOT ciclo(2) OR ciclo(1) OR NOT ciclo(0);-- barr_PC
END ARCHITECTURE;