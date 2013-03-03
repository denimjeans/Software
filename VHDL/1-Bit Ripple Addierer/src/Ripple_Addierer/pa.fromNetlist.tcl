
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Ripple_Addierer -dir "G:/Dropbox/Hobby/Programme/FPGA/Ripple_Addierer/planAhead_run_1" -part xc3s250evq100-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "G:/Dropbox/Hobby/Programme/FPGA/Ripple_Addierer/Addierer.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {G:/Dropbox/Hobby/Programme/FPGA/Ripple_Addierer} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Addierer.ucf" [current_fileset -constrset]
add_files [list {Addierer.ucf}] -fileset [get_property constrset [current_run]]
link_design
