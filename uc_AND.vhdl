LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY UC_AND IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE UC_and OF UC_AND IS

BEGIN
    -- AND
    saida(10) <= '1'; -- barr_inc

    saida(9) <= (NOT ciclo(1) AND (ciclo(2) XOR ciclo(0))) OR
    (ciclo(2) AND ciclo(1) AND ciclo(0)); -- sPC_nrw

    saida(8) <= (NOT ciclo(2) AND ciclo(1) AND NOT ciclo(0)); -- sRI_nrw

    saida(7) <= (ciclo(2) AND ciclo(1) AND ciclo(0)); -- sAC_nrw

    saida(6) <= '0'; -- sMEM_nrw

    saida(5 DOWNTO 3) <= "011"; -- sula_op

    saida(2) <= ((NOT ciclo(0) AND NOT ciclo(2) AND NOT ciclo(1)) OR
    (ciclo(0) AND (ciclo(2) XOR ciclo(1)))); -- sREM_nrw

    saida(1) <= ((ciclo(2) AND NOT ciclo(0)) OR
    ((NOT ciclo(2)) AND (NOT ciclo(1)) AND ciclo(0))); -- sRDM_nrw

    saida(0) <= (NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0)); -- snbarrPC
END ARCHITECTURE;