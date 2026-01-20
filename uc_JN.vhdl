LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY JN IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        flags : IN STD_LOGIC_VECTOR (1 DOWNTO 0); -- flags(1)=N
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE jn OF JN IS
BEGIN


saida(10) <= NOT ciclo(2) and not flags(1);              -- snbarrINC
saida(9)  <= NOT ciclo(2) AND ciclo(0);                   -- sPC_nrw
saida(8)  <= (not ciclo(2) and ciclo(1) and not ciclo(0));   --ri                                       -- sRI_nrw
saida(7)  <= '0';                                        -- sAC_nrw
saida(6)  <= '0';                                        -- sMEM_nrw
saida(5 downto 3) <= "000";                               -- sula_op
saida(2) <= NOT ciclo(2) AND (ciclo(1) XNOR ciclo(0));    -- sREM_nrw
saida(1) <= NOT ciclo(1) AND (ciclo(2) XOR ciclo(0));     -- sRDM_nrw
saida(0) <= NOT ciclo(2) and flags(1);  -- snbarrPC
    

END ARCHITECTURE;
