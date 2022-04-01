ghdl -a ../galoismul2.vhd ../galoismul3.vhd ../mixcolumns32.vhd mixcolumns32_tb.vhd
ghdl -s ../galoismul2.vhd ../galoismul3.vhd ../mixcolumns32.vhd mixcolumns32_tb.vhd
ghdl -e mixcolumns32_tb
ghdl -r mixcolumns32_tb --vcd=mixcolumns32_tb.vcd --stop-time=1000ms
gtkwave mixcolumns32_tb.vcd
