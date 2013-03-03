
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Ein_Bit_Magnitude_Komparator -dir "G:/Dropbox/Hobby/Programme/FPGA/1-Bit Magnitude Komparator/src/Ein_Bit_Magnitude_Komparator/planAhead_run_2" -part xc3s250evq100-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "G:/Dropbox/Hobby/Programme/FPGA/1-Bit Magnitude Komparator/src/Ein_Bit_Magnitude_Komparator/Magnitude_Komparator.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {G:/Dropbox/Hobby/Programme/FPGA/1-Bit Magnitude Komparator/src/Ein_Bit_Magnitude_Komparator} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Magnitude_Komparator.ucf" [current_fileset -constrset]
add_files [list {Magnitude_Komparator.ucf}] -fileset [get_property constrset [current_run]]
link_design
