LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY moduloULAinterno IS
    PORT (
        x, y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        ula_op : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        flags_nz : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); -- Change made to reflect internal driving of flags
        s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY moduloULAinterno;

ARCHITECTURE thefato OF moduloULAinterno IS
    COMPONENT soma_8b IS
    PORT (
        c_in  : IN STD_LOGIC;
        a     : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        b     : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        s     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        c_out : OUT STD_LOGIC
    );
END COMPONENT;
    SIGNAL sadd, sor, sand, snot, slda, s_resultado : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL scout : STD_LOGIC;
BEGIN

    -- LDA

    slda <= y;

    -- ADD

u_somador : soma_8b PORT MAP('0', x, y, sadd, scout);
    -- OR

    sor(0) <= x(0) OR y(0);
    sor(1) <= x(1) OR y(1);
    sor(2) <= x(2) OR y(2);
    sor(3) <= x(3) OR y(3);
    sor(4) <= x(4) OR y(4);
    sor(5) <= x(5) OR y(5);
    sor(6) <= x(6) OR y(6);
    sor(7) <= x(7) OR y(7);

    -- AND
    sand(0) <= x(0) AND y(0);
    sand(1) <= x(1) AND y(1);
    sand(2) <= x(2) AND y(2);
    sand(3) <= x(3) AND y(3);
    sand(4) <= x(4) AND y(4);
    sand(5) <= x(5) AND y(5);
    sand(6) <= x(6) AND y(6);
    sand(7) <= x(7) AND y(7);

    -- NOT
    snot <= NOT(x);

    -- MULTIPLEXADOR

    s_resultado <= slda WHEN ula_op = "000" ELSE
        sadd WHEN ula_op = "001" ELSE
        sor WHEN ula_op = "010" ELSE
        sand WHEN ula_op = "011" ELSE
        snot WHEN ula_op = "100" ELSE
        (OTHERS => 'Z');

    -- DETECTOR NZ FLAGS

    --flags_nz
    -- flag N que é a flag de NEGATIVO
    flags_nz(1) <= s_resultado(7);

    -- flag Z que é a flag de ZETO

    flags_nz(0) <= NOT(s_resultado(7) OR s_resultado(6) OR s_resultado(5)
    OR s_resultado(4) OR s_resultado(3) OR s_resultado(2)
    OR s_resultado(1) OR s_resultado(0));

    s <= s_resultado;
END ARCHITECTURE thefato;