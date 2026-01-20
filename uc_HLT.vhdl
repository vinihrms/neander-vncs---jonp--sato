LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY HLT IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE hlt OF HLT IS

BEGIN
    -- HLT
saida(10) <= '0';  -- barr_inc

saida(9) <= '0';   -- barr_PC

saida(8) <= '0';   -- RI_rw

saida(7) <= '0';   -- AC_rw

saida(6) <= '0';   -- MEM_rw

saida(5 DOWNTO 3) <= "000";  -- ULA_op

saida(2) <= '0';   -- REM_rw

saida(1) <= '0';   -- RDM_rw

saida(0) <= '0';   -- barr_PC


END ARCHITECTURE;