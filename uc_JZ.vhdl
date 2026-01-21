LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY JZ IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        flags : IN STD_LOGIC_VECTOR (1 DOWNTO 0); -- flags(0)=Z
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE jayz OF JZ IS
BEGIN

    -- JZ - Jump Zero (se flags(0) = 1)

    -- snbarrINC: quando Z=1, igual ao JMP; quando Z=0, sempre incrementa (nao pula)
    saida(10) <= (NOT ciclo(2) OR (NOT ciclo(1) AND NOT ciclo(0))) WHEN flags(0) = '1' ELSE '1';

    -- sPC_nrw: quando Z=1, carrega PC no ciclo 3; quando Z=0 nao carrega
    saida(9) <= (NOT ciclo(1) AND ciclo(0)) WHEN flags(0) = '1' ELSE 
                (NOT ciclo(2) AND ciclo(0));  -- incrementa normalmente se Z=0

    -- sRI_nrw: igual ao JMP
    saida(8) <= (NOT ciclo(2) AND ciclo(1) AND NOT ciclo(0));

    saida(7) <= '0';  -- sAC_nrw
    saida(6) <= '0';  -- sMEM_nrw
    saida(5 DOWNTO 3) <= "000";  -- sula_op

    -- sREM_nrw: igual ao JMP
    saida(2) <= ((NOT ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0)) OR 
                 (NOT ciclo(2) AND ciclo(1) AND ciclo(0)));

    -- sRDM_nrw: igual ao JMP
    saida(1) <= ((NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0)) OR 
                 (ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0)));

    -- snbarrPC: quando Z=1, igual ao JMP endereco do barramento; quando Z=0 nao pula
    saida(0) <= (NOT ciclo(2) OR NOT ciclo(1)) WHEN flags(0) = '1' ELSE '1';

END ARCHITECTURE;
