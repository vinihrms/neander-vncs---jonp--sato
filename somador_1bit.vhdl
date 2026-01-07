library IEEE;
use IEEE.std_logic_1164.all;

entity somador_1bit is
    port(
        a    : in  std_logic;
        b    : in  std_logic;
        cin  : in  std_logic;
        s    : out std_logic;
        cout : out std_logic
    );
end entity somador_1bit;

architecture soma of somador_1bit is
begin
    -- soma binária de 1 bit
    s <= a xor b xor cin;

    -- carry out
    cout <= (a and b) or (a and cin) or (b and cin);
end architecture soma;
