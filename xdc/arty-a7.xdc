# FPGA Configuration I/O Options
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

# Slide Switches
set_property -dict {PACKAGE_PIN A8  IOSTANDARD LVCMOS33} [get_ports A];
set_property -dict {PACKAGE_PIN C11 IOSTANDARD LVCMOS33} [get_ports B];

# LEDs
set_property -dict {PACKAGE_PIN H5  IOSTANDARD LVCMOS33} [get_ports O];

# Clock
set_property -dict {PACKAGE_PIN E3  IOSTANDARD LVCMOS33} [get_ports CLK];
create_clock -period 10 -name CLK -waveform {0.0 5.0} [get_ports CLK];

