# create_project.tcl

create_project DivideBy4 ./DivideBy4 -part xc7a35tcpg236-1 -force

# Add your HDL source files
add_files ./src/IntegratedDesign.sv
add_files ./src/JKBistable.sv
add_files ./src/tb_Divide_By_Four.sv
set_property top tb_Divide_By_Four [get_filesets sim_1]
launch_simulation