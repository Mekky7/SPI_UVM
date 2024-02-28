vlib work
vlog -f src_files.list -sv +cover
vsim -voptargs=+acc work.top -cover -classdebug -uvmcontrol=all 
run 0
coverage save RAM_DB.ucdb -onexit -du project_ram
run -all



 