library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity testbench is
end testbench;

architecture Behavioral of testbench is
constant N : integer := 8;
    component APUF 
        Port ( RST : in STD_LOGIC; 
               GO  : in STD_LOGIC; 
               CLK : in STD_LOGIC;
               C   : in STD_LOGIC_VECTOR ( N-1 downto 0 );
               R   : out STD_LOGIC );
    end component;
    

signal RST: std_logic := '0';
signal GO: std_logic := '0';
signal CLK: std_logic := '0';
signal R: std_logic;
signal C: std_logic_vector(N-1 downto 0);

begin
    uut: APUF
        port map (
            RST => RST,
            CLK => CLK,
            GO => GO,
            C => C,
            R => R );
            
            
    clk_process: process
    begin
        while true loop
            CLK <= '0';
            wait for 30 ns;
            CLK <= '1';
            wait for 30 ns;         
        end loop;
    end process;
    
    stim_process: process
    begin
        wait for 24 ns;
        
        RST <= '1';
        wait for 10 ns;   
        RST <= '0';
        
        for i in 0 to 2**N-1 loop        
            RST <= '1';
            wait for 10 ns; 
            RST <= '0'; 
            wait for 10 ns; 
            
            C <= std_logic_vector(TO_UNSIGNED(i, N)); 
            GO <= '1';
            wait for 200 ns;
            GO <= '0';  
            wait for 20 ns; 
        end loop;  
    
    end process;   
    
end architecture Behavioral;
