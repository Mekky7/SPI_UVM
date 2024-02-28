vlib work
vlog -f src_files.list -sv +cover
vsim -voptargs=+acc work.top -classdebug -uvmcontrol=all -coverage
run 0
add wave -position insertpoint  \
sim:/top/DUT/spislave/clk \
sim:/top/DUT/spislave/counter_out \
sim:/top/DUT/spislave/counter_rst_n \
sim:/top/DUT/spislave/cs \
sim:/top/DUT/spislave/din \
sim:/top/DUT/spislave/dout \
sim:/top/DUT/spislave/flag \
sim:/top/DUT/spislave/g \
sim:/top/DUT/spislave/MISO \
sim:/top/DUT/spislave/MOSI \
sim:/top/DUT/spislave/ns \
sim:/top/DUT/spislave/rst_n \
sim:/top/DUT/spislave/rx_data \
sim:/top/DUT/spislave/rx_valid \
sim:/top/DUT/spislave/SS_n \
sim:/top/DUT/spislave/tx_data \
sim:/top/DUT/spislave/tx_valid
add wave -position insertpoint  \
sim:/top/DUT/mem/addr_rd \
sim:/top/DUT/mem/addr_wr
add wave -position insertpoint  \
sim:/top/Wrap_if/data_holder

coverage save Wrapper_DB.ucdb -onexit -du spi_wrapper
run -all

 