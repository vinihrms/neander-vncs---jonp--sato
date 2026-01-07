library ieee;
use ieee.std_logic_1164.all;

entity soma_8b is
    port(
        c_in  : in  std_logic;
        a     : in  std_logic_vector(7 downto 0);
        b     : in  std_logic_vector(7 downto 0);
        s     : out std_logic_vector(7 downto 0);
        c_out : out std_logic
    );
end entity;

architecture soma_8b of soma_8b is
    component somador_1bit is
        port(
            a    : in  std_logic;
            b    : in  std_logic;
            cin  : in  std_logic;
            s    : out std_logic;
            cout : out std_logic
        );
    end component;

    signal carry : std_logic_vector(7 downto 0);
begin
    u_add0 : somador_1bit port map(a(0), b(0), c_in,  s(0), carry(0));
    u_add1 : somador_1bit port map(a(1), b(1), carry(0), s(1), carry(1));
    u_add2 : somador_1bit port map(a(2), b(2), carry(1), s(2), carry(2));
    u_add3 : somador_1bit port map(a(3), b(3), carry(2), s(3), carry(3));
    u_add4 : somador_1bit port map(a(4), b(4), carry(3), s(4), carry(4));
    u_add5 : somador_1bit port map(a(5), b(5), carry(4), s(5), carry(5));
    u_add6 : somador_1bit port map(a(6), b(6), carry(5), s(6), carry(6));
    u_add7 : somador_1bit port map(a(7), b(7), carry(6), s(7), carry(7));

    c_out <= carry(7);
end architecture;
