LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY regCarga8bit IS
    PORT (
        d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        clk : IN STD_LOGIC;
        pr, cl : IN STD_LOGIC;
        nrw : IN STD_LOGIC;
        s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY;
ARCHITECTURE reg8bit OF regCarga8bit IS
    COMPONENT regCarga1bit IS
        PORT (
            d : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            pr, cl : IN STD_LOGIC;
            nrw : IN STD_LOGIC;
            s : OUT STD_LOGIC

        );
    END COMPONENT;
BEGIN
    -- instâncias de regCarga1bit (8 vezes)
    u_reg0 : regCarga1bit PORT MAP(d(0), clk, pr, cl, nrw, s(0));
    u_reg1 : regCarga1bit PORT MAP(d(1), clk, pr, cl, nrw, s(1));
    u_reg2 : regCarga1bit PORT MAP(d(2), clk, pr, cl, nrw, s(2));
    u_reg3 : regCarga1bit PORT MAP(d(3), clk, pr, cl, nrw, s(3));
    u_reg4 : regCarga1bit PORT MAP(d(4), clk, pr, cl, nrw, s(4));
    u_reg5 : regCarga1bit PORT MAP(d(5), clk, pr, cl, nrw, s(5));
    u_reg6 : regCarga1bit PORT MAP(d(6), clk, pr, cl, nrw, s(6));
    u_reg7 : regCarga1bit PORT MAP(d(7), clk, pr, cl, nrw, s(7));
END ARCHITECTURE;