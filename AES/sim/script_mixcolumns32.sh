ghdl -a ../src/galoismul2.vhd ../src/galoismul3.vhd ../src/galoismul9.vhd ../src/galoismul11.vhd ../src/galoismul13.vhd ../src/galoismul14.vhd ../src/mixcolumns32.vhd mixcolumns32_tb.vhd
ghdl -s ../src/galoismul2.vhd ../src/galoismul3.vhd ../src/galoismul9.vhd ../src/galoismul11.vhd ../src/galoismul13.vhd ../src/galoismul14.vhd ../src/mixcolumns32.vhd mixcolumns32_tb.vhd
ghdl -e mixcolumns32_tb
ghdl -r mixcolumns32_tb --vcd=mixcolumns32_tb.vcd --stop-time=1000ms
gtkwave mixcolumns32_tb.vcd
