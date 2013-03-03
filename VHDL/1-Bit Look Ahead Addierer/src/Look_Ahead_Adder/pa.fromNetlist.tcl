
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Look_Ahead_Adder -dir "G:/Dropbox/Hobby/Programme/FPGA/Look_Ahead_Adder/planAhead_run_2" -part xc3s250evq100-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "G:/Dropbox/Hobby/Programme/FPGA/Look_Ahead_Adder/Look_Ahead_Adder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {G:/Dropbox/Hobby/Programme/FPGA/Look_Ahead_Adder} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Look_Ahead_Adder.ucf" [current_fileset -constrset]
add_files [list {Look_Ahead_Adder.ucf}] -fileset [get_property constrset [current_run]]
link_design
