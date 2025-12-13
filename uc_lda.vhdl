LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY LDA IS
    PORT (
        ciclo : IN STD_LOGIC_VECTOR (2 downto 0);
        saida : OUT STD_LOGIC_VECTOR(10 downto 0);
    );
END ENTITY;

ARCHITECTURE load OF LDA IS
    

BEGIN

    saida(10) <= 1; --NBARRINC
    saida(9) <= not ciclo(2) or ciclo(1) or not ciclo(0); --nbarrpc
    saida(8 downto 6) <= "000";
    saida(5) <= not ciclo(1) and (ciclo(2)xor ciclo (0));
    saida(4) <= 1;
    saida(3) <= 1;
    saida(2) <= 1;
    saida(1) <= 1;
    saida(0) <= 1;

    

END ARCHITECTURE;