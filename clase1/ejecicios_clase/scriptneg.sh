ghdl -a neg.vhd neg_tb.vhd
ghdl -s neg.vhd neg_tb.vhd
ghdl -e neg_tb
ghdl -r neg_tb --vcd=neg_tb.vcd --stop-time=1000ms
gtkwave neg_tb.vcd