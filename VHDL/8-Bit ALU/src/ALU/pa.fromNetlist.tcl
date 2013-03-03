
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name ALU -dir "G:/Dropbox/Hobby/Programme/FPGA/8-Bit ALU/src/ALU/planAhead_run_3" -part xc3s250evq100-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "G:/Dropbox/Hobby/Programme/FPGA/8-Bit ALU/src/ALU/ALU.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {G:/Dropbox/Hobby/Programme/FPGA/8-Bit ALU/src/ALU} }
set_property target_constrs_file "ALU.ucf" [current_fileset -constrset]
add_files [list {ALU.ucf}] -fileset [get_property constrset [current_run]]
link_design
