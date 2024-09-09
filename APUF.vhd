library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;
use     IEEE.STD_LOGIC_ARITH.ALL;
use     IEEE.STD_LOGIC_UNSIGNED.ALL; 

Entity APUF is 
    Generic ( N : integer := 8 );
    Port ( RST : in STD_LOGIC; 
           GO  : in STD_LOGIC; 
           CLK : in STD_LOGIC;
           C   : in STD_LOGIC_VECTOR ( N-1 downto 0 );
           R   : out STD_LOGIC );
           
attribute dont_touch : string;
attribute keep_hierarchy : string;
                                                                                                                                                                                                                                      
End APUF;

Architecture Struct of APUF is

component PG is
    Port ( RST   : in STD_LOGIC;
           GO    : in STD_LOGIC;
           CLK   : in STD_LOGIC;
           OUT_A : out STD_LOGIC;
           OUT_B : out STD_LOGIC );
end component;

component CHAIN is 
    Generic ( N : integer );
    Port ( IN_A   : in STD_LOGIC; 
           IN_B   : in STD_LOGIC; 
           OUT_A  : out STD_LOGIC; 
           OUT_B  : out STD_LOGIC;
           C      : in STD_LOGIC_VECTOR ( N-1 downto 0 ) ); 
end component;

component DFF is          
    Port ( D   : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RESET   : in STD_LOGIC;
           Q   : out STD_LOGIC );
end component;

signal a_in,b_in   : std_logic;
signal a_out,b_out : std_logic;

attribute dont_touch of DFF : component is "yes";
attribute keep_hierarchy of DFF : component is "yes";

attribute dont_touch of a_out : signal is "yes";
attribute keep_hierarchy of a_out : signal is "yes";
attribute dont_touch of b_out : signal is "yes";
attribute keep_hierarchy of b_out : signal is "yes";
attribute dont_touch of a_in : signal is "yes";
attribute keep_hierarchy of a_in : signal is "yes";
attribute dont_touch of b_in : signal is "yes";
attribute keep_hierarchy of b_in : signal is "yes";

Begin 

PG_unit:        PG    port map    ( RST, GO, CLK, a_in , b_in );
CHAIN_unit:     CHAIN generic map ( N ) 
                      port map    ( a_in , b_in, a_out, b_out, C ); 
ARBITER_unit:   DFF   port map    ( a_out, b_out, RST, R );
End Struct;
          
