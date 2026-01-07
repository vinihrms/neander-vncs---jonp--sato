library ieee;
use ieee.std_logic_1164.all;

entity NOP is
    port(
        ciclo   : in std_logic_vector(2 downto 0);
        saida   : out std_logic_vector(10 downto 0)
    );
end entity;

architecture nop of NOP is
    begin
        saida(10)           <= '1';
        
        saida(9)            <= NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0);
        
        saida(8)            <= NOT ciclo(2) AND  ciclo(1) AND NOT ciclo(0);
        
        saida(7)            <= '0';
        
        saida(6)            <= '0';
        
        saida(5 downto 3)   <= "000";
        
        saida(2)            <= NOT ciclo(2) AND NOT ciclo(1) AND NOT ciclo(0);
        
        saida(1)            <= NOT ciclo(2) AND NOT ciclo(1) AND ciclo(0);
        
        saida(0)            <= '1';


end architecture nop;