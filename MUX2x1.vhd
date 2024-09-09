library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;
use     IEEE.STD_LOGIC_ARITH.ALL;
use     IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity MUX2x1 is
    Port ( IN0 : in STD_LOGIC;
           IN1 : in STD_LOGIC;
           SEL : in STD_LOGIC;
           F   : out STD_LOGIC );   

End MUX2x1;

Architecture Beh of MUX2x1 is   
Begin

    F <= IN0 when ( SEL = '0' ) else IN1;
    
End Beh; 
