ghdl -a *.vhdl
ghdl -r tb_moduloULA --wave=tb_moduloULA.ghw --stop-time=200ns
ghdl -r tb_moduloULAMEM --wave=tb_moduloULAMEM.ghw --stop-time=550ns
ghdl -r tb_neander --wave=NEANDER_tb.ghw --stop-time=1000ns