library ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regCarga1bit IS
    PORT (
        d : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        pr, cl : IN STD_LOGIC;
        nrw : IN STD_LOGIC;
        s : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE reg1bit OF regCarga1bit IS
    COMPONENT ff_d IS
        PORT (
            d : IN STD_LOGIC;  
            clock : IN STD_LOGIC;
            pr, cl : IN STD_LOGIC;
            q, nq : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL datain, dataout : STD_LOGIC;
    
BEGIN
    -- envio de dataout para saída s

    s <= dataout;

    -- multiplexador
    datain <= dataout when nrw = '0' else d;

    

    -- nrw = 1 -> entrada principal de interface d
    -- nrw = 0 -> saida temporária dataout (mantém estado)

    -- instância do reg (mapeamento por nome para evitar ordens erradas)
    u_reg : ff_d PORT MAP(
        d => datain,
        clock => clk,
        pr => pr,
        cl => cl,
        q => dataout
    );
END ARCHITECTURE;