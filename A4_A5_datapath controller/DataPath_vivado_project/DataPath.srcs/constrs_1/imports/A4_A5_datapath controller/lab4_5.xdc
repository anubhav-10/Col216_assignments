## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -of_objects [get_cells <cellname>]]

set_property SEVERITY {Warning}  [get_drc_checks LUTLP-1]

set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


## LEDs
set_property PACKAGE_PIN U16 [get_ports {reg_out[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[0]}]
set_property PACKAGE_PIN E19 [get_ports {reg_out[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[1]}]
set_property PACKAGE_PIN U19 [get_ports {reg_out[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[2]}]
set_property PACKAGE_PIN V19 [get_ports {reg_out[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[3]}]
set_property PACKAGE_PIN W18 [get_ports {reg_out[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[4]}]
set_property PACKAGE_PIN U15 [get_ports {reg_out[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[5]}]
set_property PACKAGE_PIN U14 [get_ports {reg_out[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[6]}]
set_property PACKAGE_PIN V14 [get_ports {reg_out[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[7]}]
set_property PACKAGE_PIN V13 [get_ports {reg_out[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[8]}]
set_property PACKAGE_PIN V3 [get_ports {reg_out[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[9]}]
set_property PACKAGE_PIN W3 [get_ports {reg_out[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[10]}]
set_property PACKAGE_PIN U3 [get_ports {reg_out[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[11]}]
set_property PACKAGE_PIN P3 [get_ports {reg_out[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[12]}]
set_property PACKAGE_PIN N3 [get_ports {reg_out[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[13]}]
set_property PACKAGE_PIN P1 [get_ports {reg_out[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[14]}]
set_property PACKAGE_PIN L1 [get_ports {reg_out[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reg_out[15]}]
	

##Buttons
set_property PACKAGE_PIN U18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]