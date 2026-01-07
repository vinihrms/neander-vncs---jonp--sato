LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY moduloMEM IS
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
END ENTITY moduloMEM;

ARCHITECTURE dropabelico OF moduloMEM IS
    COMPONENT regCarga8bit IS
        PORT (
            d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            clk : IN STD_LOGIC;
            pr, cl : IN STD_LOGIC;
            nrw : IN STD_LOGIC;
            s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT as_ram IS
        PORT (
            addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            data : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            notrw : IN STD_LOGIC;
            reset : IN STD_LOGIC
        );
    END COMPONENT as_ram;

    SIGNAL s_mux2rem, s_rem2mem, s_mem2rdm
    : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => 'Z');
    SIGNAL s_rdm2barr : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => 'Z');
BEGIN

    -- mux 2 x 8
    s_mux2rem <= end_Barr WHEN nbarrPC = '0' ELSE
        end_PC;

    --registrador REM

    u_regREM : regCarga8bit PORT MAP(s_mux2rem, clk, '1', rst, REM_nrw, s_rem2mem);
    --memoria 
    u_mem : as_ram PORT MAP(s_rem2mem, s_mem2rdm, MEM_nrw, rst);

    --registrador RDM
    u_regRDM : regCarga8bit PORT MAP(s_mem2rdm, clk, '1', rst, RDM_nrw, s_rdm2barr);
    
    -- isso é TRAP (MIXTAPE) killer vai brandaozin lanca aquele slatt !
    barramento <= s_rdm2barr when MEM_nrw = '0' else (others => 'Z');
    s_mem2rdm <= barramento when MEM_nrw = '1'else (others => 'Z');
    

END ARCHITECTURE dropabelico;