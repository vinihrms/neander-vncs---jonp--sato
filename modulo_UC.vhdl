-- neander módulo principal UC ===============================================
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY moduloUC IS
    PORT (
        rst, clk : IN STD_LOGIC;
        barramento : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        RI_nrw : IN STD_LOGIC;
        flags_nz : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        bctrl : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END ENTITY moduloUC;

ARCHITECTURE maXado OF moduloUC IS

    -- componente regAC
    COMPONENT regCarga8bit IS
        PORT (
            d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            clk : IN STD_LOGIC;
            pr, cl : IN STD_LOGIC;
            nrw : IN STD_LOGIC;
            s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    -- componente DECODE
    -- on code!

    -- componente Contador0-7
    COMPONENT contador IS
        PORT (
            preset : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            clock : IN STD_LOGIC;
            q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;
    -- componente UC-interno
    -- on code!

    -- 3bits de contador
    SIGNAL s_ciclo : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => 'Z');

    SIGNAL s_ri2dec : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => 'Z');

    -- nop, sta, lda, add, or, and, not, jmp, jn, jz, hlt
    SIGNAL s_dec2uc : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => 'Z');

    SIGNAL s_bctrl : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => 'Z');

    -- observacao
    SIGNAL instrucaoAtiva : STRING(1 TO 3);
    SIGNAL operacaoULA : STRING(1 TO 3);
    SIGNAL FLAGS : STRING(1 TO 2);

    COMPONENT LDA IS
        PORT (
            ciclo : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            saida : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
        );
    END COMPONENT;
    --fazer para todas as outras possiveis escolhas

BEGIN
    -- registrador RI
    u_regI : regCarga8bit PORT MAP(barramento, clk, '1', rst, RI_nrw, s_ri2dec);
    -- decodificador 4 para 11
    s_dec2uc <= "10000000000" WHEN s_ri2dec(7 DOWNTO 4) = "0000" ELSE --NOP
        "01000000000" WHEN s_ri2dec(7 DOWNTO 4) = "0001" ELSE --STA
        "00100000000" WHEN s_ri2dec(7 DOWNTO 4) = "0010" ELSE --LDA
        "00010000000" WHEN s_ri2dec(7 DOWNTO 4) = "0011" ELSE --ADD
        "00001000000" WHEN s_ri2dec(7 DOWNTO 4) = "0100" ELSE --OR
        "00000100000" WHEN s_ri2dec(7 DOWNTO 4) = "0101" ELSE --AND
        "00000010000" WHEN s_ri2dec(7 DOWNTO 4) = "0110" ELSE --NOT
        "00000001000" WHEN s_ri2dec(7 DOWNTO 4) = "1000" ELSE --JMP
        "00000000100" WHEN s_ri2dec(7 DOWNTO 4) = "1001" ELSE --JN
        "00000000010" WHEN s_ri2dec(7 DOWNTO 4) = "1010" ELSE --JZ
        "00000000001" WHEN s_ri2dec(7 DOWNTO 4) = "1111" ELSE --HLT
        "ZZZZZZZZZZZ"; -- POBREMA !

    -- contador
    u_contadorI : contador PORT MAP('1', rst, clk, s_ciclo);

    -- Unidade de Controle

    --um mux 11 especial
    -- EXEMPLO LDA FAZER PARA OS OUTROS BAGULHO
    s_bctrl <= sLDA when s_dec2uc = "00100000000"

    --instanciar cada uma das instrucoes
    u_load : LDA port map(s_ciclo, sLDA);

    u_halt : HLT port map(s_ciclo, sHLT); 
    --fazer um sinal para cada um

END ARCHITECTURE maXado;