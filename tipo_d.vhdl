LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY ff_d IS
    PORT (
        d : IN STD_LOGIC;
        clock : IN STD_LOGIC;
        pr, cl : IN STD_LOGIC;
        q, nq : OUT STD_LOGIC
    );
END ff_d;
ARCHITECTURE d OF ff_d IS
    SIGNAL s_sj, s_sk : STD_LOGIC;
    SIGNAL s_snj, s_snk : STD_LOGIC;
    SIGNAL s_sns, s_snr : STD_LOGIC;
    SIGNAL s_sns2, s_snr2 : STD_LOGIC;
    SIGNAL s_eloS, s_eloR : STD_LOGIC;
    SIGNAL s_eloQ, s_elonQ : STD_LOGIC;
    SIGNAL s_nClock
    : STD_LOGIC;
BEGIN
    s_nClock <= NOT(clock);

    ------------------------------------------
    --declara J e K como D e NOT D respectivamente
    s_sj <= d;

    s_sk <= NOT(d);
    ------------------------------------------

    s_snj <= NOT(s_sj AND clock AND s_elonQ);

    s_snk <= NOT(s_sk AND clock AND s_eloQ);

    s_sns <= NOT(pr AND s_snj AND s_eloR);

    s_snr <= NOT(s_eloS AND s_snk AND cl);

    s_sns2 <= NOT(s_sns AND s_nClock);

    s_snr2 <= NOT(s_snr AND s_nClock);

    s_eloS <= NOT(pr AND s_snj AND s_eloR);

    s_eloR <= NOT(s_eloS AND s_snk AND cl);

    s_eloQ <= NOT(pr AND s_sns2 AND s_elonQ);

    s_elonQ <= NOT(cl AND s_snr2 AND s_eloQ);


    q <= NOT(pr AND s_sns2 AND s_elonQ);
    nq <= NOT(cl AND s_snr2 AND s_eloQ);

END ARCHITECTURE d;