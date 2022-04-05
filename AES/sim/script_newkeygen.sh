ghdl -a ../src/sublut.vhd ../src/bytesub.vhd ../src/roundconst.vhd ../src/newkeygen.vhd newkeygen_tb.vhd
ghdl -s ../src/sublut.vhd ../src/bytesub.vhd ../src/roundconst.vhd ../src/newkeygen.vhd newkeygen_tb.vhd
ghdl -e newkeygen_tb
ghdl -r newkeygen_tb --vcd=newkeygen_tb.vcd --stop-time=1000ms
gtkwave newkeygen_tb.vcd
ghdl -a ../src/sublut.vhd ../src/bytesub.vhd ../src/roundconst.vhd ../src/newkeygen.vhd newkeygen_reuse_tb.vhd
ghdl -s ../src/sublut.vhd ../src/bytesub.vhd ../src/roundconst.vhd ../src/newkeygen.vhd newkeygen_reuse_tb.vhd
ghdl -e newkeygen_reuse_tb
ghdl -r newkeygen_reuse_tb --vcd=newkeygen_reuse_tb.vcd --stop-time=1000ms
gtkwave newkeygen_reuse_tb.vcd