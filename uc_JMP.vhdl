LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY JMP IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE jump OF JMP IS

BEGIN
    -- JMP
saida(10) <= (NOT ciclo(2) OR (NOT ciclo(1) AND NOT ciclo(0)));   -- barr_inc A'+B'C'

saida(9) <= (NOT ciclo(1) AND ciclo(0));  -- sPC_nrw

saida(8) <= (NOT ciclo(2) AND ciclo(1) AND NOT ciclo(0));  -- sRI_nrw

saida(7) <= '0';  -- sAC_nrw

saida(6) <= '0';  -- sMEM_nrw

saida(5 DOWNTO 3) <= "000";  -- sula_op

saida(2) <= ((NOT ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0)) OR 
             (NOT ciclo(2) and ciclo(1) and ciclo(0)));  -- sREM_nrw

saida(1) <= ((NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0)) OR 
             (ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0)));  -- sRDM_nrw

saida(0) <= (NOT ciclo(2) OR NOT ciclo(1));  -- snbarrPC


END ARCHITECTURE;