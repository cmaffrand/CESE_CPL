ghdl -a ../sublut.vhd ../bytesub.vhd ../roundconst.vhd ../newkeygen.vhd newkeygen_tb.vhd
ghdl -s ../sublut.vhd ../bytesub.vhd ../roundconst.vhd ../newkeygen.vhd newkeygen_tb.vhd
ghdl -e newkeygen_tb
ghdl -r newkeygen_tb --vcd=newkeygen_tb.vcd --stop-time=1000ms
gtkwave newkeygen_tb.vcd
ghdl -a ../sublut.vhd ../bytesub.vhd ../roundconst.vhd ../newkeygen.vhd newkeygen_reuse_tb.vhd
ghdl -s ../sublut.vhd ../bytesub.vhd ../roundconst.vhd ../newkeygen.vhd newkeygen_reuse_tb.vhd
ghdl -e newkeygen_reuse_tb
ghdl -r newkeygen_reuse_tb --vcd=newkeygen_reuse_tb.vcd --stop-time=1000ms
gtkwave newkeygen_reuse_tb.vcd