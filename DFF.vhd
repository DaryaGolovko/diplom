library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;
use     IEEE.STD_LOGIC_ARITH.ALL;
use     IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity DFF is 
    Port ( D   : in STD_LOGIC; 
           CLK : in STD_LOGIC;
           RESET   : in STD_LOGIC; 
           Q   : out STD_LOGIC );  
      
End DFF;

Architecture Beh of DFF is 

signal state: std_logic;

Begin 

    MAIN: process( D, CLK, RESET ) 
    begin 
        if ( RESET = '1' ) then 
            state <= '0';
        elsif rising_edge( CLK ) then
            state <= D; 
        end if;
    end process;
    
    Q <= state;
    
End Beh;