--Store
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY STA IS
    PORT(
        ciclo   : in std_logic_vector(2 downto 0);
        saida   : out std_logic_vector(10 downto 0)
    );
END ENTITY;

architecture STORE of STA is
    begin
        
        saida(10) <= NOT ciclo(2) OR NOT ciclo(1) OR NOT ciclo(0);

        saida(9) <= NOT ciclo(1) AND (ciclo(2) XOR ciclo(0));

        saida(8) <= NOT ciclo(2) AND ciclo(1) AND NOT ciclo(0);

        saida(7) <= '0';

        saida(6) <= ciclo(2) AND ciclo(1) AND NOT ciclo(0);

        saida(5 downto 3) <= "000";

        saida(2) <= (NOT ciclo(1) AND (ciclo(2) XNOR ciclo(0))) OR
        (NOT ciclo(2) AND ciclo(1) AND ciclo(0));

        saida(1) <= (ciclo(2) AND NOT ciclo(0)) OR (NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0));

        saida(0) <= NOT ciclo(2) OR NOT ciclo(0);

END ARCHITECTURE;