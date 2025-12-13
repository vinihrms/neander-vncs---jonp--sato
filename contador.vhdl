LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY contador IS
    PORT (
        clock : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        preset : IN STD_LOGIC;
        q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE compartamento OF contador IS
    COMPONENT jk IS
        PORT (
            j, k : IN STD_LOGIC;
            clock : IN STD_LOGIC;
            pr, cl : IN STD_LOGIC;
            q, nq : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT controle IS
        PORT (
            q : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            j, k : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL sq, snq : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL sj, sk : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
    u_controle : controle PORT MAP(sq, sj, sk);

    u_ffjk0 : jk PORT MAP(sj(0), sk(0), clock, preset, reset, sq(0), snq(0));
    u_ffjk1 : jk PORT MAP(sj(1), sk(1), clock, preset, reset, sq(1), snq(1));
    u_ffjk2 : jk PORT MAP(sj(2), sk(2), clock, preset, reset, sq(2), snq(2));

    q <= sq;

END ARCHITECTURE;