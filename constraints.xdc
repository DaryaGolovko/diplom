## Clock signal
set_property PACKAGE_PIN E3 [get_ports CLK]							
	set_property IOSTANDARD LVCMOS33 [get_ports CLK]
	create_clock -add -name sys_clk_pin -period 100.00 -waveform {0 1} [get_ports CLK]
 
## Switches
set_property PACKAGE_PIN U9 [get_ports {C[0]}]	 				
	set_property IOSTANDARD LVCMOS33 [get_ports {C[0]}]
set_property PACKAGE_PIN U8 [get_ports {C[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {C[1]}]
set_property PACKAGE_PIN R7 [get_ports {C[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {C[2]}]
set_property PACKAGE_PIN R6 [get_ports {C[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {C[3]}]
set_property PACKAGE_PIN R5 [get_ports {C[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {C[4]}]
set_property PACKAGE_PIN V7 [get_ports {C[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {C[5]}]
set_property PACKAGE_PIN V6 [get_ports {C[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {C[6]}]
set_property PACKAGE_PIN V5 [get_ports {C[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {C[7]}]
set_property PACKAGE_PIN P4 [get_ports {GO}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {GO}]

## LEDs
set_property PACKAGE_PIN T8 [get_ports {R}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {R}]

##Buttons
set_property PACKAGE_PIN T16 [get_ports RST]						
	set_property IOSTANDARD LVCMOS33 [get_ports RST]

 
	
