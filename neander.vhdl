LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY neander IS
    PORT (
        rst : IN STD_LOGIC;
        clk : IN STD_LOGIC
    );
END ENTITY neander;

ARCHITECTURE deumedo OF neander IS
    COMPONENT moduloMEM IS
        PORT (
            rst, clk : IN STD_LOGIC;
            nbarrPC : IN STD_LOGIC;
            REM_nrw : IN STD_LOGIC;
            MEM_nrw : IN STD_LOGIC;
            RDM_nrw : IN STD_LOGIC;
            end_PC : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            end_Barr : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            barramento : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0)
        );
    END COMPONENT moduloMEM;

    COMPONENT moduloULA IS
        PORT (
            rst : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            AC_nrw : IN STD_LOGIC;
            ula_op : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            mem_nrw : IN STD_LOGIC;
            flags_nz : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            barramento : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT moduloULA;

    COMPONENT moduloUC IS
        PORT (
            rst, clk : IN STD_LOGIC;
            barramento : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            RI_nrw : IN STD_LOGIC;
            flags_nz : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            bctrl : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
        );
    END COMPONENT moduloUC;

    COMPONENT moduloPC IS
        PORT (
            rst, clk : IN STD_LOGIC;
            PC_nrw : IN STD_LOGIC;
            nbarrINC : IN STD_LOGIC;
            barramento : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            endereco : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT moduloPC;

SIGNAL sAC_nrw, sMEM_nrw : STD_LOGIC;
SIGNAL snbarrPC, snbarrINC, sREM_nrw, sRDM_nrw, sRI_nrw, sPC_nrw : STD_LOGIC;
SIGNAL sula_op : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL sflags_nz : STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL sbarramento : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL sendereco : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL send_PC : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL sbctrl : STD_LOGIC_VECTOR(10 DOWNTO 0);


BEGIN
    u_ULA : moduloULA PORT MAP(
        rst => rst,
        clk => clk,
        AC_nrw => sAC_nrw,
        ula_op => sula_op,
        mem_nrw => sMEM_nrw,
        flags_nz => sflags_nz,
        barramento => sbarramento
    );

    u_MEM : moduloMEM PORT MAP(
        rst => rst,
        clk => clk,
        nbarrPC => snbarrPC,
        REM_nrw => sREM_nrw,
        MEM_nrw => sMEM_nrw,
        RDM_nrw => sRDM_nrw,
        end_PC => send_PC,
        end_Barr => sbarramento,
        barramento => sbarramento
    );
    ---------------------- ARRUMAR -----------------------------
    u_UC : moduloUC PORT MAP(
        rst => rst,
        clk => clk,
        barramento => sbarramento,
        RI_nrw => sRI_nrw,
        flags_nz => sflags_nz,
        bctrl => sbctrl
    );

    u_PC : moduloPC PORT MAP(
        rst => rst,
        clk => clk,
        PC_nrw => sPC_nrw,
        nbarrINC => snbarrINC,
        barramento => sbarramento,
        endereco => sendereco
    );

    snbarrINC <= sbctrl(10);
    sPC_nrw <= sbctrl(9);
    sRI_nrw <= sbctrl(8);
    sAC_nrw <= sbctrl(7);
    sMEM_nrw <= sbctrl(6);
    sula_op <= sbctrl(5 DOWNTO 3);
    sREM_nrw <= sbctrl(2);
    sRDM_nrw <= sbctrl(1);
    snbarrPC <= sbctrl(0);

    
    send_PC <= sendereco;

END ARCHITECTURE;