ghdl -a ../src/pwm.vhd pwm_tb.vhd
ghdl -s ../src/pwm.vhd pwm_tb.vhd
ghdl -e pwm_tb
ghdl -r pwm_tb --vcd=pwm_tb.vcd --stop-time=1000ms
gtkwave pwm_tb.vcd