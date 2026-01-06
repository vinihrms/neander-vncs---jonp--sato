LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY moduloULA IS
    PORT (
        rst : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        AC_nrw : IN STD_LOGIC;
        ula_op : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        mem_nrw : IN STD_LOGIC;
        flags_nz : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        barramento : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY moduloULA;

ARCHITECTURE xtranho OF moduloULA IS
    COMPONENT regCarga2Bits IS
        PORT (
            d : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            clk : IN STD_LOGIC;
            pr, cl : IN STD_LOGIC;
            nrw : IN STD_LOGIC;
            s : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT regCarga8bit IS
        PORT (
            d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            clk : IN STD_LOGIC;
            pr, cl : IN STD_LOGIC;
            nrw : IN STD_LOGIC;
            s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT moduloULAinterno IS
        PORT (
            x, y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            ula_op : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            flags_nz : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT moduloULAinterno;

    SIGNAL s_ac2ula, s_ula2ac : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL s_ula2flags : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN

    -- registrador AC
    u_regAC : regCarga8bit PORT MAP(s_ula2ac, clk, '1', rst, AC_nrw, s_ac2ula);
    -- registrador FLAGS
    u_regFlags : regCarga2Bits PORT MAP(s_ula2flags, clk, '1', rst, AC_nrw, flags_nz);

    -- modulo ULA interno
    u_ulaInterna : moduloULAinterno PORT MAP(s_ac2ula, barramento, ula_op, s_ula2flags, s_ula2ac);

    barramento <= s_ac2ula when mem_nrw = '1' else (others => 'Z');

END ARCHITECTURE xtranho;