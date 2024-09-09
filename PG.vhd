library IEEE;
use     IEEE.STD_LOGIC_1164.ALL; 
use     IEEE.STD_LOGIC_ARITH.ALL;
use     IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity PG is 
    Port ( RST   : in STD_LOGIC; 
           GO    : in STD_LOGIC; 
           CLK   : in STD_LOGIC;
           OUT_A : out STD_LOGIC; 
           OUT_B : out STD_LOGIC ); 

End PG;

Architecture Behavioral of PG is

signal state : std_logic;
signal cnt   : std_logic_vector( 1 downto 0 );


Begin 

    MAIN: process( RST, GO, CLK, cnt )
    begin 
        if ( RST = '1' ) then 
            state <= '0';
            cnt   <= "00";
        elsif rising_edge( CLK ) then
            if ( GO = '1' ) then
                if ( cnt = "10" ) then 
                    state <= '0'; 
                else 
                    cnt <= cnt + 1;
                    state <= not state;
                end if;
            end if;
        end if;
    end process; 

OUT_A <= state;
OUT_B <= state;

End Behavioral;