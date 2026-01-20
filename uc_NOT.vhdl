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
    -- NOT
    saida(10) <= ((NOT ciclo(2) AND NOT ciclo(1)) OR (NOT ciclo(2) AND NOT ciclo(0)) OR (ciclo(2) AND ciclo(1) AND ciclo(0))); -- barr_inc

    saida(9) <= (NOT ciclo(2) AND NOT ciclo(1)AND ciclo(0)); -- pc

    saida(8) <= (NOT ciclo(2) AND ciclo(1) AND NOT ciclo(0)); -- RI_rw

    saida(7) <= (ciclo(2) AND ciclo(1) AND ciclo(0)); -- AC_rw

    saida(6) <= '0'; -- MEM_rw

    saida(5 DOWNTO 3) <= "100"; -- ULA_op

    saida(2) <= (NOT ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0)); -- REM_rw

    saida(1) <= (NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0)); -- RDM_rw

    saida(0) <= ((NOT ciclo(2) AND NOT ciclo(1)) OR (NOT ciclo(2) AND NOT ciclo(0)) OR (ciclo(2) AND ciclo(1) AND ciclo(0))); -- barr_inc

END ARCHITECTURE;