vlib work
vlog Reg_File.v Reg_File_TB.v
vsim -voptargs=+accs work.Reg_File_TB
add wave *
run -all