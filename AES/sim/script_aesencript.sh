ghdl -a ../addroundkey.vhd ../mux128.vhd ../cipherreg.vhd ../sublut.vhd ../bytesub.vhd ../control.vhd ../galoismul2.vhd ../galoismul3.vhd ../shiftrows.vhd ../lastround.vhd ../mixcolumns32.vhd ../mixcolumns128.vhd ../roundconst.vhd ../newkeygen.vhd ../rounds.vhd ../aesencript.vhd aesencript_tb.vhd
ghdl -s ../addroundkey.vhd ../mux128.vhd ../cipherreg.vhd ../sublut.vhd ../bytesub.vhd ../control.vhd ../galoismul2.vhd ../galoismul3.vhd ../shiftrows.vhd ../lastround.vhd ../mixcolumns32.vhd ../mixcolumns128.vhd ../roundconst.vhd ../newkeygen.vhd ../rounds.vhd ../aesencript.vhd aesencript_tb.vhd
ghdl -e aesencript_tb
ghdl -r aesencript_tb --vcd=aesencript_tb.vcd --stop-time=1000ms
gtkwave aesencript_tb.vcd