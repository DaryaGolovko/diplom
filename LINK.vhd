library IEEE;
use     IEEE.STD_LOGIC_1164.ALL; 
use     IEEE.STD_LOGIC_ARITH.ALL;
use     IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity LINK is 
    Port ( IN_A    : in STD_LOGIC; 
           IN_B    : in STD_LOGIC;
           SEL     : in STD_LOGIC; 
           OUT_A   : out STD_LOGIC;
           OUT_B   : out STD_LOGIC );   
           
    attribute dont_touch : string;
    attribute keep_hierarchy : string;
           
End LINK; 

Architecture Behavioral of LINK is 
component MUX2x1 is
    Port ( IN0 : in STD_LOGIC;
           IN1 : in STD_LOGIC;
           SEL : in STD_LOGIC;
           F   : out STD_LOGIC );
end component;

attribute dont_touch of MUX_0j : label is "yes";
attribute keep_hierarchy of MUX_0j : label is "yes";

attribute dont_touch of MUX_1j : label is "yes";
attribute keep_hierarchy of MUX_1j : label is "yes";

Begin 
    
    MUX_0j: MUX2x1 port map ( IN_A, IN_B, SEL, OUT_A ); 
    MUX_1j: MUX2x1 port map ( IN_B, IN_A, SEL, OUT_B );    
    
            
End Behavioral;
 