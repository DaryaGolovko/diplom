library IEEE;
use     IEEE.STD_LOGIC_1164.ALL; 
use     IEEE.STD_LOGIC_ARITH.ALL;
use     IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity CHAIN is  
    Generic( N   : integer := 8 );
    Port ( IN_A  : in STD_LOGIC;
           IN_B  : in STD_LOGIC;
           OUT_A : out STD_LOGIC;
           OUT_B : out STD_LOGIC;     
           C : in STD_LOGIC_VECTOR ( N-1 downto 0 ) ); 
           
attribute dont_touch : string;
attribute keep_hierarchy : string;

End CHAIN; 
 
Architecture Beh of CHAIN is 
component LINK is  
    Port ( IN_A  : in STD_LOGIC;
           IN_B  : in STD_LOGIC;
           SEL   : in STD_LOGIC;
           OUT_A : out STD_LOGIC;
           OUT_B : out STD_LOGIC ); 
end component;

attribute dont_touch of LINK : component is "yes";
attribute keep_hierarchy of LINK : component is "yes";

signal a,b: std_logic_vector( N downto 0 );

attribute dont_touch of GCHAIN_N : label is "yes";
attribute keep_hierarchy of GCHAIN_N : label is "yes";

Begin 
a( 0 ) <= IN_A; 
b( 0 ) <= IN_B;

GCHAIN_N: for i in 0 to N-1 generate 
    LINKi: LINK port map ( a( i ), b( i ), C( i ), a( i+1 ), b( i+1 ) );
end generate;

OUT_A <= a( N );
OUT_B <= b( N ); 

End Beh;
