ghdl -a sum1b.vhd scnb.vhd scnb_tb.vhd
ghdl -s sum1b.vhd scnb.vhd scnb_tb.vhd
ghdl -e scnb_tb
ghdl -r scnb_tb --vcd=scnb_tb.vcd --stop-time=1000ms
gtkwave scnb_tb.vcd
