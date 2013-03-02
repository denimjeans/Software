
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Zwei_Bit_Komparator -dir "G:/Dropbox/Hobby/Programme/FPGA/Zwei_Bit_Komparator/planAhead_run_3" -part xc3s250evq100-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "G:/Dropbox/Hobby/Programme/FPGA/Zwei_Bit_Komparator/Komparator.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {G:/Dropbox/Hobby/Programme/FPGA/Zwei_Bit_Komparator} }
set_property target_constrs_file "Komparator.ucf" [current_fileset -constrset]
add_files [list {Komparator.ucf}] -fileset [get_property constrset [current_run]]
link_design
