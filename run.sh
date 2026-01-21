
ghdl --clean
ghdl -a *.vhdl
ghdl -r tb_neander --wave=neander_tb.ghw --stop-time=30000ns
gtkwave -f MODELO.gtkw &