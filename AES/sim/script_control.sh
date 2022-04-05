ghdl -a ../src/control.vhd control_tb.vhd
ghdl -s ../src/control.vhd control_tb.vhd
ghdl -e control_tb
ghdl -r control_tb --vcd=control_tb.vcd --stop-time=1000ms
gtkwave control_tb.vcd