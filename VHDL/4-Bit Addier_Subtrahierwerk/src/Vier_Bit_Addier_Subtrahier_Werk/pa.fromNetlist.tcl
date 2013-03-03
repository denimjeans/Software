
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Vier_Bit_Addier_Subtrahier_Werk -dir "G:/Dropbox/Hobby/Programme/FPGA/Vier_Bit_Addier_Subtrahier_Werk/planAhead_run_4" -part xc3s250evq100-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "G:/Dropbox/Hobby/Programme/FPGA/Vier_Bit_Addier_Subtrahier_Werk/Addier_Subtrahier_Werk.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {G:/Dropbox/Hobby/Programme/FPGA/Vier_Bit_Addier_Subtrahier_Werk} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Addier_Subtrahier_Werk.ucf" [current_fileset -constrset]
add_files [list {Addier_Subtrahier_Werk.ucf}] -fileset [get_property constrset [current_run]]
link_design
