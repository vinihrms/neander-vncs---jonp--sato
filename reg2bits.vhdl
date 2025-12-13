LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY regCarga2Bits IS
    PORT (
        d : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        clk : IN STD_LOGIC;
        pr, cl : IN STD_LOGIC;
        nrw : IN STD_LOGIC;
        s : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END ENTITY;
ARCHITECTURE reg2bit OF regCarga2Bits IS
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

END ARCHITECTURE;