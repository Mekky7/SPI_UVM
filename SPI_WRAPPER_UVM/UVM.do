vlib work
vlog -f src_files.list -sv +cover
vsim -voptargs=+acc work.top -classdebug -uvmcontrol=all -coverage
run 0
coverage save Wrapper_DB.ucdb -onexit -du spi_wrapper
run -all
 