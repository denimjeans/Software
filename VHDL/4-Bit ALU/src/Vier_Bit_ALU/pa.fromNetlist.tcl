
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Vier_Bit_ALU -dir "G:/Dropbox/Hobby/Programme/FPGA/Vier_Bit_ALU/planAhead_run_2" -part xc3s250evq100-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "G:/Dropbox/Hobby/Programme/FPGA/Vier_Bit_ALU/ALU.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {G:/Dropbox/Hobby/Programme/FPGA/Vier_Bit_ALU} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "ALU.ucf" [current_fileset -constrset]
add_files [list {ALU.ucf}] -fileset [get_property constrset [current_run]]
link_design
