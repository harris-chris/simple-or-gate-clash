# FPGA Configuration I/O Options
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

# Clock
create_clock -period 10 -name CLK -waveform {0.0 5.0} [get_ports clk];
set_property -dict {PACKAGE_PIN E3  IOSTANDARD LVCMOS33} [get_ports clk];

# Others
set_property -dict {PACKAGE_PIN C2  IOSTANDARD LVCMOS33} [get_ports rst];
set_property -dict {PACKAGE_PIN C11 IOSTANDARD LVCMOS33} [get_ports en];

# Switches
set_property -dict {PACKAGE_PIN A8  IOSTANDARD LVCMOS33} [get_ports eta];

# LEDs
set_property -dict {PACKAGE_PIN H5  IOSTANDARD LVCMOS33} [get_ports result];


