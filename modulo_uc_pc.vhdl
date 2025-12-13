-- neander módulo secundario UC-PC ==================================
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY moduloPC IS
    PORT (
        rst, clk : IN STD_LOGIC;
        PC_nrw : IN STD_LOGIC;
        nbarrINC : IN STD_LOGIC;
        barramento : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        endereco : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY moduloPC;

ARCHITECTURE trucopedeseis OF moduloPC IS

    -- componente regPC
    COMPONENT regCarga8bit IS
        PORT (
            d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            clk : IN STD_LOGIC;
            pr, cl : IN STD_LOGIC;
            nrw : IN STD_LOGIC;
            s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    -- somador
    COMPONENT soma_8b IS
        PORT (
            c_in : IN BIT;
            a : IN bit_vector(7 DOWNTO 0);
            b : IN bit_vector(7 DOWNTO 0);
            s : OUT bit_vector(7 DOWNTO 0);
            c_out : OUT BIT
        );
    END COMPONENT;

    SIGNAL sendereco, s_mux2pc : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => 'Z');
    SIGNAL sadd, x, y : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => 'Z');
    SIGNAL saddc : STD_LOGIC;
    SIGNAL s_um : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";
    SIGNAL s_pcAtual : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => 'Z');

BEGIN

    -- registrador PC
    u_pc : regCarga8bit PORT MAP(s_mux2pc, clk, '1', rst, PC_nrw, s_pcAtual);
    
    -- incrementador
    x <= "00000001";
    y <= s_pcAtual;

    -- ADDER
    u_somaum : soma_8b PORT MAP('0', x, y, sadd, saddc);

    -- mux2x8
    s_mux2pc <= barramento WHEN nbarrINC = '0' ELSE
        sadd;

    endereco <= s_pcAtual; -- sendereco*************
        


END ARCHITECTURE trucopedeseis;