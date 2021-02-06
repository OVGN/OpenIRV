#*****************************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# OIRV0901.tcl: Tcl script for re-creating project 'OIRV0901'
#
# IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************
# Check file required for this script exists
proc checkRequiredFiles { origin_dir} {
  set status true
  set files [list \
   "${origin_dir}/src/ip/AXIS_HIST_SCALE_DIVIDER/AXIS_HIST_SCALE_DIVIDER.xci" \
   "${origin_dir}/src/ip/DSP_LINEAR_FUNC/DSP_LINEAR_FUNC.xci" \
   "${origin_dir}/src/ip/RAW_HIST_RAM/RAW_HIST_RAM.xci" \
   "${origin_dir}/src/hdl/common/axis_dsp_linear_func.v" \
   "${origin_dir}/src/hdl/common/axis_pipeliner.v" \
   "${origin_dir}/src/hdl/DIP/hist_equalizer/hist_calc.v" \
   "${origin_dir}/src/hdl/DIP/hist_equalizer/hist_rebuilder.v" \
   "${origin_dir}/src/hdl/DIP/hist_equalizer/hist_scaler.v" \
   "${origin_dir}/src/hdl/DIP/hist_equalizer/axis_hist_equalizer.v" \
   "${origin_dir}/src/ip/AXIS_WC_1_TO_4/AXIS_WC_1_TO_4.xci" \
   "${origin_dir}/src/ip/HIST_LUT_RAM/HIST_LUT_RAM.xci" \
   "${origin_dir}/src/hdl/DIP/hist_equalizer/axis_hist_remapper.v" \
   "${origin_dir}/src/ip/AXIS_FIFO_2K_X16/AXIS_FIFO_2K_X16.xci" \
   "${origin_dir}/src/ip/AXIS_WC_4_TO_2/AXIS_WC_4_TO_2.xci" \
   "${origin_dir}/src/hdl/DIP/BPR/axis_bpr_3x3_interpol.v" \
   "${origin_dir}/src/hdl/DIP/BPR/axis_img_border_gen.v" \
   "${origin_dir}/src/hdl/DIP/BPR/axis_img_border_remover.v" \
   "${origin_dir}/src/hdl/DIP/BPR/bpr_3x1_interpol.v" \
   "${origin_dir}/src/hdl/DIP/BPR/bpr_3x3_interpol.v" \
   "${origin_dir}/src/hdl/DIP/BPR/bpr_averager.v" \
   "${origin_dir}/src/hdl/common/pipeline.v" \
   "${origin_dir}/src/hdl/DIP/BPR/axis_bad_pix_replacer.v" \
   "${origin_dir}/src/ip/AXIS_WC_2_TO_4/AXIS_WC_2_TO_4.xci" \
   "${origin_dir}/src/hdl/common/axis_2w_splitter.v" \
   "${origin_dir}/src/hdl/DIP/axis_frame_averager.v" \
   "${origin_dir}/src/hdl/DIP/NUC/nuc_dsp.v" \
   "${origin_dir}/src/hdl/DIP/NUC/axis_nuc.v" \
   "${origin_dir}/src/hdl/DIP/dip_ctrl.v" \
   "${origin_dir}/src/hdl/palette_lut/axis_palette_lut.v" \
   "${origin_dir}/src/hdl/common/rom128xN.v" \
   "${origin_dir}/src/hdl/LCD/lcd_ctrl.v" \
   "${origin_dir}/src/hdl/ISC0901/ISC0901_capture.v" \
   "${origin_dir}/src/hdl/ISC0901/ISC0901_ctrl.v" \
   "${origin_dir}/src/hdl/common/s_axis_stub.v" \
   "${origin_dir}/src/hdl/VDMA/vdma_ctrl.v" \
   "${origin_dir}/src/hdl/common/edge_to_pulse.v" \
   "${origin_dir}/src/hdl/misc/button_state_decoder.v" \
   "${origin_dir}/src/hdl/misc/debouncer.v" \
   "${origin_dir}/src/hdl/GPIO/gpio_concat.v" \
   "${origin_dir}/src/hdl/GPIO/gpio_splitter.v" \
   "${origin_dir}/src/hdl/LCD/lcd_backlight_ctrl.v" \
   "${origin_dir}/src/hdl/misc/power_switch_fsm.v" \
   "${origin_dir}/src/hdl/top.v" \
   "${origin_dir}/src/hdl/common/m_axis_stub.v" \
   "${origin_dir}/src/sdk/bootloader/Release/bootloader.elf" \
   "${origin_dir}/src/constrs/constrs.xdc" \
  ]
  foreach ifile $files {
    if { ![file isfile $ifile] } {
      puts " Could not find remote file $ifile "
      set status false
    }
  }

  set paths [list \
   [file normalize "$origin_dir/src/ip"] \
  ]
  foreach ipath $paths {
    if { ![file isdirectory $ipath] } {
      puts " Could not access $ipath "
      set status false
    }
  }

  return $status
}
# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir [file dirname [info script]]

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "OIRV0901"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "OIRV0901.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/vivado_project"]"

# Check for paths and files needed for project creation
set validate_required 0
if { $validate_required } {
  if { [checkRequiredFiles $origin_dir] } {
    puts "Tcl file $script_file is valid. All files required for project creation is accesable. "
  } else {
    puts "Tcl file $script_file is not valid. Not all files required for project creation is accesable. "
    return
  }
}

# Create project
create_project ${_xil_proj_name_} $origin_dir/vivado_project -part xc7s50csga324-1 -quiet -force

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "part" -value "xc7s50csga324-1" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "148" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "148" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "148" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "148" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "148" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "148" -objects $obj
set_property -name "webtalk.xcelium_export_sim" -value "2" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "148" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "12" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_FIFO XPM_MEMORY" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set IP repository paths
set obj [get_filesets sources_1]
if { $obj != {} } {
set_property "ip_repo_paths" "[file normalize "$origin_dir/src/ip"]" $obj

# Rebuild user ip_repo's index before adding any source files
update_ip_catalog -rebuild
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 [file normalize "${origin_dir}/src/ip/AXIS_HIST_SCALE_DIVIDER/AXIS_HIST_SCALE_DIVIDER.xci"] \
 [file normalize "${origin_dir}/src/ip/DSP_LINEAR_FUNC/DSP_LINEAR_FUNC.xci"] \
 [file normalize "${origin_dir}/src/ip/RAW_HIST_RAM/RAW_HIST_RAM.xci"] \
 [file normalize "${origin_dir}/src/hdl/common/axis_dsp_linear_func.v"] \
 [file normalize "${origin_dir}/src/hdl/common/axis_pipeliner.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/hist_equalizer/hist_calc.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/hist_equalizer/hist_rebuilder.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/hist_equalizer/hist_scaler.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/hist_equalizer/axis_hist_equalizer.v"] \
 [file normalize "${origin_dir}/src/ip/AXIS_WC_1_TO_4/AXIS_WC_1_TO_4.xci"] \
 [file normalize "${origin_dir}/src/ip/HIST_LUT_RAM/HIST_LUT_RAM.xci"] \
 [file normalize "${origin_dir}/src/hdl/DIP/hist_equalizer/axis_hist_remapper.v"] \
 [file normalize "${origin_dir}/src/ip/AXIS_FIFO_2K_X16/AXIS_FIFO_2K_X16.xci"] \
 [file normalize "${origin_dir}/src/ip/AXIS_WC_4_TO_2/AXIS_WC_4_TO_2.xci"] \
 [file normalize "${origin_dir}/src/hdl/DIP/BPR/axis_bpr_3x3_interpol.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/BPR/axis_img_border_gen.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/BPR/axis_img_border_remover.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/BPR/bpr_3x1_interpol.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/BPR/bpr_3x3_interpol.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/BPR/bpr_averager.v"] \
 [file normalize "${origin_dir}/src/hdl/common/pipeline.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/BPR/axis_bad_pix_replacer.v"] \
 [file normalize "${origin_dir}/src/ip/AXIS_WC_2_TO_4/AXIS_WC_2_TO_4.xci"] \
 [file normalize "${origin_dir}/src/hdl/common/axis_2w_splitter.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/axis_frame_averager.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/NUC/nuc_dsp.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/NUC/axis_nuc.v"] \
 [file normalize "${origin_dir}/src/hdl/DIP/dip_ctrl.v"] \
 [file normalize "${origin_dir}/src/hdl/palette_lut/axis_palette_lut.v"] \
 [file normalize "${origin_dir}/src/hdl/common/rom128xN.v"] \
 [file normalize "${origin_dir}/src/hdl/LCD/lcd_ctrl.v"] \
 [file normalize "${origin_dir}/src/hdl/ISC0901/ISC0901_capture.v"] \
 [file normalize "${origin_dir}/src/hdl/ISC0901/ISC0901_ctrl.v"] \
 [file normalize "${origin_dir}/src/hdl/common/s_axis_stub.v"] \
 [file normalize "${origin_dir}/src/hdl/VDMA/vdma_ctrl.v"] \
 [file normalize "${origin_dir}/src/hdl/common/edge_to_pulse.v"] \
 [file normalize "${origin_dir}/src/hdl/misc/button_state_decoder.v"] \
 [file normalize "${origin_dir}/src/hdl/misc/debouncer.v"] \
 [file normalize "${origin_dir}/src/hdl/GPIO/gpio_concat.v"] \
 [file normalize "${origin_dir}/src/hdl/GPIO/gpio_splitter.v"] \
 [file normalize "${origin_dir}/src/hdl/LCD/lcd_backlight_ctrl.v"] \
 [file normalize "${origin_dir}/src/hdl/misc/power_switch_fsm.v"] \
 [file normalize "${origin_dir}/src/hdl/top.v"] \
 [file normalize "${origin_dir}/src/hdl/common/m_axis_stub.v"] \
 [file normalize "${origin_dir}/src/sdk/bootloader/Release/bootloader.elf"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
set file "$origin_dir/src/ip/AXIS_HIST_SCALE_DIVIDER/AXIS_HIST_SCALE_DIVIDER.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/DSP_LINEAR_FUNC/DSP_LINEAR_FUNC.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/RAW_HIST_RAM/RAW_HIST_RAM.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/AXIS_WC_1_TO_4/AXIS_WC_1_TO_4.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/HIST_LUT_RAM/HIST_LUT_RAM.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/AXIS_FIFO_2K_X16/AXIS_FIFO_2K_X16.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/AXIS_WC_4_TO_2/AXIS_WC_4_TO_2.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/AXIS_WC_2_TO_4/AXIS_WC_2_TO_4.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/sdk/bootloader/Release/bootloader.elf"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "scoped_to_cells" -value "MCU/microblaze_0" -objects $file_obj
set_property -name "scoped_to_ref" -value "SoC" -objects $file_obj
set_property -name "used_in" -value "implementation" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj


# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "top" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/src/constrs/constrs.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "$origin_dir/src/constrs/constrs.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]
set_property -name "target_constrs_file" -value "[file normalize "$origin_dir/src/constrs/constrs.xdc"]" -objects $obj
set_property -name "target_part" -value "xc7s50csga324-1" -objects $obj
set_property -name "target_ucf" -value "[file normalize "$origin_dir/src/constrs/constrs.xdc"]" -objects $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "hbs.configure_design_for_hier_access" -value "1" -objects $obj
set_property -name "top" -value "top" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Set 'utils_1' fileset object
set obj [get_filesets utils_1]
# Empty (no sources present)

# Set 'utils_1' fileset properties
set obj [get_filesets utils_1]


# Adding sources referenced in BDs, if not already added
if { [get_files AXIS_HIST_SCALE_DIVIDER.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/AXIS_HIST_SCALE_DIVIDER/AXIS_HIST_SCALE_DIVIDER.xci
}
if { [get_files DSP_LINEAR_FUNC.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/DSP_LINEAR_FUNC/DSP_LINEAR_FUNC.xci
}
if { [get_files RAW_HIST_RAM.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/RAW_HIST_RAM/RAW_HIST_RAM.xci
}
if { [get_files axis_dsp_linear_func.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_dsp_linear_func.v
}
if { [get_files axis_pipeliner.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_pipeliner.v
}
if { [get_files hist_calc.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/hist_equalizer/hist_calc.v
}
if { [get_files hist_rebuilder.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/hist_equalizer/hist_rebuilder.v
}
if { [get_files hist_scaler.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/hist_equalizer/hist_scaler.v
}
if { [get_files axis_hist_equalizer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/hist_equalizer/axis_hist_equalizer.v
}
if { [get_files AXIS_WC_1_TO_4.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/AXIS_WC_1_TO_4/AXIS_WC_1_TO_4.xci
}
if { [get_files HIST_LUT_RAM.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/HIST_LUT_RAM/HIST_LUT_RAM.xci
}
if { [get_files axis_pipeliner.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_pipeliner.v
}
if { [get_files axis_hist_remapper.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/hist_equalizer/axis_hist_remapper.v
}
if { [get_files AXIS_FIFO_2K_X16.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/AXIS_FIFO_2K_X16/AXIS_FIFO_2K_X16.xci
}
if { [get_files AXIS_WC_4_TO_2.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/AXIS_WC_4_TO_2/AXIS_WC_4_TO_2.xci
}
if { [get_files axis_bpr_3x3_interpol.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/BPR/axis_bpr_3x3_interpol.v
}
if { [get_files axis_img_border_gen.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/BPR/axis_img_border_gen.v
}
if { [get_files axis_img_border_remover.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/BPR/axis_img_border_remover.v
}
if { [get_files axis_pipeliner.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_pipeliner.v
}
if { [get_files bpr_3x1_interpol.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/BPR/bpr_3x1_interpol.v
}
if { [get_files bpr_3x3_interpol.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/BPR/bpr_3x3_interpol.v
}
if { [get_files bpr_averager.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/BPR/bpr_averager.v
}
if { [get_files pipeline.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/pipeline.v
}
if { [get_files axis_bad_pix_replacer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/BPR/axis_bad_pix_replacer.v
}
if { [get_files AXIS_WC_2_TO_4.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/AXIS_WC_2_TO_4/AXIS_WC_2_TO_4.xci
}
if { [get_files AXIS_WC_4_TO_2.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/AXIS_WC_4_TO_2/AXIS_WC_4_TO_2.xci
}
if { [get_files DSP_LINEAR_FUNC.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/DSP_LINEAR_FUNC/DSP_LINEAR_FUNC.xci
}
if { [get_files axis_2w_splitter.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_2w_splitter.v
}
if { [get_files axis_dsp_linear_func.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_dsp_linear_func.v
}
if { [get_files axis_pipeliner.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_pipeliner.v
}
if { [get_files axis_frame_averager.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/axis_frame_averager.v
}
if { [get_files DSP_LINEAR_FUNC.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/DSP_LINEAR_FUNC/DSP_LINEAR_FUNC.xci
}
if { [get_files axis_pipeliner.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_pipeliner.v
}
if { [get_files nuc_dsp.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/NUC/nuc_dsp.v
}
if { [get_files pipeline.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/pipeline.v
}
if { [get_files axis_nuc.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/NUC/axis_nuc.v
}
if { [get_files dip_ctrl.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/DIP/dip_ctrl.v
}
if { [get_files axis_pipeliner.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_pipeliner.v
}
if { [get_files axis_palette_lut.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/palette_lut/axis_palette_lut.v
}
if { [get_files rom128xN.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/rom128xN.v
}
if { [get_files lcd_ctrl.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/LCD/lcd_ctrl.v
}
if { [get_files ISC0901_capture.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/ISC0901/ISC0901_capture.v
}
if { [get_files ISC0901_ctrl.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/ISC0901/ISC0901_ctrl.v
}
if { [get_files s_axis_stub.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/s_axis_stub.v
}
if { [get_files s_axis_stub.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/s_axis_stub.v
}
if { [get_files s_axis_stub.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/s_axis_stub.v
}
if { [get_files s_axis_stub.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/s_axis_stub.v
}
if { [get_files vdma_ctrl.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/VDMA/vdma_ctrl.v
}
if { [get_files edge_to_pulse.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/edge_to_pulse.v
}
if { [get_files button_state_decoder.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/button_state_decoder.v
}
if { [get_files edge_to_pulse.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/edge_to_pulse.v
}
if { [get_files button_state_decoder.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/button_state_decoder.v
}
if { [get_files edge_to_pulse.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/edge_to_pulse.v
}
if { [get_files button_state_decoder.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/button_state_decoder.v
}
if { [get_files edge_to_pulse.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/edge_to_pulse.v
}
if { [get_files button_state_decoder.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/button_state_decoder.v
}
if { [get_files debouncer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/debouncer.v
}
if { [get_files debouncer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/debouncer.v
}
if { [get_files debouncer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/debouncer.v
}
if { [get_files debouncer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/debouncer.v
}
if { [get_files gpio_concat.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/GPIO/gpio_concat.v
}
if { [get_files debouncer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/debouncer.v
}
if { [get_files edge_to_pulse.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/edge_to_pulse.v
}
if { [get_files gpio_splitter.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/GPIO/gpio_splitter.v
}
if { [get_files lcd_backlight_ctrl.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/LCD/lcd_backlight_ctrl.v
}
if { [get_files power_switch_fsm.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/power_switch_fsm.v
}


# Proc to create BD SoC
proc cr_bd_SoC { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# gpio_splitter, lcd_backlight_ctrl, power_switch_fsm, axis_bad_pix_replacer, axis_frame_averager, axis_nuc, dip_ctrl, axis_palette_lut, lcd_ctrl, ISC0901_capture, ISC0901_ctrl, s_axis_stub, s_axis_stub, s_axis_stub, s_axis_stub, vdma_ctrl, button_state_decoder, button_state_decoder, button_state_decoder, button_state_decoder, debouncer, debouncer, debouncer, debouncer, gpio_concat, debouncer, edge_to_pulse, axis_hist_equalizer, axis_hist_remapper



  # CHANGE DESIGN NAME HERE
  set design_name SoC

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:clk_wiz:6.0\
  xilinx.com:ip:axis_data_fifo:2.0\
  xilinx.com:ip:axi_datamover:5.1\
  xilinx.com:ip:axis_broadcaster:1.1\
  xilinx.com:ip:axis_dwidth_converter:1.1\
  xilinx.com:ip:blk_mem_gen:8.4\
  xilinx.com:ip:xpm_cdc_gen:1.0\
  xilinx.com:ip:axi_gpio:2.0\
  xilinx.com:ip:axi_iic:2.0\
  xilinx.com:ip:axi_bram_ctrl:4.1\
  xilinx.com:ip:axi_quad_spi:3.2\
  xilinx.com:ip:axi_timer:2.0\
  xilinx.com:ip:mdm:3.2\
  xilinx.com:ip:microblaze:11.0\
  xilinx.com:ip:axi_intc:4.1\
  xilinx.com:ip:xlconcat:2.1\
  xilinx.com:ip:proc_sys_reset:5.0\
  OVGN:user:OpenHBMC:1.1\
  xilinx.com:ip:xlconstant:1.1\
  xilinx.com:ip:lmb_bram_if_cntlr:4.0\
  xilinx.com:ip:lmb_v10:3.0\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  gpio_splitter\
  lcd_backlight_ctrl\
  power_switch_fsm\
  axis_bad_pix_replacer\
  axis_frame_averager\
  axis_nuc\
  dip_ctrl\
  axis_palette_lut\
  lcd_ctrl\
  ISC0901_capture\
  ISC0901_ctrl\
  s_axis_stub\
  s_axis_stub\
  s_axis_stub\
  s_axis_stub\
  vdma_ctrl\
  button_state_decoder\
  button_state_decoder\
  button_state_decoder\
  button_state_decoder\
  debouncer\
  debouncer\
  debouncer\
  debouncer\
  gpio_concat\
  debouncer\
  edge_to_pulse\
  axis_hist_equalizer\
  axis_hist_remapper\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  
# Hierarchical cell: Histogram_Equalization
proc create_hier_cell_Histogram_Equalization { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_Histogram_Equalization() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS


  # Create pins
  create_bd_pin -dir I -type clk aclk
  create_bd_pin -dir I -type rst aresetn

  # Create instance: axis_hist_broadcaster, and set properties
  set axis_hist_broadcaster [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_hist_broadcaster ]

  # Create instance: axis_hist_equalizer, and set properties
  set block_name axis_hist_equalizer
  set block_cell_name axis_hist_equalizer
  if { [catch {set axis_hist_equalizer [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_hist_equalizer eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axis_hist_remapper, and set properties
  set block_name axis_hist_remapper
  set block_cell_name axis_hist_remapper
  if { [catch {set axis_hist_remapper [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_hist_remapper eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_hist_broadcaster/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_0_M00_AXIS [get_bd_intf_pins axis_hist_broadcaster/M00_AXIS] [get_bd_intf_pins axis_hist_remapper/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_0_M01_AXIS [get_bd_intf_pins axis_hist_broadcaster/M01_AXIS] [get_bd_intf_pins axis_hist_equalizer/S_AXIS]
  connect_bd_intf_net -intf_net axis_hist_remapper_M_AXIS [get_bd_intf_pins M_AXIS] [get_bd_intf_pins axis_hist_remapper/M_AXIS]

  # Create port connections
  connect_bd_net -net aclk_1 [get_bd_pins aclk] [get_bd_pins axis_hist_broadcaster/aclk] [get_bd_pins axis_hist_equalizer/s_axis_aclk] [get_bd_pins axis_hist_remapper/axis_aclk]
  connect_bd_net -net aresetn_1 [get_bd_pins aresetn] [get_bd_pins axis_hist_broadcaster/aresetn] [get_bd_pins axis_hist_equalizer/s_axis_aresetn] [get_bd_pins axis_hist_remapper/axis_aresetn]
  connect_bd_net -net axis_hist_equalizer_hist_lut_ram_addr [get_bd_pins axis_hist_equalizer/hist_lut_ram_addr] [get_bd_pins axis_hist_remapper/hist_lut_ram_addr]
  connect_bd_net -net axis_hist_equalizer_hist_lut_ram_din [get_bd_pins axis_hist_equalizer/hist_lut_ram_din] [get_bd_pins axis_hist_remapper/hist_lut_ram_din]
  connect_bd_net -net axis_hist_equalizer_hist_lut_ram_we [get_bd_pins axis_hist_equalizer/hist_lut_ram_we] [get_bd_pins axis_hist_remapper/hist_lut_ram_we]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB

  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB


  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram ]
  set_property -dict [ list \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: focus_pulse_debounce
proc create_hier_cell_focus_pulse_debounce { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_focus_pulse_debounce() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk Clk
  create_bd_pin -dir I noisy_in
  create_bd_pin -dir O pulse_out
  create_bd_pin -dir I -type rst rstn

  # Create instance: debouncer_0, and set properties
  set block_name debouncer
  set block_cell_name debouncer_0
  if { [catch {set debouncer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $debouncer_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {101250000} \
   CONFIG.DEBOUNCE_MS {1} \
   CONFIG.IDLE_STATE {"0"} \
 ] $debouncer_0

  # Create instance: edge_to_pulse_0, and set properties
  set block_name edge_to_pulse
  set block_cell_name edge_to_pulse_0
  if { [catch {set edge_to_pulse_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $edge_to_pulse_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {101250000} \
   CONFIG.EDGE_TYPE {BOTH} \
 ] $edge_to_pulse_0

  # Create port connections
  connect_bd_net -net Clk_1 [get_bd_pins Clk] [get_bd_pins debouncer_0/clk] [get_bd_pins edge_to_pulse_0/clk]
  connect_bd_net -net debouncer_0_filtered_out [get_bd_pins debouncer_0/filtered_out] [get_bd_pins edge_to_pulse_0/edge_in]
  connect_bd_net -net edge_to_pulse_0_pulse_out [get_bd_pins pulse_out] [get_bd_pins edge_to_pulse_0/pulse_out]
  connect_bd_net -net noisy_in_0_1 [get_bd_pins noisy_in] [get_bd_pins debouncer_0/noisy_in]
  connect_bd_net -net rst_clk_wiz_peripheral_aresetn [get_bd_pins rstn] [get_bd_pins debouncer_0/rstn] [get_bd_pins edge_to_pulse_0/rstn]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: buttons
proc create_hier_cell_buttons { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_buttons() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I btn_0
  create_bd_pin -dir I btn_1
  create_bd_pin -dir I btn_2
  create_bd_pin -dir I btn_3
  create_bd_pin -dir O btn_3_out_imm
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir O -from 19 -to 0 gpio
  create_bd_pin -dir I -type rst rstn

  # Create instance: button_state_decoder_0, and set properties
  set block_name button_state_decoder
  set block_cell_name button_state_decoder_0
  if { [catch {set button_state_decoder_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $button_state_decoder_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {101250000} \
 ] $button_state_decoder_0

  # Create instance: button_state_decoder_1, and set properties
  set block_name button_state_decoder
  set block_cell_name button_state_decoder_1
  if { [catch {set button_state_decoder_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $button_state_decoder_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {101250000} \
 ] $button_state_decoder_1

  # Create instance: button_state_decoder_2, and set properties
  set block_name button_state_decoder
  set block_cell_name button_state_decoder_2
  if { [catch {set button_state_decoder_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $button_state_decoder_2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {101250000} \
 ] $button_state_decoder_2

  # Create instance: button_state_decoder_3, and set properties
  set block_name button_state_decoder
  set block_cell_name button_state_decoder_3
  if { [catch {set button_state_decoder_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $button_state_decoder_3 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {101250000} \
 ] $button_state_decoder_3

  # Create instance: debouncer_bnt_0, and set properties
  set block_name debouncer
  set block_cell_name debouncer_bnt_0
  if { [catch {set debouncer_bnt_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $debouncer_bnt_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {101250000} \
 ] $debouncer_bnt_0

  # Create instance: debouncer_bnt_1, and set properties
  set block_name debouncer
  set block_cell_name debouncer_bnt_1
  if { [catch {set debouncer_bnt_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $debouncer_bnt_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {101250000} \
 ] $debouncer_bnt_1

  # Create instance: debouncer_bnt_2, and set properties
  set block_name debouncer
  set block_cell_name debouncer_bnt_2
  if { [catch {set debouncer_bnt_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $debouncer_bnt_2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {101250000} \
 ] $debouncer_bnt_2

  # Create instance: debouncer_bnt_3, and set properties
  set block_name debouncer
  set block_cell_name debouncer_bnt_3
  if { [catch {set debouncer_bnt_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $debouncer_bnt_3 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {101250000} \
 ] $debouncer_bnt_3

  # Create instance: gpio_concat, and set properties
  set block_name gpio_concat
  set block_cell_name gpio_concat
  if { [catch {set gpio_concat [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gpio_concat eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net btn_0_1 [get_bd_pins btn_0] [get_bd_pins debouncer_bnt_0/noisy_in]
  connect_bd_net -net btn_1_1 [get_bd_pins btn_1] [get_bd_pins debouncer_bnt_1/noisy_in]
  connect_bd_net -net btn_2_1 [get_bd_pins btn_2] [get_bd_pins debouncer_bnt_2/noisy_in]
  connect_bd_net -net btn_3_1 [get_bd_pins btn_3] [get_bd_pins debouncer_bnt_3/noisy_in]
  connect_bd_net -net button_press_decoder_2_btn_out_imm [get_bd_pins btn_3_out_imm] [get_bd_pins button_state_decoder_3/btn_out_imm] [get_bd_pins gpio_concat/btn_3_imm]
  connect_bd_net -net button_state_decoder_0_btn_out_down [get_bd_pins button_state_decoder_0/btn_out_down] [get_bd_pins gpio_concat/btn_0_down]
  connect_bd_net -net button_state_decoder_0_btn_out_imm [get_bd_pins button_state_decoder_0/btn_out_imm] [get_bd_pins gpio_concat/btn_0_imm]
  connect_bd_net -net button_state_decoder_0_btn_out_long [get_bd_pins button_state_decoder_0/btn_out_long] [get_bd_pins gpio_concat/btn_0_long]
  connect_bd_net -net button_state_decoder_0_btn_out_shrt [get_bd_pins button_state_decoder_0/btn_out_shrt] [get_bd_pins gpio_concat/btn_0_shrt]
  connect_bd_net -net button_state_decoder_0_btn_out_up [get_bd_pins button_state_decoder_0/btn_out_up] [get_bd_pins gpio_concat/btn_0_up]
  connect_bd_net -net button_state_decoder_1_btn_out_down [get_bd_pins button_state_decoder_1/btn_out_down] [get_bd_pins gpio_concat/btn_1_down]
  connect_bd_net -net button_state_decoder_1_btn_out_imm [get_bd_pins button_state_decoder_1/btn_out_imm] [get_bd_pins gpio_concat/btn_1_imm]
  connect_bd_net -net button_state_decoder_1_btn_out_long [get_bd_pins button_state_decoder_1/btn_out_long] [get_bd_pins gpio_concat/btn_1_long]
  connect_bd_net -net button_state_decoder_1_btn_out_shrt [get_bd_pins button_state_decoder_1/btn_out_shrt] [get_bd_pins gpio_concat/btn_1_shrt]
  connect_bd_net -net button_state_decoder_1_btn_out_up [get_bd_pins button_state_decoder_1/btn_out_up] [get_bd_pins gpio_concat/btn_1_up]
  connect_bd_net -net button_state_decoder_2_btn_out_down [get_bd_pins button_state_decoder_2/btn_out_down] [get_bd_pins gpio_concat/btn_2_down]
  connect_bd_net -net button_state_decoder_2_btn_out_imm [get_bd_pins button_state_decoder_2/btn_out_imm] [get_bd_pins gpio_concat/btn_2_imm]
  connect_bd_net -net button_state_decoder_2_btn_out_long [get_bd_pins button_state_decoder_2/btn_out_long] [get_bd_pins gpio_concat/btn_2_long]
  connect_bd_net -net button_state_decoder_2_btn_out_shrt [get_bd_pins button_state_decoder_2/btn_out_shrt] [get_bd_pins gpio_concat/btn_2_shrt]
  connect_bd_net -net button_state_decoder_2_btn_out_up [get_bd_pins button_state_decoder_2/btn_out_up] [get_bd_pins gpio_concat/btn_2_up]
  connect_bd_net -net button_state_decoder_3_btn_out_down [get_bd_pins button_state_decoder_3/btn_out_down] [get_bd_pins gpio_concat/btn_3_down]
  connect_bd_net -net button_state_decoder_3_btn_out_long [get_bd_pins button_state_decoder_3/btn_out_long] [get_bd_pins gpio_concat/btn_3_long]
  connect_bd_net -net button_state_decoder_3_btn_out_shrt [get_bd_pins button_state_decoder_3/btn_out_shrt] [get_bd_pins gpio_concat/btn_3_shrt]
  connect_bd_net -net button_state_decoder_3_btn_out_up [get_bd_pins button_state_decoder_3/btn_out_up] [get_bd_pins gpio_concat/btn_3_up]
  connect_bd_net -net debouncer_bnt_0_filtered_out [get_bd_pins button_state_decoder_0/btn_in] [get_bd_pins debouncer_bnt_0/filtered_out]
  connect_bd_net -net debouncer_bnt_1_filtered_out [get_bd_pins button_state_decoder_1/btn_in] [get_bd_pins debouncer_bnt_1/filtered_out]
  connect_bd_net -net debouncer_bnt_2_filtered_out [get_bd_pins button_state_decoder_2/btn_in] [get_bd_pins debouncer_bnt_2/filtered_out]
  connect_bd_net -net debouncer_bnt_3_filtered_out [get_bd_pins button_state_decoder_3/btn_in] [get_bd_pins debouncer_bnt_3/filtered_out]
  connect_bd_net -net gpio_concat_gpio [get_bd_pins gpio] [get_bd_pins gpio_concat/gpio]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins clk] [get_bd_pins button_state_decoder_0/clk] [get_bd_pins button_state_decoder_1/clk] [get_bd_pins button_state_decoder_2/clk] [get_bd_pins button_state_decoder_3/clk] [get_bd_pins debouncer_bnt_0/clk] [get_bd_pins debouncer_bnt_1/clk] [get_bd_pins debouncer_bnt_2/clk] [get_bd_pins debouncer_bnt_3/clk]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins rstn] [get_bd_pins button_state_decoder_0/rstn] [get_bd_pins button_state_decoder_1/rstn] [get_bd_pins button_state_decoder_2/rstn] [get_bd_pins button_state_decoder_3/rstn] [get_bd_pins debouncer_bnt_0/rstn] [get_bd_pins debouncer_bnt_1/rstn] [get_bd_pins debouncer_bnt_2/rstn] [get_bd_pins debouncer_bnt_3/rstn]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: VDMA
proc create_hier_cell_VDMA { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_VDMA() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_IMG

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_OSD

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_MM2S

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE


  # Create pins
  create_bd_pin -dir I -type clk clk_lcd
  create_bd_pin -dir I -type clk s_axis_aclk
  create_bd_pin -dir I -type rst s_axis_aresetn

  # Create instance: AXIS_LCD_IMG_FIFO, and set properties
  set AXIS_LCD_IMG_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_LCD_IMG_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.PROG_FULL_THRESH {256} \
 ] $AXIS_LCD_IMG_FIFO

  # Create instance: AXIS_OSD_FIFO, and set properties
  set AXIS_OSD_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_OSD_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.PROG_FULL_THRESH {256} \
 ] $AXIS_OSD_FIFO

  # Create instance: axi_datamover, and set properties
  set axi_datamover [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_datamover:5.1 axi_datamover ]
  set_property -dict [ list \
   CONFIG.c_dummy {1} \
   CONFIG.c_enable_s2mm {0} \
   CONFIG.c_include_s2mm {Omit} \
   CONFIG.c_include_s2mm_stsfifo {false} \
   CONFIG.c_m_axi_s2mm_awid {1} \
   CONFIG.c_mm2s_btt_used {23} \
   CONFIG.c_mm2s_burst_size {128} \
   CONFIG.c_s2mm_addr_pipe_depth {3} \
   CONFIG.c_s2mm_include_sf {false} \
 ] $axi_datamover

  # Create instance: s_axis_stub_8, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_8
  if { [catch {set s_axis_stub_8 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_8 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: s_axis_stub_9, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_9
  if { [catch {set s_axis_stub_9 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_9 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: s_axis_stub_10, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_10
  if { [catch {set s_axis_stub_10 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_10 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: s_axis_stub_11, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_11
  if { [catch {set s_axis_stub_11 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_11 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: vdma_ctrl, and set properties
  set block_name vdma_ctrl
  set block_cell_name vdma_ctrl
  if { [catch {set vdma_ctrl [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vdma_ctrl eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
 ] $xlconstant_1

  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_LCD_IMG_FIFO_M_AXIS [get_bd_intf_pins M_AXIS_IMG] [get_bd_intf_pins AXIS_LCD_IMG_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net AXIS_OSD_FIFO_M_AXIS [get_bd_intf_pins M_AXIS_OSD] [get_bd_intf_pins AXIS_OSD_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net S_AXI_LITE_1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins vdma_ctrl/S_AXI_LITE]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXI_MM2S [get_bd_intf_pins M_AXI_MM2S] [get_bd_intf_pins axi_datamover/M_AXI_MM2S]
  connect_bd_intf_net -intf_net axi_datamover_M_AXIS_MM2S [get_bd_intf_pins axi_datamover/M_AXIS_MM2S] [get_bd_intf_pins vdma_ctrl/S_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_datamover_M_AXIS_MM2S_STS [get_bd_intf_pins axi_datamover/M_AXIS_MM2S_STS] [get_bd_intf_pins vdma_ctrl/S_AXIS_MM2S_STS]
  connect_bd_intf_net -intf_net vdma_ctrl_M_AXIS_CH0 [get_bd_intf_pins AXIS_LCD_IMG_FIFO/S_AXIS] [get_bd_intf_pins vdma_ctrl/M_AXIS_CH0]
  connect_bd_intf_net -intf_net vdma_ctrl_M_AXIS_CH1 [get_bd_intf_pins AXIS_OSD_FIFO/S_AXIS] [get_bd_intf_pins vdma_ctrl/M_AXIS_CH1]
  connect_bd_intf_net -intf_net vdma_ctrl_M_AXIS_CH2 [get_bd_intf_pins s_axis_stub_10/S_AXIS_STUB] [get_bd_intf_pins vdma_ctrl/M_AXIS_CH2]
  connect_bd_intf_net -intf_net vdma_ctrl_M_AXIS_CH3 [get_bd_intf_pins s_axis_stub_8/S_AXIS_STUB] [get_bd_intf_pins vdma_ctrl/M_AXIS_CH3]
  connect_bd_intf_net -intf_net vdma_ctrl_M_AXIS_CH4 [get_bd_intf_pins s_axis_stub_9/S_AXIS_STUB] [get_bd_intf_pins vdma_ctrl/M_AXIS_CH4]
  connect_bd_intf_net -intf_net vdma_ctrl_M_AXIS_CH5 [get_bd_intf_pins s_axis_stub_11/S_AXIS_STUB] [get_bd_intf_pins vdma_ctrl/M_AXIS_CH5]
  connect_bd_intf_net -intf_net vdma_ctrl_M_AXIS_MM2S_CMD [get_bd_intf_pins axi_datamover/S_AXIS_MM2S_CMD] [get_bd_intf_pins vdma_ctrl/M_AXIS_MM2S_CMD]

  # Create port connections
  connect_bd_net -net AXIS_LCD_IMG_FIFO_prog_full [get_bd_pins AXIS_LCD_IMG_FIFO/prog_full] [get_bd_pins vdma_ctrl/fifo_ch0_prog_full]
  connect_bd_net -net AXIS_OSD_FIFO_prog_full [get_bd_pins AXIS_OSD_FIFO/prog_full] [get_bd_pins vdma_ctrl/fifo_ch1_prog_full]
  connect_bd_net -net Net2 [get_bd_pins clk_lcd] [get_bd_pins AXIS_LCD_IMG_FIFO/m_axis_aclk] [get_bd_pins AXIS_OSD_FIFO/m_axis_aclk]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins s_axis_aclk] [get_bd_pins AXIS_LCD_IMG_FIFO/s_axis_aclk] [get_bd_pins AXIS_OSD_FIFO/s_axis_aclk] [get_bd_pins axi_datamover/m_axi_mm2s_aclk] [get_bd_pins axi_datamover/m_axis_mm2s_cmdsts_aclk] [get_bd_pins s_axis_stub_10/s_axis_aclk] [get_bd_pins s_axis_stub_11/s_axis_aclk] [get_bd_pins s_axis_stub_8/s_axis_aclk] [get_bd_pins s_axis_stub_9/s_axis_aclk] [get_bd_pins vdma_ctrl/axi_aclk]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins s_axis_aresetn] [get_bd_pins AXIS_LCD_IMG_FIFO/s_axis_aresetn] [get_bd_pins AXIS_OSD_FIFO/s_axis_aresetn] [get_bd_pins axi_datamover/m_axi_mm2s_aresetn] [get_bd_pins axi_datamover/m_axis_mm2s_cmdsts_aresetn] [get_bd_pins s_axis_stub_10/s_axis_aresetn] [get_bd_pins s_axis_stub_11/s_axis_aresetn] [get_bd_pins s_axis_stub_8/s_axis_aresetn] [get_bd_pins s_axis_stub_9/s_axis_aresetn] [get_bd_pins vdma_ctrl/axi_aresetn]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins vdma_ctrl/fifo_ch2_prog_full] [get_bd_pins vdma_ctrl/fifo_ch3_prog_full] [get_bd_pins vdma_ctrl/fifo_ch4_prog_full] [get_bd_pins vdma_ctrl/fifo_ch5_prog_full] [get_bd_pins xlconstant_1/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: SENSOR
proc create_hier_cell_SENSOR { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_SENSOR() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_IMG

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE


  # Create pins
  create_bd_pin -dir I -type clk clk_sensor
  create_bd_pin -dir I -type clk clk_sys
  create_bd_pin -dir O dest_arst
  create_bd_pin -dir O eol_strb
  create_bd_pin -dir I -type rst peripheral_aresetn
  create_bd_pin -dir O sensor_bias
  create_bd_pin -dir O sensor_bias_boost_pwr_ena
  create_bd_pin -dir O sensor_bias_pwr_ena
  create_bd_pin -dir O sensor_bias_volt_sel
  create_bd_pin -dir O sensor_clk_fwd
  create_bd_pin -dir O sensor_cmd
  create_bd_pin -dir O sensor_core_pwr_ena
  create_bd_pin -dir I sensor_data_even
  create_bd_pin -dir I sensor_data_odd
  create_bd_pin -dir O sensor_ena
  create_bd_pin -dir O sensor_io_pwr_ena_n
  create_bd_pin -dir O sof_strb

  # Create instance: AXIS_BIAS_FIFO, and set properties
  set AXIS_BIAS_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_BIAS_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.PROG_FULL_THRESH {337} \
 ] $AXIS_BIAS_FIFO

  # Create instance: AXIS_IMG_FIFO, and set properties
  set AXIS_IMG_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_IMG_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {0} \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $AXIS_IMG_FIFO

  # Create instance: AXIS_RTEMP_FIFO, and set properties
  set AXIS_RTEMP_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_RTEMP_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {0} \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $AXIS_RTEMP_FIFO

  # Create instance: AXIS_SENSOR_CMD_FIFO, and set properties
  set AXIS_SENSOR_CMD_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_SENSOR_CMD_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {0} \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $AXIS_SENSOR_CMD_FIFO

  # Create instance: ISC0901_capture, and set properties
  set block_name ISC0901_capture
  set block_cell_name ISC0901_capture
  if { [catch {set ISC0901_capture [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ISC0901_capture eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ISC0901_ctrl, and set properties
  set block_name ISC0901_ctrl
  set block_cell_name ISC0901_ctrl
  if { [catch {set ISC0901_ctrl [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ISC0901_ctrl eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axi_datamover, and set properties
  set axi_datamover [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_datamover:5.1 axi_datamover ]
  set_property -dict [ list \
   CONFIG.c_dummy {0} \
   CONFIG.c_include_mm2s {Basic} \
   CONFIG.c_include_s2mm {Basic} \
   CONFIG.c_mm2s_btt_used {23} \
   CONFIG.c_mm2s_burst_size {32} \
   CONFIG.c_mm2s_include_sf {false} \
   CONFIG.c_s2mm_btt_used {23} \
   CONFIG.c_s2mm_burst_size {32} \
   CONFIG.c_single_interface {1} \
 ] $axi_datamover

  # Create instance: eol_cdc, and set properties
  set eol_cdc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xpm_cdc_gen:1.0 eol_cdc ]
  set_property -dict [ list \
   CONFIG.CDC_TYPE {xpm_cdc_pulse} \
   CONFIG.DEST_SYNC_FF {3} \
   CONFIG.INIT_SYNC_FF {false} \
   CONFIG.REG_OUTPUT {true} \
   CONFIG.RST_USED {false} \
 ] $eol_cdc

  # Create instance: fifo_aresetn_cdc, and set properties
  set fifo_aresetn_cdc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xpm_cdc_gen:1.0 fifo_aresetn_cdc ]
  set_property -dict [ list \
   CONFIG.CDC_TYPE {xpm_cdc_async_rst} \
   CONFIG.DEST_SYNC_FF {3} \
   CONFIG.INIT_SYNC_FF {false} \
   CONFIG.REG_OUTPUT {true} \
   CONFIG.RST_ACTIVE_HIGH {false} \
   CONFIG.RST_USED {false} \
 ] $fifo_aresetn_cdc

  # Create instance: sensor_domain_reset, and set properties
  set sensor_domain_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:xpm_cdc_gen:1.0 sensor_domain_reset ]
  set_property -dict [ list \
   CONFIG.CDC_TYPE {xpm_cdc_async_rst} \
   CONFIG.DEST_SYNC_FF {3} \
   CONFIG.INIT_SYNC_FF {false} \
   CONFIG.REG_OUTPUT {true} \
   CONFIG.RST_ACTIVE_HIGH {false} \
   CONFIG.RST_USED {false} \
 ] $sensor_domain_reset

  # Create instance: sof_cdc, and set properties
  set sof_cdc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xpm_cdc_gen:1.0 sof_cdc ]
  set_property -dict [ list \
   CONFIG.CDC_TYPE {xpm_cdc_pulse} \
   CONFIG.DEST_SYNC_FF {3} \
   CONFIG.INIT_SYNC_FF {false} \
   CONFIG.REG_OUTPUT {true} \
   CONFIG.RST_USED {false} \
 ] $sof_cdc

  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_BIAS_FIFO_M_AXIS [get_bd_intf_pins AXIS_BIAS_FIFO/M_AXIS] [get_bd_intf_pins ISC0901_capture/S_AXIS_BIAS]
  connect_bd_intf_net -intf_net AXIS_RTEMP_FIFO_M_AXIS [get_bd_intf_pins AXIS_RTEMP_FIFO/M_AXIS] [get_bd_intf_pins ISC0901_ctrl/S_AXIS_RTEMP]
  connect_bd_intf_net -intf_net AXIS_SENSOR_CMD_FIFO_M_AXIS [get_bd_intf_pins AXIS_SENSOR_CMD_FIFO/M_AXIS] [get_bd_intf_pins ISC0901_capture/S_AXIS_CMD]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXIS_IMG] [get_bd_intf_pins AXIS_IMG_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net ISC0901_capture_M_AXIS_IMG [get_bd_intf_pins AXIS_IMG_FIFO/S_AXIS] [get_bd_intf_pins ISC0901_capture/M_AXIS_IMG]
  connect_bd_intf_net -intf_net ISC0901_capture_M_AXIS_RTEMP [get_bd_intf_pins AXIS_RTEMP_FIFO/S_AXIS] [get_bd_intf_pins ISC0901_capture/M_AXIS_RTEMP]
  connect_bd_intf_net -intf_net ISC0901_ctrl_0_M_AXIS_BIAS [get_bd_intf_pins AXIS_BIAS_FIFO/S_AXIS] [get_bd_intf_pins ISC0901_ctrl/M_AXIS_BIAS]
  connect_bd_intf_net -intf_net ISC0901_ctrl_0_M_AXIS_MM2S_CMD [get_bd_intf_pins ISC0901_ctrl/M_AXIS_MM2S_CMD] [get_bd_intf_pins axi_datamover/S_AXIS_MM2S_CMD]
  connect_bd_intf_net -intf_net ISC0901_ctrl_0_M_AXIS_S2MM [get_bd_intf_pins ISC0901_ctrl/M_AXIS_S2MM] [get_bd_intf_pins axi_datamover/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net ISC0901_ctrl_0_M_AXIS_S2MM_CMD [get_bd_intf_pins ISC0901_ctrl/M_AXIS_S2MM_CMD] [get_bd_intf_pins axi_datamover/S_AXIS_S2MM_CMD]
  connect_bd_intf_net -intf_net ISC0901_ctrl_0_M_AXIS_SENSOR_CMD [get_bd_intf_pins AXIS_SENSOR_CMD_FIFO/S_AXIS] [get_bd_intf_pins ISC0901_ctrl/M_AXIS_SENSOR_CMD]
  connect_bd_intf_net -intf_net S_AXI_LITE_1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins ISC0901_ctrl/S_AXI_LITE]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXI [get_bd_intf_pins M_AXI] [get_bd_intf_pins axi_datamover/M_AXI]
  connect_bd_intf_net -intf_net axi_datamover_M_AXIS_MM2S [get_bd_intf_pins ISC0901_ctrl/S_AXIS_MM2S] [get_bd_intf_pins axi_datamover/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_datamover_M_AXIS_MM2S_STS [get_bd_intf_pins ISC0901_ctrl/S_AXIS_MM2S_STS] [get_bd_intf_pins axi_datamover/M_AXIS_MM2S_STS]
  connect_bd_intf_net -intf_net axi_datamover_M_AXIS_S2MM_STS [get_bd_intf_pins ISC0901_ctrl/S_AXIS_S2MM_STS] [get_bd_intf_pins axi_datamover/M_AXIS_S2MM_STS]

  # Create port connections
  connect_bd_net -net AXIS_BIAS_FIFO_prog_full [get_bd_pins AXIS_BIAS_FIFO/prog_full] [get_bd_pins ISC0901_ctrl/fifo_bias_prog_full]
  connect_bd_net -net ISC0901_capture_eol [get_bd_pins ISC0901_capture/eol] [get_bd_pins eol_cdc/src_pulse]
  connect_bd_net -net ISC0901_capture_sensor_bias [get_bd_pins sensor_bias] [get_bd_pins ISC0901_capture/sensor_bias]
  connect_bd_net -net ISC0901_capture_sensor_clk_fwd [get_bd_pins sensor_clk_fwd] [get_bd_pins ISC0901_capture/sensor_clk_fwd]
  connect_bd_net -net ISC0901_capture_sensor_cmd [get_bd_pins sensor_cmd] [get_bd_pins ISC0901_capture/sensor_cmd]
  connect_bd_net -net ISC0901_capture_sof [get_bd_pins ISC0901_capture/sof] [get_bd_pins sof_cdc/src_pulse]
  connect_bd_net -net ISC0901_ctrl_fsm_fifo_aresetn [get_bd_pins AXIS_IMG_FIFO/s_axis_aresetn] [get_bd_pins AXIS_RTEMP_FIFO/s_axis_aresetn] [get_bd_pins ISC0901_capture/fifo_aresetn] [get_bd_pins fifo_aresetn_cdc/src_arst]
  connect_bd_net -net ISC0901_ctrl_sensor_bias_boost_pwr_ena [get_bd_pins sensor_bias_boost_pwr_ena] [get_bd_pins ISC0901_ctrl/sensor_bias_boost_pwr_ena]
  connect_bd_net -net ISC0901_ctrl_sensor_bias_pwr_ena [get_bd_pins sensor_bias_pwr_ena] [get_bd_pins ISC0901_ctrl/sensor_bias_pwr_ena]
  connect_bd_net -net ISC0901_ctrl_sensor_bias_volt_sel [get_bd_pins sensor_bias_volt_sel] [get_bd_pins ISC0901_ctrl/sensor_bias_volt_sel]
  connect_bd_net -net ISC0901_ctrl_sensor_core_pwr_ena [get_bd_pins sensor_core_pwr_ena] [get_bd_pins ISC0901_ctrl/sensor_core_pwr_ena]
  connect_bd_net -net ISC0901_ctrl_sensor_io_pwr_ena_n [get_bd_pins sensor_io_pwr_ena_n] [get_bd_pins ISC0901_ctrl/sensor_io_pwr_ena_n]
  connect_bd_net -net ISC0901_dma_ctrl_0_sensor_ena [get_bd_pins sensor_ena] [get_bd_pins ISC0901_ctrl/sensor_rstn] [get_bd_pins sensor_domain_reset/src_arst]
  connect_bd_net -net eol_raw_cdc_dest_pulse [get_bd_pins eol_strb] [get_bd_pins ISC0901_ctrl/eol_strb] [get_bd_pins eol_cdc/dest_pulse]
  connect_bd_net -net fifo_aresetn_cdc_dest_arst [get_bd_pins dest_arst] [get_bd_pins AXIS_BIAS_FIFO/s_axis_aresetn] [get_bd_pins AXIS_SENSOR_CMD_FIFO/s_axis_aresetn] [get_bd_pins fifo_aresetn_cdc/dest_arst]
  connect_bd_net -net m_axi_mm2s_aresetn_1 [get_bd_pins peripheral_aresetn] [get_bd_pins ISC0901_ctrl/axi_aresetn] [get_bd_pins axi_datamover/m_axi_mm2s_aresetn] [get_bd_pins axi_datamover/m_axi_s2mm_aresetn] [get_bd_pins axi_datamover/m_axis_mm2s_cmdsts_aresetn] [get_bd_pins axi_datamover/m_axis_s2mm_cmdsts_aresetn]
  connect_bd_net -net m_axis_aclk_1 [get_bd_pins clk_sys] [get_bd_pins AXIS_BIAS_FIFO/s_axis_aclk] [get_bd_pins AXIS_IMG_FIFO/m_axis_aclk] [get_bd_pins AXIS_RTEMP_FIFO/m_axis_aclk] [get_bd_pins AXIS_SENSOR_CMD_FIFO/s_axis_aclk] [get_bd_pins ISC0901_ctrl/axi_aclk] [get_bd_pins axi_datamover/m_axi_mm2s_aclk] [get_bd_pins axi_datamover/m_axi_s2mm_aclk] [get_bd_pins axi_datamover/m_axis_mm2s_cmdsts_aclk] [get_bd_pins axi_datamover/m_axis_s2mm_cmdsts_awclk] [get_bd_pins eol_cdc/dest_clk] [get_bd_pins fifo_aresetn_cdc/dest_clk] [get_bd_pins sof_cdc/dest_clk]
  connect_bd_net -net sensor_data_even_1 [get_bd_pins sensor_data_even] [get_bd_pins ISC0901_capture/sensor_data_even]
  connect_bd_net -net sensor_data_odd_1 [get_bd_pins sensor_data_odd] [get_bd_pins ISC0901_capture/sensor_data_odd]
  connect_bd_net -net sensor_domain_reset_dest_arst [get_bd_pins ISC0901_capture/rstn] [get_bd_pins sensor_domain_reset/dest_arst]
  connect_bd_net -net sof_raw_cdc_dest_pulse [get_bd_pins sof_strb] [get_bd_pins ISC0901_ctrl/sof_strb] [get_bd_pins sof_cdc/dest_pulse]
  connect_bd_net -net src_clk_1 [get_bd_pins clk_sensor] [get_bd_pins AXIS_BIAS_FIFO/m_axis_aclk] [get_bd_pins AXIS_IMG_FIFO/s_axis_aclk] [get_bd_pins AXIS_RTEMP_FIFO/s_axis_aclk] [get_bd_pins AXIS_SENSOR_CMD_FIFO/m_axis_aclk] [get_bd_pins ISC0901_capture/clk] [get_bd_pins eol_cdc/src_clk] [get_bd_pins sensor_domain_reset/dest_clk] [get_bd_pins sof_cdc/src_clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: RAM
proc create_hier_cell_RAM { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_RAM() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv Cypress:user:HyperBus_rtl:1.0 HyperBus_R0

  create_bd_intf_pin -mode Master -vlnv Cypress:user:HyperBus_rtl:1.0 HyperBus_R1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S01_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S02_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S03_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S04_AXI


  # Create pins
  create_bd_pin -dir I -type clk ACLK
  create_bd_pin -dir I -type rst ARESETN
  create_bd_pin -dir I clk_hbmc_0
  create_bd_pin -dir I clk_hbmc_270
  create_bd_pin -dir I clk_idelay_ref

  # Create instance: AXI_Full_Interconnect, and set properties
  set AXI_Full_Interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 AXI_Full_Interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
   CONFIG.NUM_SI {5} \
   CONFIG.S00_HAS_DATA_FIFO {2} \
   CONFIG.S01_HAS_DATA_FIFO {2} \
   CONFIG.S02_HAS_DATA_FIFO {2} \
   CONFIG.S03_HAS_DATA_FIFO {2} \
   CONFIG.S04_HAS_DATA_FIFO {2} \
   CONFIG.S05_HAS_DATA_FIFO {2} \
   CONFIG.STRATEGY {2} \
 ] $AXI_Full_Interconnect

  # Create instance: OpenHBMC_R0, and set properties
  set OpenHBMC_R0 [ create_bd_cell -type ip -vlnv OVGN:user:OpenHBMC:1.1 OpenHBMC_R0 ]
  set_property -dict [ list \
   CONFIG.C_HBMC_CLOCK_HZ {101250000} \
   CONFIG.C_HBMC_FPGA_DRIVE_STRENGTH {4} \
   CONFIG.C_IODELAY_REFCLK_MHZ {202.5} \
 ] $OpenHBMC_R0

  # Create instance: OpenHBMC_R1, and set properties
  set OpenHBMC_R1 [ create_bd_cell -type ip -vlnv OVGN:user:OpenHBMC:1.1 OpenHBMC_R1 ]
  set_property -dict [ list \
   CONFIG.C_HBMC_CLOCK_HZ {101250000} \
   CONFIG.C_HBMC_FPGA_DRIVE_STRENGTH {4} \
   CONFIG.C_IDELAYCTRL_INTEGRATED {false} \
   CONFIG.C_IODELAY_REFCLK_MHZ {202.5} \
 ] $OpenHBMC_R1

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins HyperBus_R0] [get_bd_intf_pins OpenHBMC_R0/HyperBus]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins HyperBus_R1] [get_bd_intf_pins OpenHBMC_R1/HyperBus]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S03_AXI] [get_bd_intf_pins AXI_Full_Interconnect/S03_AXI]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins S02_AXI] [get_bd_intf_pins AXI_Full_Interconnect/S02_AXI]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins S01_AXI] [get_bd_intf_pins AXI_Full_Interconnect/S01_AXI]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins S00_AXI] [get_bd_intf_pins AXI_Full_Interconnect/S00_AXI]
  connect_bd_intf_net -intf_net Conn7 [get_bd_intf_pins S04_AXI] [get_bd_intf_pins AXI_Full_Interconnect/S04_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins AXI_Full_Interconnect/M00_AXI] [get_bd_intf_pins OpenHBMC_R0/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins AXI_Full_Interconnect/M01_AXI] [get_bd_intf_pins OpenHBMC_R1/S_AXI]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins ACLK] [get_bd_pins AXI_Full_Interconnect/ACLK] [get_bd_pins AXI_Full_Interconnect/M00_ACLK] [get_bd_pins AXI_Full_Interconnect/M01_ACLK] [get_bd_pins AXI_Full_Interconnect/S00_ACLK] [get_bd_pins AXI_Full_Interconnect/S01_ACLK] [get_bd_pins AXI_Full_Interconnect/S02_ACLK] [get_bd_pins AXI_Full_Interconnect/S03_ACLK] [get_bd_pins AXI_Full_Interconnect/S04_ACLK] [get_bd_pins OpenHBMC_R0/s_axi_aclk] [get_bd_pins OpenHBMC_R1/s_axi_aclk]
  connect_bd_net -net ARESETN_1 [get_bd_pins ARESETN] [get_bd_pins AXI_Full_Interconnect/ARESETN] [get_bd_pins AXI_Full_Interconnect/M00_ARESETN] [get_bd_pins AXI_Full_Interconnect/M01_ARESETN] [get_bd_pins AXI_Full_Interconnect/S00_ARESETN] [get_bd_pins AXI_Full_Interconnect/S01_ARESETN] [get_bd_pins AXI_Full_Interconnect/S02_ARESETN] [get_bd_pins AXI_Full_Interconnect/S03_ARESETN] [get_bd_pins AXI_Full_Interconnect/S04_ARESETN] [get_bd_pins OpenHBMC_R0/s_axi_aresetn] [get_bd_pins OpenHBMC_R1/s_axi_aresetn]
  connect_bd_net -net clk_hbmc_0_1 [get_bd_pins clk_hbmc_0] [get_bd_pins OpenHBMC_R0/clk_hbmc_0] [get_bd_pins OpenHBMC_R1/clk_hbmc_0]
  connect_bd_net -net clk_hbmc_270_1 [get_bd_pins clk_hbmc_270] [get_bd_pins OpenHBMC_R0/clk_hbmc_270] [get_bd_pins OpenHBMC_R1/clk_hbmc_270]
  connect_bd_net -net clk_idelay_ref_1 [get_bd_pins clk_idelay_ref] [get_bd_pins OpenHBMC_R0/clk_idelay_ref] [get_bd_pins OpenHBMC_R1/clk_idelay_ref]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: MCU
proc create_hier_cell_MCU { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_MCU() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 LUT_RAM_CTRL

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_DC

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_DIP

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_IC

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_SENSOR

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_VDMA

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 QSPI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 SPI


  # Create pins
  create_bd_pin -dir I -type clk ACLK
  create_bd_pin -dir O -from 0 -to 0 -type rst bus_struct_reset
  create_bd_pin -dir I dcm_locked
  create_bd_pin -dir I -from 0 -to 0 focus_sensor_input
  create_bd_pin -dir I -from 19 -to 0 gpio2_io_i
  create_bd_pin -dir O -from 9 -to 0 gpio_io_o
  create_bd_pin -dir I -from 0 -to 0 i2c_exp_irq
  create_bd_pin -dir O -from 0 -to 0 -type rst peripheral_aresetn

  # Create instance: AXI_Lite_Interconnect, and set properties
  set AXI_Lite_Interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 AXI_Lite_Interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {11} \
   CONFIG.S00_HAS_DATA_FIFO {1} \
   CONFIG.STRATEGY {1} \
 ] $AXI_Lite_Interconnect

  # Create instance: axi_gpio, and set properties
  set axi_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {0} \
   CONFIG.C_ALL_INPUTS_2 {1} \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO2_WIDTH {20} \
   CONFIG.C_GPIO_WIDTH {10} \
   CONFIG.C_INTERRUPT_PRESENT {1} \
   CONFIG.C_IS_DUAL {1} \
 ] $axi_gpio

  # Create instance: axi_iic, and set properties
  set axi_iic [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic ]
  set_property -dict [ list \
   CONFIG.C_SCL_INERTIAL_DELAY {30} \
   CONFIG.C_SDA_INERTIAL_DELAY {30} \
 ] $axi_iic

  # Create instance: axi_lut_ram_ctrl, and set properties
  set axi_lut_ram_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_lut_ram_ctrl ]
  set_property -dict [ list \
   CONFIG.ECC_TYPE {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_LATENCY {1} \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_lut_ram_ctrl

  # Create instance: axi_quad_spi, and set properties
  set axi_quad_spi [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi ]
  set_property -dict [ list \
   CONFIG.C_FIFO_DEPTH {16} \
   CONFIG.C_SPI_MEMORY {4} \
   CONFIG.C_SPI_MEM_ADDR_BITS {24} \
   CONFIG.C_SPI_MODE {2} \
   CONFIG.C_TYPE_OF_AXI4_INTERFACE {0} \
   CONFIG.C_USE_STARTUP {1} \
   CONFIG.C_USE_STARTUP_INT {1} \
   CONFIG.C_XIP_MODE {0} \
   CONFIG.C_XIP_PERF_MODE {0} \
 ] $axi_quad_spi

  # Create instance: axi_spi, and set properties
  set axi_spi [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_spi ]
  set_property -dict [ list \
   CONFIG.C_SCK_RATIO {4} \
   CONFIG.C_USE_STARTUP {0} \
 ] $axi_spi

  # Create instance: axi_timer, and set properties
  set axi_timer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer ]
  set_property -dict [ list \
   CONFIG.enable_timer2 {1} \
 ] $axi_timer

  # Create instance: mdm, and set properties
  set mdm [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm ]
  set_property -dict [ list \
   CONFIG.C_ADDR_SIZE {32} \
   CONFIG.C_M_AXI_ADDR_WIDTH {32} \
   CONFIG.C_USE_UART {1} \
 ] $mdm

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_0 ]
  set_property -dict [ list \
   CONFIG.C_ADDR_TAG_BITS {12} \
   CONFIG.C_CACHE_BYTE_SIZE {4096} \
   CONFIG.C_DCACHE_ADDR_TAG {12} \
   CONFIG.C_DCACHE_BYTE_SIZE {4096} \
   CONFIG.C_DEBUG_ENABLED {1} \
   CONFIG.C_D_AXI {1} \
   CONFIG.C_D_LMB {1} \
   CONFIG.C_I_LMB {1} \
   CONFIG.G_TEMPLATE_LIST {9} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
   CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_irq_concat, and set properties
  set microblaze_irq_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_irq_concat ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {7} \
 ] $microblaze_irq_concat

  # Create instance: rst_clk_wiz, and set properties
  set rst_clk_wiz [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz ]

  # Create interface connections
  connect_bd_intf_net -intf_net AXI4_Lite_Interconnect_M02_AXI [get_bd_intf_pins AXI_Lite_Interconnect/M02_AXI] [get_bd_intf_pins axi_timer/S_AXI]
  connect_bd_intf_net -intf_net AXI_Lite_Interconnect_M03_AXI [get_bd_intf_pins AXI_Lite_Interconnect/M03_AXI] [get_bd_intf_pins axi_gpio/S_AXI]
  connect_bd_intf_net -intf_net AXI_Lite_Interconnect_M04_AXI [get_bd_intf_pins AXI_Lite_Interconnect/M04_AXI] [get_bd_intf_pins axi_iic/S_AXI]
  connect_bd_intf_net -intf_net AXI_Lite_Interconnect_M05_AXI [get_bd_intf_pins AXI_Lite_Interconnect/M05_AXI] [get_bd_intf_pins axi_quad_spi/AXI_LITE]
  connect_bd_intf_net -intf_net AXI_Lite_Interconnect_M06_AXI [get_bd_intf_pins AXI_Lite_Interconnect/M06_AXI] [get_bd_intf_pins axi_lut_ram_ctrl/S_AXI]
  connect_bd_intf_net -intf_net AXI_Lite_Interconnect_M07_AXI [get_bd_intf_pins AXI_Lite_Interconnect/M07_AXI] [get_bd_intf_pins axi_spi/AXI_LITE]
  connect_bd_intf_net -intf_net MCU_LUT_RAM_BRAM_CTRL [get_bd_intf_pins LUT_RAM_CTRL] [get_bd_intf_pins axi_lut_ram_ctrl/BRAM_PORTA]
  connect_bd_intf_net -intf_net MCU_M08_AXI [get_bd_intf_pins M_AXI_VDMA] [get_bd_intf_pins AXI_Lite_Interconnect/M08_AXI]
  connect_bd_intf_net -intf_net MCU_M09_AXI [get_bd_intf_pins M_AXI_SENSOR] [get_bd_intf_pins AXI_Lite_Interconnect/M09_AXI]
  connect_bd_intf_net -intf_net MCU_M10_AXI [get_bd_intf_pins M_AXI_DIP] [get_bd_intf_pins AXI_Lite_Interconnect/M10_AXI]
  connect_bd_intf_net -intf_net MCU_M_AXI_CPU_DC [get_bd_intf_pins M_AXI_DC] [get_bd_intf_pins microblaze_0/M_AXI_DC]
  connect_bd_intf_net -intf_net MCU_M_AXI_CPU_IC [get_bd_intf_pins M_AXI_IC] [get_bd_intf_pins microblaze_0/M_AXI_IC]
  connect_bd_intf_net -intf_net MPU_IIC [get_bd_intf_pins IIC] [get_bd_intf_pins axi_iic/IIC]
  connect_bd_intf_net -intf_net MPU_QSPI [get_bd_intf_pins QSPI] [get_bd_intf_pins axi_quad_spi/SPI_0]
  connect_bd_intf_net -intf_net MPU_SPI [get_bd_intf_pins SPI] [get_bd_intf_pins axi_spi/SPI_0]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins AXI_Lite_Interconnect/S00_AXI] [get_bd_intf_pins microblaze_0/M_AXI_DP]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins DLMB] [get_bd_intf_pins microblaze_0/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins ILMB] [get_bd_intf_pins microblaze_0/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins AXI_Lite_Interconnect/M00_AXI] [get_bd_intf_pins microblaze_0_axi_intc/s_axi]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_0_mdm_axi [get_bd_intf_pins AXI_Lite_Interconnect/M01_AXI] [get_bd_intf_pins mdm/S_AXI]

  # Create port connections
  connect_bd_net -net MPU_gpio_io_o [get_bd_pins gpio_io_o] [get_bd_pins axi_gpio/gpio_io_o]
  connect_bd_net -net axi_gpio_ip2intc_irpt [get_bd_pins axi_gpio/ip2intc_irpt] [get_bd_pins microblaze_irq_concat/In0]
  connect_bd_net -net axi_iic_iic2intc_irpt [get_bd_pins axi_iic/iic2intc_irpt] [get_bd_pins microblaze_irq_concat/In1]
  connect_bd_net -net axi_quad_spi_ip2intc_irpt [get_bd_pins axi_quad_spi/ip2intc_irpt] [get_bd_pins microblaze_irq_concat/In2]
  connect_bd_net -net axi_spi_ip2intc_irpt [get_bd_pins axi_spi/ip2intc_irpt] [get_bd_pins microblaze_irq_concat/In5]
  connect_bd_net -net axi_timer_interrupt [get_bd_pins axi_timer/interrupt] [get_bd_pins microblaze_irq_concat/In4]
  connect_bd_net -net dcm_locked_1 [get_bd_pins dcm_locked] [get_bd_pins rst_clk_wiz/dcm_locked] [get_bd_pins rst_clk_wiz/ext_reset_in]
  connect_bd_net -net edge_to_pulse_0_pulse_out [get_bd_pins focus_sensor_input] [get_bd_pins microblaze_irq_concat/In6]
  connect_bd_net -net gpio_concat_gpio [get_bd_pins gpio2_io_i] [get_bd_pins axi_gpio/gpio2_io_i]
  connect_bd_net -net i2c_exp_irq_1 [get_bd_pins i2c_exp_irq] [get_bd_pins microblaze_irq_concat/In3]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins ACLK] [get_bd_pins AXI_Lite_Interconnect/ACLK] [get_bd_pins AXI_Lite_Interconnect/M00_ACLK] [get_bd_pins AXI_Lite_Interconnect/M01_ACLK] [get_bd_pins AXI_Lite_Interconnect/M02_ACLK] [get_bd_pins AXI_Lite_Interconnect/M03_ACLK] [get_bd_pins AXI_Lite_Interconnect/M04_ACLK] [get_bd_pins AXI_Lite_Interconnect/M05_ACLK] [get_bd_pins AXI_Lite_Interconnect/M06_ACLK] [get_bd_pins AXI_Lite_Interconnect/M07_ACLK] [get_bd_pins AXI_Lite_Interconnect/M08_ACLK] [get_bd_pins AXI_Lite_Interconnect/M09_ACLK] [get_bd_pins AXI_Lite_Interconnect/M10_ACLK] [get_bd_pins AXI_Lite_Interconnect/S00_ACLK] [get_bd_pins axi_gpio/s_axi_aclk] [get_bd_pins axi_iic/s_axi_aclk] [get_bd_pins axi_lut_ram_ctrl/s_axi_aclk] [get_bd_pins axi_quad_spi/ext_spi_clk] [get_bd_pins axi_quad_spi/s_axi_aclk] [get_bd_pins axi_spi/ext_spi_clk] [get_bd_pins axi_spi/s_axi_aclk] [get_bd_pins axi_timer/s_axi_aclk] [get_bd_pins mdm/S_AXI_ACLK] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins rst_clk_wiz/slowest_sync_clk]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_irq_concat/dout]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins bus_struct_reset] [get_bd_pins rst_clk_wiz/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_clk_wiz/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins peripheral_aresetn] [get_bd_pins AXI_Lite_Interconnect/ARESETN] [get_bd_pins AXI_Lite_Interconnect/M00_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M01_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M02_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M03_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M04_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M05_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M06_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M07_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M08_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M09_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M10_ARESETN] [get_bd_pins AXI_Lite_Interconnect/S00_ARESETN] [get_bd_pins axi_gpio/s_axi_aresetn] [get_bd_pins axi_iic/s_axi_aresetn] [get_bd_pins axi_lut_ram_ctrl/s_axi_aresetn] [get_bd_pins axi_quad_spi/s_axi_aresetn] [get_bd_pins axi_spi/s_axi_aresetn] [get_bd_pins axi_timer/s_axi_aresetn] [get_bd_pins mdm/S_AXI_ARESETN] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins rst_clk_wiz/peripheral_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: LCD
proc create_hier_cell_LCD { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_LCD() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:bram_rtl:1.0 LUT_RAM

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_IMG

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_OSD


  # Create pins
  create_bd_pin -dir I aresetn
  create_bd_pin -dir I -type clk clk_lcd
  create_bd_pin -dir O -type rst lcd_resetn
  create_bd_pin -dir O lcd_spi_scl
  create_bd_pin -dir O lcd_spi_sda

  # Create instance: axis_img_dwidth_converter, and set properties
  set axis_img_dwidth_converter [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_img_dwidth_converter ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {1} \
 ] $axis_img_dwidth_converter

  # Create instance: axis_osd_dwidth_converter, and set properties
  set axis_osd_dwidth_converter [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_osd_dwidth_converter ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {2} \
 ] $axis_osd_dwidth_converter

  # Create instance: axis_palette_lut, and set properties
  set block_name axis_palette_lut
  set block_cell_name axis_palette_lut
  if { [catch {set axis_palette_lut [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_palette_lut eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: lcd_ctrl, and set properties
  set block_name lcd_ctrl
  set block_cell_name lcd_ctrl
  if { [catch {set lcd_ctrl [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $lcd_ctrl eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.LCD_CLK_HZ {67500000} \
 ] $lcd_ctrl

  # Create instance: lcd_palette_lut_ram, and set properties
  set lcd_palette_lut_ram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lcd_palette_lut_ram ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_RSTB_Pin {true} \
 ] $lcd_palette_lut_ram

  # Create instance: xpm_cdc_gen_0, and set properties
  set xpm_cdc_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xpm_cdc_gen:1.0 xpm_cdc_gen_0 ]
  set_property -dict [ list \
   CONFIG.CDC_TYPE {xpm_cdc_sync_rst} \
   CONFIG.DEST_SYNC_FF {3} \
 ] $xpm_cdc_gen_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS_OSD] [get_bd_intf_pins axis_osd_dwidth_converter/S_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXIS_IMG] [get_bd_intf_pins axis_img_dwidth_converter/S_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins LUT_RAM] [get_bd_intf_pins lcd_palette_lut_ram/BRAM_PORTA]
  connect_bd_intf_net -intf_net axis_img_dwidth_converter_M_AXIS [get_bd_intf_pins axis_img_dwidth_converter/M_AXIS] [get_bd_intf_pins axis_palette_lut/S_AXIS]
  connect_bd_intf_net -intf_net axis_osd_dwidth_converter_M_AXIS [get_bd_intf_pins axis_osd_dwidth_converter/M_AXIS] [get_bd_intf_pins lcd_ctrl/S_AXIS_OSD]
  connect_bd_intf_net -intf_net axis_palette_lut_0_LUT_RAM [get_bd_intf_pins axis_palette_lut/LUT_RAM] [get_bd_intf_pins lcd_palette_lut_ram/BRAM_PORTB]
  connect_bd_intf_net -intf_net axis_palette_lut_M_AXIS [get_bd_intf_pins axis_palette_lut/M_AXIS] [get_bd_intf_pins lcd_ctrl/S_AXIS_IMG]

  # Create port connections
  connect_bd_net -net Net1 [get_bd_pins axis_img_dwidth_converter/aresetn] [get_bd_pins axis_osd_dwidth_converter/aresetn] [get_bd_pins axis_palette_lut/axis_aresetn] [get_bd_pins lcd_ctrl/s_axis_aresetn] [get_bd_pins xpm_cdc_gen_0/dest_rst_out]
  connect_bd_net -net lcd_ctrl_0_lcd_resetn [get_bd_pins lcd_resetn] [get_bd_pins lcd_ctrl/lcd_resetn]
  connect_bd_net -net lcd_ctrl_0_lcd_spi_scl [get_bd_pins lcd_spi_scl] [get_bd_pins lcd_ctrl/lcd_spi_scl]
  connect_bd_net -net lcd_ctrl_0_lcd_spi_sda [get_bd_pins lcd_spi_sda] [get_bd_pins lcd_ctrl/lcd_spi_sda]
  connect_bd_net -net s_axis_aclk_1 [get_bd_pins clk_lcd] [get_bd_pins axis_img_dwidth_converter/aclk] [get_bd_pins axis_osd_dwidth_converter/aclk] [get_bd_pins axis_palette_lut/axis_aclk] [get_bd_pins lcd_ctrl/s_axis_aclk] [get_bd_pins xpm_cdc_gen_0/dest_clk]
  connect_bd_net -net src_rst_1 [get_bd_pins aresetn] [get_bd_pins xpm_cdc_gen_0/src_rst]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: DIP
proc create_hier_cell_DIP { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_DIP() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_IMG

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE


  # Create pins
  create_bd_pin -dir I eol_strb
  create_bd_pin -dir I -type rst fifo_aresetn
  create_bd_pin -dir I -type clk s_axis_aclk
  create_bd_pin -dir I -type rst s_axis_aresetn
  create_bd_pin -dir I sof_strb

  # Create instance: AXIS_AVGI_FIFO, and set properties
  set AXIS_AVGI_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_AVGI_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {1} \
   CONFIG.IS_ACLK_ASYNC {0} \
   CONFIG.PROG_FULL_THRESH {169} \
 ] $AXIS_AVGI_FIFO

  # Create instance: AXIS_AVGO_FIFO, and set properties
  set AXIS_AVGO_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_AVGO_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_EMPTY {1} \
   CONFIG.HAS_PROG_FULL {0} \
   CONFIG.IS_ACLK_ASYNC {0} \
   CONFIG.PROG_EMPTY_THRESH {335} \
 ] $AXIS_AVGO_FIFO

  # Create instance: AXIS_EQUAL_FIFO, and set properties
  set AXIS_EQUAL_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_EQUAL_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_EMPTY {1} \
   CONFIG.HAS_PROG_FULL {0} \
   CONFIG.IS_ACLK_ASYNC {0} \
   CONFIG.PROG_EMPTY_THRESH {83} \
 ] $AXIS_EQUAL_FIFO

  # Create instance: AXIS_GAIN_FIFO, and set properties
  set AXIS_GAIN_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_GAIN_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {1} \
   CONFIG.IS_ACLK_ASYNC {0} \
   CONFIG.PROG_FULL_THRESH {337} \
 ] $AXIS_GAIN_FIFO

  # Create instance: AXIS_OFST_FIFO, and set properties
  set AXIS_OFST_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_OFST_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {1} \
   CONFIG.IS_ACLK_ASYNC {0} \
   CONFIG.PROG_FULL_THRESH {337} \
 ] $AXIS_OFST_FIFO

  # Create instance: AXIS_RAW_FIFO, and set properties
  set AXIS_RAW_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_RAW_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_EMPTY {1} \
   CONFIG.HAS_PROG_FULL {0} \
   CONFIG.IS_ACLK_ASYNC {0} \
   CONFIG.PROG_EMPTY_THRESH {167} \
 ] $AXIS_RAW_FIFO

  # Create instance: Histogram_Equalization
  create_hier_cell_Histogram_Equalization $hier_obj Histogram_Equalization

  # Create instance: axi_datamover, and set properties
  set axi_datamover [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_datamover:5.1 axi_datamover ]
  set_property -dict [ list \
   CONFIG.c_dummy {1} \
   CONFIG.c_m_axi_mm2s_id_width {4} \
   CONFIG.c_m_axi_s2mm_id_width {4} \
   CONFIG.c_mm2s_btt_used {23} \
   CONFIG.c_mm2s_burst_size {64} \
   CONFIG.c_s2mm_btt_used {23} \
   CONFIG.c_s2mm_burst_size {64} \
   CONFIG.c_single_interface {1} \
 ] $axi_datamover

  # Create instance: axis_bad_pix_replacer, and set properties
  set block_name axis_bad_pix_replacer
  set block_cell_name axis_bad_pix_replacer
  if { [catch {set axis_bad_pix_replacer [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_bad_pix_replacer eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axis_broadcaster, and set properties
  set axis_broadcaster [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster ]
  set_property -dict [ list \
   CONFIG.M02_TDATA_REMAP {tdata[31:0]} \
   CONFIG.NUM_MI {2} \
 ] $axis_broadcaster

  # Create instance: axis_frame_averager, and set properties
  set block_name axis_frame_averager
  set block_cell_name axis_frame_averager
  if { [catch {set axis_frame_averager [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_frame_averager eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.AVERAGER_BYPASS {0} \
 ] $axis_frame_averager

  # Create instance: axis_nuc, and set properties
  set block_name axis_nuc
  set block_cell_name axis_nuc
  if { [catch {set axis_nuc [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_nuc eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: dip_ctrl, and set properties
  set block_name dip_ctrl
  set block_cell_name dip_ctrl
  if { [catch {set dip_ctrl [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $dip_ctrl eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_AVGI_FIFO_M_AXIS [get_bd_intf_pins AXIS_AVGI_FIFO/M_AXIS] [get_bd_intf_pins axis_frame_averager/S_AXIS_AVGI]
  connect_bd_intf_net -intf_net AXIS_AVGO_FIFO_M_AXIS [get_bd_intf_pins AXIS_AVGO_FIFO/M_AXIS] [get_bd_intf_pins dip_ctrl/S_AXIS_AVGO]
  connect_bd_intf_net -intf_net AXIS_EQUAL_FIFO_M_AXIS [get_bd_intf_pins AXIS_EQUAL_FIFO/M_AXIS] [get_bd_intf_pins dip_ctrl/S_AXIS_EQUAL]
  connect_bd_intf_net -intf_net AXIS_GAIN_FIFO_M_AXIS [get_bd_intf_pins AXIS_GAIN_FIFO/M_AXIS] [get_bd_intf_pins axis_nuc/S_AXIS_GAIN]
  connect_bd_intf_net -intf_net AXIS_OFST_FIFO_M_AXIS [get_bd_intf_pins AXIS_OFST_FIFO/M_AXIS] [get_bd_intf_pins axis_nuc/S_AXIS_OFST]
  connect_bd_intf_net -intf_net AXIS_RAW_FIFO_M_AXIS [get_bd_intf_pins AXIS_RAW_FIFO/M_AXIS] [get_bd_intf_pins dip_ctrl/S_AXIS_RAW]
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS_IMG] [get_bd_intf_pins axis_frame_averager/S_AXIS_IMG]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXI] [get_bd_intf_pins axi_datamover/M_AXI]
  connect_bd_intf_net -intf_net Histogram_Equalization_M_AXIS [get_bd_intf_pins AXIS_EQUAL_FIFO/S_AXIS] [get_bd_intf_pins Histogram_Equalization/M_AXIS]
  connect_bd_intf_net -intf_net S_AXIS_2 [get_bd_intf_pins Histogram_Equalization/S_AXIS] [get_bd_intf_pins axis_bad_pix_replacer/M_AXIS]
  connect_bd_intf_net -intf_net S_AXI_LITE_1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins dip_ctrl/S_AXI_LITE]
  connect_bd_intf_net -intf_net axi_datamover_M_AXIS_MM2S [get_bd_intf_pins axi_datamover/M_AXIS_MM2S] [get_bd_intf_pins dip_ctrl/S_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_datamover_M_AXIS_MM2S_STS [get_bd_intf_pins axi_datamover/M_AXIS_MM2S_STS] [get_bd_intf_pins dip_ctrl/S_AXIS_MM2S_STS]
  connect_bd_intf_net -intf_net axi_datamover_M_AXIS_S2MM_STS [get_bd_intf_pins axi_datamover/M_AXIS_S2MM_STS] [get_bd_intf_pins dip_ctrl/S_AXIS_S2MM_STS]
  connect_bd_intf_net -intf_net axis_broadcaster_M00_AXIS [get_bd_intf_pins AXIS_RAW_FIFO/S_AXIS] [get_bd_intf_pins axis_broadcaster/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_M01_AXIS [get_bd_intf_pins axis_bad_pix_replacer/S_AXIS] [get_bd_intf_pins axis_broadcaster/M01_AXIS]
  connect_bd_intf_net -intf_net axis_frame_averager_M_AXIS_AVGO [get_bd_intf_pins AXIS_AVGO_FIFO/S_AXIS] [get_bd_intf_pins axis_frame_averager/M_AXIS_AVGO]
  connect_bd_intf_net -intf_net axis_frame_averager_M_AXIS_IMG [get_bd_intf_pins axis_frame_averager/M_AXIS_IMG] [get_bd_intf_pins axis_nuc/S_AXIS_RAW]
  connect_bd_intf_net -intf_net axis_nuc_M_AXIS_NUC [get_bd_intf_pins axis_broadcaster/S_AXIS] [get_bd_intf_pins axis_nuc/M_AXIS_NUC]
  connect_bd_intf_net -intf_net dip_ctrl_0_M_AXIS_AVGI [get_bd_intf_pins AXIS_AVGI_FIFO/S_AXIS] [get_bd_intf_pins dip_ctrl/M_AXIS_AVGI]
  connect_bd_intf_net -intf_net dip_ctrl_0_M_AXIS_GAIN [get_bd_intf_pins AXIS_GAIN_FIFO/S_AXIS] [get_bd_intf_pins dip_ctrl/M_AXIS_GAIN]
  connect_bd_intf_net -intf_net dip_ctrl_0_M_AXIS_MM2S_CMD [get_bd_intf_pins axi_datamover/S_AXIS_MM2S_CMD] [get_bd_intf_pins dip_ctrl/M_AXIS_MM2S_CMD]
  connect_bd_intf_net -intf_net dip_ctrl_0_M_AXIS_OFST [get_bd_intf_pins AXIS_OFST_FIFO/S_AXIS] [get_bd_intf_pins dip_ctrl/M_AXIS_OFST]
  connect_bd_intf_net -intf_net dip_ctrl_0_M_AXIS_S2MM [get_bd_intf_pins axi_datamover/S_AXIS_S2MM] [get_bd_intf_pins dip_ctrl/M_AXIS_S2MM]
  connect_bd_intf_net -intf_net dip_ctrl_0_M_AXIS_S2MM_CMD [get_bd_intf_pins axi_datamover/S_AXIS_S2MM_CMD] [get_bd_intf_pins dip_ctrl/M_AXIS_S2MM_CMD]

  # Create port connections
  connect_bd_net -net AXIS_AVGI_FIFO_prog_full [get_bd_pins AXIS_AVGI_FIFO/prog_full] [get_bd_pins dip_ctrl/fifo_avgi_prog_full]
  connect_bd_net -net AXIS_AVGO_FIFO_prog_empty [get_bd_pins AXIS_AVGO_FIFO/prog_empty] [get_bd_pins dip_ctrl/fifo_avgo_prog_empty]
  connect_bd_net -net AXIS_EQUAL_FIFO_prog_empty [get_bd_pins AXIS_EQUAL_FIFO/prog_empty] [get_bd_pins dip_ctrl/fifo_equal_prog_empty]
  connect_bd_net -net AXIS_GAIN_FIFO_prog_full [get_bd_pins AXIS_GAIN_FIFO/prog_full] [get_bd_pins dip_ctrl/fifo_gain_prog_full]
  connect_bd_net -net AXIS_OFST_FIFO_prog_full [get_bd_pins AXIS_OFST_FIFO/prog_full] [get_bd_pins dip_ctrl/fifo_ofst_prog_full]
  connect_bd_net -net AXIS_RAW_FIFO_prog_empty [get_bd_pins AXIS_RAW_FIFO/prog_empty] [get_bd_pins dip_ctrl/fifo_raw_prog_empty]
  connect_bd_net -net aclk_1 [get_bd_pins s_axis_aclk] [get_bd_pins AXIS_AVGI_FIFO/s_axis_aclk] [get_bd_pins AXIS_AVGO_FIFO/s_axis_aclk] [get_bd_pins AXIS_EQUAL_FIFO/s_axis_aclk] [get_bd_pins AXIS_GAIN_FIFO/s_axis_aclk] [get_bd_pins AXIS_OFST_FIFO/s_axis_aclk] [get_bd_pins AXIS_RAW_FIFO/s_axis_aclk] [get_bd_pins Histogram_Equalization/aclk] [get_bd_pins axi_datamover/m_axi_mm2s_aclk] [get_bd_pins axi_datamover/m_axi_s2mm_aclk] [get_bd_pins axi_datamover/m_axis_mm2s_cmdsts_aclk] [get_bd_pins axi_datamover/m_axis_s2mm_cmdsts_awclk] [get_bd_pins axis_bad_pix_replacer/axis_aclk] [get_bd_pins axis_broadcaster/aclk] [get_bd_pins axis_frame_averager/axis_aclk] [get_bd_pins axis_nuc/axis_aclk] [get_bd_pins dip_ctrl/axi_aclk]
  connect_bd_net -net aresetn_1 [get_bd_pins s_axis_aresetn] [get_bd_pins AXIS_EQUAL_FIFO/s_axis_aresetn] [get_bd_pins Histogram_Equalization/aresetn] [get_bd_pins axi_datamover/m_axi_mm2s_aresetn] [get_bd_pins axi_datamover/m_axi_s2mm_aresetn] [get_bd_pins axi_datamover/m_axis_mm2s_cmdsts_aresetn] [get_bd_pins axi_datamover/m_axis_s2mm_cmdsts_aresetn] [get_bd_pins axis_bad_pix_replacer/axis_aresetn] [get_bd_pins dip_ctrl/axi_aresetn]
  connect_bd_net -net dip_ctrl_0_avg_level [get_bd_pins axis_frame_averager/average_level] [get_bd_pins dip_ctrl/avg_level]
  connect_bd_net -net dip_ctrl_0_bpr_bypass [get_bd_pins axis_bad_pix_replacer/bypass] [get_bd_pins dip_ctrl/bpr_bypass]
  connect_bd_net -net dip_ctrl_0_nuc_bypass [get_bd_pins axis_nuc/bypass] [get_bd_pins dip_ctrl/nuc_bypass]
  connect_bd_net -net eol_strb_1 [get_bd_pins eol_strb] [get_bd_pins dip_ctrl/eol_strb]
  connect_bd_net -net s_axis_aresetn_1 [get_bd_pins fifo_aresetn] [get_bd_pins AXIS_AVGI_FIFO/s_axis_aresetn] [get_bd_pins AXIS_AVGO_FIFO/s_axis_aresetn] [get_bd_pins AXIS_GAIN_FIFO/s_axis_aresetn] [get_bd_pins AXIS_OFST_FIFO/s_axis_aresetn] [get_bd_pins AXIS_RAW_FIFO/s_axis_aresetn] [get_bd_pins axis_broadcaster/aresetn] [get_bd_pins axis_frame_averager/axis_aresetn] [get_bd_pins axis_nuc/axis_aresetn]
  connect_bd_net -net sof_strb_1 [get_bd_pins sof_strb] [get_bd_pins axis_frame_averager/sof_strb] [get_bd_pins dip_ctrl/sof_strb]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: Clk_System
proc create_hier_cell_Clk_System { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_Clk_System() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -type clk clk_idelay_ref
  create_bd_pin -dir O -type clk clk_lcd
  create_bd_pin -dir O -type clk clk_ram_0
  create_bd_pin -dir O -type clk clk_ram_270
  create_bd_pin -dir O -type clk clk_sensor
  create_bd_pin -dir O -type clk clk_sys
  create_bd_pin -dir I -type clk extclk
  create_bd_pin -dir O locked

  # Create instance: clk_wiz, and set properties
  set clk_wiz [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_DRIVES {BUFG} \
   CONFIG.CLKOUT1_JITTER {346.789} \
   CONFIG.CLKOUT1_PHASE_ERROR {311.022} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {73.63636} \
   CONFIG.CLKOUT1_USED {true} \
   CONFIG.CLKOUT2_DRIVES {BUFG} \
   CONFIG.CLKOUT2_JITTER {355.153} \
   CONFIG.CLKOUT2_PHASE_ERROR {311.022} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {67.500} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_DRIVES {BUFG} \
   CONFIG.CLKOUT3_JITTER {316.606} \
   CONFIG.CLKOUT3_PHASE_ERROR {311.022} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {101.25} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLKOUT4_DRIVES {BUFG} \
   CONFIG.CLKOUT4_JITTER {316.606} \
   CONFIG.CLKOUT4_PHASE_ERROR {311.022} \
   CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {101.25} \
   CONFIG.CLKOUT4_REQUESTED_PHASE {270.000} \
   CONFIG.CLKOUT4_USED {true} \
   CONFIG.CLKOUT5_DRIVES {BUFG} \
   CONFIG.CLKOUT5_JITTER {266.704} \
   CONFIG.CLKOUT5_PHASE_ERROR {311.022} \
   CONFIG.CLKOUT5_REQUESTED_OUT_FREQ {202.500} \
   CONFIG.CLKOUT5_REQUESTED_PHASE {0.000} \
   CONFIG.CLKOUT5_USED {true} \
   CONFIG.CLKOUT6_DRIVES {BUFG} \
   CONFIG.CLKOUT6_JITTER {414.059} \
   CONFIG.CLKOUT6_PHASE_ERROR {260.372} \
   CONFIG.CLKOUT6_REQUESTED_OUT_FREQ {100.000} \
   CONFIG.CLKOUT6_USED {false} \
   CONFIG.CLKOUT7_DRIVES {BUFG} \
   CONFIG.CLK_OUT1_PORT {clk_sensor} \
   CONFIG.CLK_OUT2_PORT {clk_lcd} \
   CONFIG.CLK_OUT3_PORT {clk_sys_0} \
   CONFIG.CLK_OUT4_PORT {clk_sys_270} \
   CONFIG.CLK_OUT5_PORT {clk_idelay_ref} \
   CONFIG.CLK_OUT6_PORT {clk_out6} \
   CONFIG.FEEDBACK_SOURCE {FDBK_AUTO} \
   CONFIG.JITTER_SEL {No_Jitter} \
   CONFIG.MMCM_BANDWIDTH {OPTIMIZED} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {22.500} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {8.250} \
   CONFIG.MMCM_CLKOUT0_DUTY_CYCLE {0.5} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {9} \
   CONFIG.MMCM_CLKOUT1_DUTY_CYCLE {0.5} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {6} \
   CONFIG.MMCM_CLKOUT2_DUTY_CYCLE {0.5} \
   CONFIG.MMCM_CLKOUT3_DIVIDE {6} \
   CONFIG.MMCM_CLKOUT3_DUTY_CYCLE {0.5} \
   CONFIG.MMCM_CLKOUT3_PHASE {270.000} \
   CONFIG.MMCM_CLKOUT4_DIVIDE {3} \
   CONFIG.MMCM_CLKOUT4_DUTY_CYCLE {0.5} \
   CONFIG.MMCM_CLKOUT4_PHASE {0.000} \
   CONFIG.MMCM_CLKOUT5_DIVIDE {1} \
   CONFIG.MMCM_CLKOUT5_DUTY_CYCLE {0.500} \
   CONFIG.MMCM_COMPENSATION {ZHOLD} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {5} \
   CONFIG.PRIMITIVE {MMCM} \
   CONFIG.USE_MIN_POWER {true} \
   CONFIG.USE_RESET {false} \
 ] $clk_wiz

  # Create port connections
  connect_bd_net -net clk_wiz_0_clk_idelay_ref [get_bd_pins clk_idelay_ref] [get_bd_pins clk_wiz/clk_idelay_ref]
  connect_bd_net -net clk_wiz_0_clk_lcd [get_bd_pins clk_lcd] [get_bd_pins clk_wiz/clk_lcd]
  connect_bd_net -net clk_wiz_0_clk_sensor [get_bd_pins clk_sensor] [get_bd_pins clk_wiz/clk_sensor]
  connect_bd_net -net clk_wiz_0_clk_sys_0 [get_bd_pins clk_ram_0] [get_bd_pins clk_sys] [get_bd_pins clk_wiz/clk_sys_0]
  connect_bd_net -net clk_wiz_0_clk_sys_270 [get_bd_pins clk_ram_270] [get_bd_pins clk_wiz/clk_sys_270]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins locked] [get_bd_pins clk_wiz/locked]
  connect_bd_net -net extclk_1 [get_bd_pins extclk] [get_bd_pins clk_wiz/clk_in1]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set HyperBus_R0 [ create_bd_intf_port -mode Master -vlnv Cypress:user:HyperBus_rtl:1.0 HyperBus_R0 ]

  set HyperBus_R1 [ create_bd_intf_port -mode Master -vlnv Cypress:user:HyperBus_rtl:1.0 HyperBus_R1 ]

  set IIC [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC ]

  set QSPI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 QSPI ]

  set SPI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 SPI ]


  # Create ports
  set act_led [ create_bd_port -dir O -from 1 -to 0 act_led ]
  set btn_0 [ create_bd_port -dir I btn_0 ]
  set btn_1 [ create_bd_port -dir I btn_1 ]
  set btn_2 [ create_bd_port -dir I btn_2 ]
  set btn_3 [ create_bd_port -dir I btn_3 ]
  set extclk [ create_bd_port -dir I -type clk -freq_hz 27000000 extclk ]
  set fd_clk [ create_bd_port -dir O -type clk fd_clk ]
  set fd_dat [ create_bd_port -dir O fd_dat ]
  set focus_drive_ena [ create_bd_port -dir O focus_drive_ena ]
  set focus_sensor_pulse [ create_bd_port -dir I focus_sensor_pulse ]
  set i2c_exp_irq [ create_bd_port -dir I -from 0 -to 0 i2c_exp_irq ]
  set lcd_led_ctrl [ create_bd_port -dir O lcd_led_ctrl ]
  set lcd_resetn [ create_bd_port -dir O -type rst lcd_resetn ]
  set lcd_spi_scl [ create_bd_port -dir O lcd_spi_scl ]
  set lcd_spi_sda [ create_bd_port -dir O lcd_spi_sda ]
  set sensor_bias [ create_bd_port -dir O sensor_bias ]
  set sensor_bias_boost_pwr_ena [ create_bd_port -dir O sensor_bias_boost_pwr_ena ]
  set sensor_bias_pwr_ena [ create_bd_port -dir O sensor_bias_pwr_ena ]
  set sensor_bias_volt_sel [ create_bd_port -dir O sensor_bias_volt_sel ]
  set sensor_clk_fwd [ create_bd_port -dir O sensor_clk_fwd ]
  set sensor_cmd [ create_bd_port -dir O sensor_cmd ]
  set sensor_core_pwr_ena [ create_bd_port -dir O sensor_core_pwr_ena ]
  set sensor_data_even [ create_bd_port -dir I sensor_data_even ]
  set sensor_data_odd [ create_bd_port -dir I sensor_data_odd ]
  set sensor_ena [ create_bd_port -dir O sensor_ena ]
  set sensor_io_pwr_ena_n [ create_bd_port -dir O sensor_io_pwr_ena_n ]
  set shtr_drive_ena [ create_bd_port -dir O shtr_drive_ena ]

  # Create instance: Clk_System
  create_hier_cell_Clk_System [current_bd_instance .] Clk_System

  # Create instance: DIP
  create_hier_cell_DIP [current_bd_instance .] DIP

  # Create instance: LCD
  create_hier_cell_LCD [current_bd_instance .] LCD

  # Create instance: MCU
  create_hier_cell_MCU [current_bd_instance .] MCU

  # Create instance: RAM
  create_hier_cell_RAM [current_bd_instance .] RAM

  # Create instance: SENSOR
  create_hier_cell_SENSOR [current_bd_instance .] SENSOR

  # Create instance: VDMA
  create_hier_cell_VDMA [current_bd_instance .] VDMA

  # Create instance: buttons
  create_hier_cell_buttons [current_bd_instance .] buttons

  # Create instance: focus_pulse_debounce
  create_hier_cell_focus_pulse_debounce [current_bd_instance .] focus_pulse_debounce

  # Create instance: gpio_splitter, and set properties
  set block_name gpio_splitter
  set block_cell_name gpio_splitter
  if { [catch {set gpio_splitter [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gpio_splitter eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: lcd_backlight_ctrl, and set properties
  set block_name lcd_backlight_ctrl
  set block_cell_name lcd_backlight_ctrl
  if { [catch {set lcd_backlight_ctrl [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $lcd_backlight_ctrl eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {100000000} \
 ] $lcd_backlight_ctrl

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: power_switch_fsm, and set properties
  set block_name power_switch_fsm
  set block_cell_name power_switch_fsm
  if { [catch {set power_switch_fsm [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $power_switch_fsm eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {100000000} \
 ] $power_switch_fsm

  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_LCD_IMG_FIFO_M_AXIS [get_bd_intf_pins LCD/S_AXIS_IMG] [get_bd_intf_pins VDMA/M_AXIS_IMG]
  connect_bd_intf_net -intf_net AXIS_OSD_FIFO_M_AXIS [get_bd_intf_pins LCD/S_AXIS_OSD] [get_bd_intf_pins VDMA/M_AXIS_OSD]
  connect_bd_intf_net -intf_net External_RAM_HyperBus_R0 [get_bd_intf_ports HyperBus_R0] [get_bd_intf_pins RAM/HyperBus_R0]
  connect_bd_intf_net -intf_net External_RAM_HyperBus_R1 [get_bd_intf_ports HyperBus_R1] [get_bd_intf_pins RAM/HyperBus_R1]
  connect_bd_intf_net -intf_net ISC0901_M_AXI [get_bd_intf_pins RAM/S03_AXI] [get_bd_intf_pins SENSOR/M_AXI]
  connect_bd_intf_net -intf_net ISC0901_M_AXIS_IMG [get_bd_intf_pins DIP/S_AXIS_IMG] [get_bd_intf_pins SENSOR/M_AXIS_IMG]
  connect_bd_intf_net -intf_net MCU_LUT_RAM_BRAM_CTRL [get_bd_intf_pins LCD/LUT_RAM] [get_bd_intf_pins MCU/LUT_RAM_CTRL]
  connect_bd_intf_net -intf_net MCU_M08_AXI [get_bd_intf_pins MCU/M_AXI_VDMA] [get_bd_intf_pins VDMA/S_AXI_LITE]
  connect_bd_intf_net -intf_net MCU_M09_AXI [get_bd_intf_pins MCU/M_AXI_SENSOR] [get_bd_intf_pins SENSOR/S_AXI_LITE]
  connect_bd_intf_net -intf_net MCU_M10_AXI [get_bd_intf_pins DIP/S_AXI_LITE] [get_bd_intf_pins MCU/M_AXI_DIP]
  connect_bd_intf_net -intf_net MCU_M_AXI_CPU_DC [get_bd_intf_pins MCU/M_AXI_DC] [get_bd_intf_pins RAM/S01_AXI]
  connect_bd_intf_net -intf_net MCU_M_AXI_CPU_IC [get_bd_intf_pins MCU/M_AXI_IC] [get_bd_intf_pins RAM/S00_AXI]
  connect_bd_intf_net -intf_net MPU_IIC [get_bd_intf_ports IIC] [get_bd_intf_pins MCU/IIC]
  connect_bd_intf_net -intf_net MPU_QSPI [get_bd_intf_ports QSPI] [get_bd_intf_pins MCU/QSPI]
  connect_bd_intf_net -intf_net MPU_SPI [get_bd_intf_ports SPI] [get_bd_intf_pins MCU/SPI]
  connect_bd_intf_net -intf_net S02_AXI_1 [get_bd_intf_pins DIP/M_AXI] [get_bd_intf_pins RAM/S02_AXI]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXI_MM2S [get_bd_intf_pins RAM/S04_AXI] [get_bd_intf_pins VDMA/M_AXI_MM2S]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins MCU/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins MCU/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]

  # Create port connections
  connect_bd_net -net Clk_System_clk_idelay_ref [get_bd_pins Clk_System/clk_idelay_ref] [get_bd_pins RAM/clk_idelay_ref]
  connect_bd_net -net Clk_System_clk_ram_0 [get_bd_pins Clk_System/clk_ram_0] [get_bd_pins RAM/clk_hbmc_0]
  connect_bd_net -net Clk_System_clk_ram_270 [get_bd_pins Clk_System/clk_ram_270] [get_bd_pins RAM/clk_hbmc_270]
  connect_bd_net -net ISC0901_dest_arst [get_bd_pins DIP/fifo_aresetn] [get_bd_pins SENSOR/dest_arst]
  connect_bd_net -net ISC0901_eol_strb [get_bd_pins DIP/eol_strb] [get_bd_pins SENSOR/eol_strb]
  connect_bd_net -net ISC0901_sof_strb [get_bd_pins DIP/sof_strb] [get_bd_pins SENSOR/sof_strb]
  connect_bd_net -net LCD_lcd_resetn [get_bd_ports lcd_resetn] [get_bd_pins LCD/lcd_resetn]
  connect_bd_net -net LCD_lcd_spi_scl [get_bd_ports lcd_spi_scl] [get_bd_pins LCD/lcd_spi_scl]
  connect_bd_net -net LCD_lcd_spi_sda [get_bd_ports lcd_spi_sda] [get_bd_pins LCD/lcd_spi_sda]
  connect_bd_net -net MPU_gpio_io_o [get_bd_pins MCU/gpio_io_o] [get_bd_pins gpio_splitter/gpio]
  connect_bd_net -net Net [get_bd_pins gpio_splitter/pwr_off_req] [get_bd_pins lcd_backlight_ctrl/srst] [get_bd_pins power_switch_fsm/pwr_off_req]
  connect_bd_net -net Net2 [get_bd_pins Clk_System/clk_lcd] [get_bd_pins LCD/clk_lcd] [get_bd_pins VDMA/clk_lcd]
  connect_bd_net -net Sensor_sensor_bias [get_bd_ports sensor_bias] [get_bd_pins SENSOR/sensor_bias]
  connect_bd_net -net Sensor_sensor_bias_boost_pwr_ena_0 [get_bd_ports sensor_bias_boost_pwr_ena] [get_bd_pins SENSOR/sensor_bias_boost_pwr_ena]
  connect_bd_net -net Sensor_sensor_bias_pwr_ena_0 [get_bd_ports sensor_bias_pwr_ena] [get_bd_pins SENSOR/sensor_bias_pwr_ena]
  connect_bd_net -net Sensor_sensor_bias_volt_sel_0 [get_bd_ports sensor_bias_volt_sel] [get_bd_pins SENSOR/sensor_bias_volt_sel]
  connect_bd_net -net Sensor_sensor_clk_fwd [get_bd_ports sensor_clk_fwd] [get_bd_pins SENSOR/sensor_clk_fwd]
  connect_bd_net -net Sensor_sensor_cmd [get_bd_ports sensor_cmd] [get_bd_pins SENSOR/sensor_cmd]
  connect_bd_net -net Sensor_sensor_core_pwr_ena_0 [get_bd_ports sensor_core_pwr_ena] [get_bd_pins SENSOR/sensor_core_pwr_ena]
  connect_bd_net -net Sensor_sensor_ena [get_bd_ports sensor_ena] [get_bd_pins SENSOR/sensor_ena]
  connect_bd_net -net Sensor_sensor_io_pwr_ena_n_0 [get_bd_ports sensor_io_pwr_ena_n] [get_bd_pins SENSOR/sensor_io_pwr_ena_n]
  connect_bd_net -net bnt_3_1 [get_bd_ports btn_3] [get_bd_pins buttons/btn_3]
  connect_bd_net -net btn_0_0_1 [get_bd_ports btn_0] [get_bd_pins buttons/btn_0]
  connect_bd_net -net btn_1_0_1 [get_bd_ports btn_1] [get_bd_pins buttons/btn_1]
  connect_bd_net -net btn_2_0_1 [get_bd_ports btn_2] [get_bd_pins buttons/btn_2]
  connect_bd_net -net buttons_btn_out_imm [get_bd_pins buttons/btn_3_out_imm] [get_bd_pins power_switch_fsm/btn_pressed]
  connect_bd_net -net clk_wiz_0_clk_sensor [get_bd_pins Clk_System/clk_sensor] [get_bd_pins SENSOR/clk_sensor]
  connect_bd_net -net dcm_locked_1 [get_bd_pins Clk_System/locked] [get_bd_pins MCU/dcm_locked]
  connect_bd_net -net edge_to_pulse_0_pulse_out [get_bd_pins MCU/focus_sensor_input] [get_bd_pins focus_pulse_debounce/pulse_out]
  connect_bd_net -net extclk_1 [get_bd_ports extclk] [get_bd_pins Clk_System/extclk]
  connect_bd_net -net gpio_concat_gpio [get_bd_pins MCU/gpio2_io_i] [get_bd_pins buttons/gpio]
  connect_bd_net -net gpio_splitter_0_act_led [get_bd_ports act_led] [get_bd_pins gpio_splitter/act_led]
  connect_bd_net -net gpio_splitter_0_lcd_led_level [get_bd_pins gpio_splitter/lcd_led_level] [get_bd_pins lcd_backlight_ctrl/level]
  connect_bd_net -net gpio_splitter_focus_drive_ena [get_bd_ports focus_drive_ena] [get_bd_pins gpio_splitter/focus_drive_ena]
  connect_bd_net -net gpio_splitter_shtr_drive_ena [get_bd_ports shtr_drive_ena] [get_bd_pins gpio_splitter/shtr_drive_ena]
  connect_bd_net -net i2c_exp_irq_1 [get_bd_ports i2c_exp_irq] [get_bd_pins MCU/i2c_exp_irq]
  connect_bd_net -net lcd_backlight_ctrl_0_pulse_out [get_bd_ports lcd_led_ctrl] [get_bd_pins lcd_backlight_ctrl/pulse_out]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins Clk_System/clk_sys] [get_bd_pins DIP/s_axis_aclk] [get_bd_pins MCU/ACLK] [get_bd_pins RAM/ACLK] [get_bd_pins SENSOR/clk_sys] [get_bd_pins VDMA/s_axis_aclk] [get_bd_pins buttons/clk] [get_bd_pins focus_pulse_debounce/Clk] [get_bd_pins lcd_backlight_ctrl/clk] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins power_switch_fsm/clk]
  connect_bd_net -net noisy_in_0_1 [get_bd_ports focus_sensor_pulse] [get_bd_pins focus_pulse_debounce/noisy_in]
  connect_bd_net -net power_switch_fsm_0_fd_clk [get_bd_ports fd_clk] [get_bd_pins power_switch_fsm/fd_clk]
  connect_bd_net -net power_switch_fsm_0_fd_dat [get_bd_ports fd_dat] [get_bd_pins power_switch_fsm/fd_dat]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins MCU/bus_struct_reset] [get_bd_pins microblaze_0_local_memory/SYS_Rst]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins DIP/s_axis_aresetn] [get_bd_pins LCD/aresetn] [get_bd_pins MCU/peripheral_aresetn] [get_bd_pins RAM/ARESETN] [get_bd_pins SENSOR/peripheral_aresetn] [get_bd_pins VDMA/s_axis_aresetn] [get_bd_pins buttons/rstn] [get_bd_pins focus_pulse_debounce/rstn]
  connect_bd_net -net sensor_data_even_1 [get_bd_ports sensor_data_even] [get_bd_pins SENSOR/sensor_data_even]
  connect_bd_net -net sensor_data_odd_1 [get_bd_ports sensor_data_odd] [get_bd_pins SENSOR/sensor_data_odd]

  # Create address segments
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces DIP/axi_datamover/Data] [get_bd_addr_segs RAM/OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces DIP/axi_datamover/Data] [get_bd_addr_segs RAM/OpenHBMC_R1/S_AXI/Mem] -force
  assign_bd_address -offset 0x44A40000 -range 0x00001000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs SENSOR/ISC0901_ctrl/S_AXI_LITE/reg0] -force
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs RAM/OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Instruction] [get_bd_addr_segs RAM/OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs RAM/OpenHBMC_R1/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Instruction] [get_bd_addr_segs RAM/OpenHBMC_R1/S_AXI/Mem] -force
  assign_bd_address -offset 0x40000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_gpio/S_AXI/Reg] -force
  assign_bd_address -offset 0x40800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_iic/S_AXI/Reg] -force
  assign_bd_address -offset 0x50000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_lut_ram_ctrl/S_AXI/Mem0] -force
  assign_bd_address -offset 0x44A00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_quad_spi/AXI_LITE/Reg] -force
  assign_bd_address -offset 0x44A10000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_spi/AXI_LITE/Reg] -force
  assign_bd_address -offset 0x41C00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_timer/S_AXI/Reg] -force
  assign_bd_address -offset 0x44A30000 -range 0x00001000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs DIP/dip_ctrl/S_AXI_LITE/reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x00008000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] -force
  assign_bd_address -offset 0x00000000 -range 0x00008000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] -force
  assign_bd_address -offset 0x41400000 -range 0x00001000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/mdm/S_AXI/Reg] -force
  assign_bd_address -offset 0x41200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/microblaze_0_axi_intc/S_AXI/Reg] -force
  assign_bd_address -offset 0x44A20000 -range 0x00001000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs VDMA/vdma_ctrl/S_AXI_LITE/reg0] -force
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces SENSOR/axi_datamover/Data] [get_bd_addr_segs RAM/OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces SENSOR/axi_datamover/Data] [get_bd_addr_segs RAM/OpenHBMC_R1/S_AXI/Mem] -force
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces VDMA/axi_datamover/Data_MM2S] [get_bd_addr_segs RAM/OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces VDMA/axi_datamover/Data_MM2S] [get_bd_addr_segs RAM/OpenHBMC_R1/S_AXI/Mem] -force

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   "ActiveEmotionalView":"Default View",
   "Addressing View_Layers":"/MCU/axi_gpio_ip2intc_irpt:false|/MCU/axi_timer_interrupt:false|/Clk_System/clk_wiz_0_clk_lcd:false|/MCU/rst_clk_wiz_1_100M_bus_struct_reset:false|/MCU/axi_iic_iic2intc_irpt:false|/MCU/axi_spi_ip2intc_irpt:false|/ISC0901/ISC0901_ctrl_fsm_fifo_aresetn:false|/Clk_System/clk_wiz_0_clk_idelay_ref:false|/gpio_splitter_0_dma_fsm_aresetn:false|/Clk_System/clk_wiz_0_clk_sys_270:false|/Clk_System/clk_wiz_0_clk_sys_0:false|/Clk_System/clk_wiz_0_clk_sensor:false|/MCU/rst_clk_wiz_1_100M_mb_reset:false|/LCD/lcd_cnsmr_lcd_resetn:false|/MCU/mdm_1_debug_sys_rst:false|/MCU/rst_clk_wiz_peripheral_aresetn:false|/extclk_1:false|/power_switch_fsm_0_fd_clk:false|/MCU/axi_quad_spi_ip2intc_irpt:false|",
   "Addressing View_ScaleFactor":"0.74",
   "Addressing View_TopLeft":"-177,-189",
   "Color Coded_ScaleFactor":"0.43452",
   "Color Coded_TopLeft":"-177,-104",
   "Default View_Layers":"/MCU/axi_gpio_ip2intc_irpt:true|/MCU/axi_timer_interrupt:true|/Clk_System/clk_wiz_0_clk_lcd:true|/MCU/rst_clk_wiz_1_100M_bus_struct_reset:true|/MCU/axi_iic_iic2intc_irpt:true|/MCU/axi_spi_ip2intc_irpt:true|/ISC0901/ISC0901_ctrl_fsm_fifo_aresetn:true|/Clk_System/clk_wiz_0_clk_idelay_ref:true|/gpio_splitter_0_dma_fsm_aresetn:true|/Clk_System/clk_wiz_0_clk_sys_270:true|/Clk_System/clk_wiz_0_clk_sys_0:true|/Clk_System/clk_wiz_0_clk_sensor:true|/MCU/rst_clk_wiz_1_100M_mb_reset:true|/LCD/lcd_cnsmr_lcd_resetn:true|/MCU/mdm_1_debug_sys_rst:true|/MCU/rst_clk_wiz_peripheral_aresetn:true|/extclk_1:true|/power_switch_fsm_0_fd_clk:true|/MCU/axi_quad_spi_ip2intc_irpt:true|",
   "Default View_ScaleFactor":"0.318978",
   "Default View_TopLeft":"-1069,-263",
   "Display-PortTypeClock":"true",
   "Display-PortTypeInterrupt":"true",
   "Display-PortTypeOthers":"true",
   "Display-PortTypeReset":"true",
   "ExpandedHierarchyInLayout":"",
   "Grouping and No Loops_ScaleFactor":"0.539788",
   "Grouping and No Loops_TopLeft":"-102,-57",
   "Interfaces View_Layers":"/MCU/axi_gpio_ip2intc_irpt:false|/MCU/axi_timer_interrupt:false|/Clk_System/clk_wiz_0_clk_lcd:false|/MCU/rst_clk_wiz_1_100M_bus_struct_reset:false|/MCU/axi_iic_iic2intc_irpt:false|/MCU/axi_spi_ip2intc_irpt:false|/ISC0901/ISC0901_ctrl_fsm_fifo_aresetn:false|/Clk_System/clk_wiz_0_clk_idelay_ref:false|/gpio_splitter_0_dma_fsm_aresetn:false|/Clk_System/clk_wiz_0_clk_sys_270:false|/Clk_System/clk_wiz_0_clk_sys_0:false|/Clk_System/clk_wiz_0_clk_sensor:false|/MCU/rst_clk_wiz_1_100M_mb_reset:false|/LCD/lcd_cnsmr_lcd_resetn:false|/MCU/mdm_1_debug_sys_rst:false|/MCU/rst_clk_wiz_peripheral_aresetn:false|/extclk_1:false|/power_switch_fsm_0_fd_clk:false|/MCU/axi_quad_spi_ip2intc_irpt:false|",
   "Interfaces View_ScaleFactor":"0.753704",
   "Interfaces View_TopLeft":"-176,-162",
   "No Loops_ScaleFactor":"0.405648",
   "No Loops_TopLeft":"-264,-187",
   "Reduced Jogs_Layers":"/MCU/axi_gpio_ip2intc_irpt:true|/MCU/axi_timer_interrupt:true|/Clk_System/clk_wiz_0_clk_lcd:true|/MCU/rst_clk_wiz_1_100M_bus_struct_reset:true|/MCU/axi_iic_iic2intc_irpt:true|/MCU/axi_spi_ip2intc_irpt:true|/ISC0901/ISC0901_ctrl_fsm_fifo_aresetn:true|/Clk_System/clk_wiz_0_clk_idelay_ref:true|/gpio_splitter_0_dma_fsm_aresetn:true|/Clk_System/clk_wiz_0_clk_sys_270:true|/Clk_System/clk_wiz_0_clk_sys_0:true|/Clk_System/clk_wiz_0_clk_sensor:true|/MCU/rst_clk_wiz_1_100M_mb_reset:true|/LCD/lcd_cnsmr_lcd_resetn:true|/MCU/mdm_1_debug_sys_rst:true|/MCU/rst_clk_wiz_peripheral_aresetn:true|/extclk_1:true|/power_switch_fsm_0_fd_clk:true|/MCU/axi_quad_spi_ip2intc_irpt:true|",
   "Reduced Jogs_ScaleFactor":"0.399342",
   "Reduced Jogs_TopLeft":"-190,0",
   "guistr":"# # String gsaved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:10.0 non-TLS
#  -string -flagsOSRD
preplace port HyperBus_R0 -pg 1 -lvl 6 -x 1920 -y 430 -defaultsOSRD
preplace port HyperBus_R1 -pg 1 -lvl 6 -x 1920 -y 450 -defaultsOSRD
preplace port IIC -pg 1 -lvl 6 -x 1920 -y 20 -defaultsOSRD
preplace port QSPI -pg 1 -lvl 6 -x 1920 -y 40 -defaultsOSRD
preplace port SPI -pg 1 -lvl 6 -x 1920 -y 60 -defaultsOSRD
preplace port btn_0 -pg 1 -lvl 0 -x -110 -y 100 -defaultsOSRD
preplace port btn_1 -pg 1 -lvl 0 -x -110 -y 120 -defaultsOSRD
preplace port btn_2 -pg 1 -lvl 0 -x -110 -y 140 -defaultsOSRD
preplace port btn_3 -pg 1 -lvl 0 -x -110 -y 160 -defaultsOSRD
preplace port extclk -pg 1 -lvl 0 -x -110 -y 450 -defaultsOSRD
preplace port fd_clk -pg 1 -lvl 6 -x 1920 -y 630 -defaultsOSRD
preplace port fd_dat -pg 1 -lvl 6 -x 1920 -y 650 -defaultsOSRD
preplace port focus_drive_ena -pg 1 -lvl 6 -x 1920 -y 730 -defaultsOSRD
preplace port focus_sensor_pulse -pg 1 -lvl 0 -x -110 -y 330 -defaultsOSRD
preplace port lcd_led_ctrl -pg 1 -lvl 6 -x 1920 -y 820 -defaultsOSRD
preplace port lcd_resetn -pg 1 -lvl 6 -x 1920 -y 200 -defaultsOSRD
preplace port lcd_spi_scl -pg 1 -lvl 6 -x 1920 -y 220 -defaultsOSRD
preplace port lcd_spi_sda -pg 1 -lvl 6 -x 1920 -y 240 -defaultsOSRD
preplace port sensor_bias -pg 1 -lvl 6 -x 1920 -y 930 -defaultsOSRD
preplace port sensor_bias_boost_pwr_ena -pg 1 -lvl 6 -x 1920 -y 890 -defaultsOSRD
preplace port sensor_bias_pwr_ena -pg 1 -lvl 6 -x 1920 -y 910 -defaultsOSRD
preplace port sensor_bias_volt_sel -pg 1 -lvl 6 -x 1920 -y 870 -defaultsOSRD
preplace port sensor_clk_fwd -pg 1 -lvl 6 -x 1920 -y 950 -defaultsOSRD
preplace port sensor_cmd -pg 1 -lvl 6 -x 1920 -y 970 -defaultsOSRD
preplace port sensor_core_pwr_ena -pg 1 -lvl 6 -x 1920 -y 1030 -defaultsOSRD
preplace port sensor_data_even -pg 1 -lvl 0 -x -110 -y 790 -defaultsOSRD
preplace port sensor_data_odd -pg 1 -lvl 0 -x -110 -y 810 -defaultsOSRD
preplace port sensor_ena -pg 1 -lvl 6 -x 1920 -y 990 -defaultsOSRD
preplace port sensor_io_pwr_ena_n -pg 1 -lvl 6 -x 1920 -y 1010 -defaultsOSRD
preplace port shtr_drive_ena -pg 1 -lvl 6 -x 1920 -y 750 -defaultsOSRD
preplace portBus act_led -pg 1 -lvl 6 -x 1920 -y 710 -defaultsOSRD
preplace portBus i2c_exp_irq -pg 1 -lvl 0 -x -110 -y 40 -defaultsOSRD
preplace inst Clk_System -pg 1 -lvl 1 -x 10 -y 450 -defaultsOSRD
preplace inst DIP -pg 1 -lvl 3 -x 840 -y 760 -defaultsOSRD
preplace inst LCD -pg 1 -lvl 5 -x 1750 -y 220 -defaultsOSRD
preplace inst RAM -pg 1 -lvl 5 -x 1750 -y 440 -defaultsOSRD
preplace inst SENSOR -pg 1 -lvl 2 -x 340 -y 760 -defaultsOSRD
preplace inst VDMA -pg 1 -lvl 4 -x 1330 -y 350 -defaultsOSRD
preplace inst buttons -pg 1 -lvl 2 -x 340 -y 150 -defaultsOSRD
preplace inst focus_pulse_debounce -pg 1 -lvl 2 -x 340 -y 340 -defaultsOSRD
preplace inst gpio_splitter -pg 1 -lvl 4 -x 1330 -y 550 -defaultsOSRD
preplace inst microblaze_0_local_memory -pg 1 -lvl 4 -x 1330 -y 140 -defaultsOSRD
preplace inst power_switch_fsm -pg 1 -lvl 5 -x 1750 -y 640 -defaultsOSRD
preplace inst MCU -pg 1 -lvl 3 -x 840 -y 230 -defaultsOSRD
preplace inst lcd_backlight_ctrl -pg 1 -lvl 5 -x 1750 -y 820 -defaultsOSRD
preplace netloc Clk_System_clk_idelay_ref 1 1 4 120 430 NJ 430 NJ 430 1520J
preplace netloc Clk_System_clk_ram_0 1 1 4 110 10 NJ 10 NJ 10 1570J
preplace netloc Clk_System_clk_ram_270 1 1 4 N 450 NJ 450 NJ 450 1510J
preplace netloc ISC0901_dest_arst 1 2 1 620 670n
preplace netloc ISC0901_eol_strb 1 2 1 610 690n
preplace netloc ISC0901_sof_strb 1 2 1 610 820n
preplace netloc LCD_lcd_resetn 1 5 1 NJ 200
preplace netloc LCD_lcd_spi_scl 1 5 1 NJ 220
preplace netloc LCD_lcd_spi_sda 1 5 1 NJ 240
preplace netloc MPU_gpio_io_o 1 3 1 1060 360n
preplace netloc Net 1 4 1 1500 510n
preplace netloc Net2 1 1 4 NJ 410 NJ 410 1100 260 NJ
preplace netloc Sensor_sensor_bias 1 2 4 590 930 N 930 NJ 930 NJ
preplace netloc Sensor_sensor_bias_boost_pwr_ena_0 1 2 4 600 900 N 900 NJ 900 1890J
preplace netloc Sensor_sensor_bias_pwr_ena_0 1 2 4 580 910 N 910 NJ 910 NJ
preplace netloc Sensor_sensor_bias_volt_sel_0 1 2 4 570 920 N 920 NJ 920 1880J
preplace netloc Sensor_sensor_clk_fwd 1 2 4 550 950 N 950 NJ 950 NJ
preplace netloc Sensor_sensor_cmd 1 2 4 540 970 N 970 NJ 970 NJ
preplace netloc Sensor_sensor_core_pwr_ena_0 1 2 4 530 1030 N 1030 NJ 1030 NJ
preplace netloc Sensor_sensor_ena 1 2 4 560 880 1060 890 1540J 940 1890J
preplace netloc Sensor_sensor_io_pwr_ena_n_0 1 2 4 520 960 N 960 NJ 960 1880J
preplace netloc bnt_3_1 1 0 2 NJ 160 NJ
preplace netloc btn_0_0_1 1 0 2 NJ 100 NJ
preplace netloc btn_1_0_1 1 0 2 NJ 120 NJ
preplace netloc btn_2_0_1 1 0 2 NJ 140 NJ
preplace netloc buttons_btn_out_imm 1 2 3 650 30 NJ 30 1550J
preplace netloc clk_wiz_0_clk_sensor 1 1 1 110 470n
preplace netloc dcm_locked_1 1 1 2 NJ 510 620
preplace netloc edge_to_pulse_0_pulse_out 1 2 1 610 230n
preplace netloc extclk_1 1 0 1 NJ 450
preplace netloc gpio_concat_gpio 1 2 1 650 160n
preplace netloc gpio_splitter_0_act_led 1 4 2 1510J 720 1880J
preplace netloc gpio_splitter_0_lcd_led_level 1 4 1 1470 530n
preplace netloc gpio_splitter_focus_drive_ena 1 4 2 1480J 730 NJ
preplace netloc gpio_splitter_shtr_drive_ena 1 4 2 1490J 740 1880J
preplace netloc i2c_exp_irq_1 1 0 3 NJ 40 NJ 40 660J
preplace netloc lcd_backlight_ctrl_0_pulse_out 1 5 1 NJ 820
preplace netloc microblaze_0_Clk 1 1 4 130 460 640 870 1090 650 1590
preplace netloc noisy_in_0_1 1 0 2 NJ 330 140J
preplace netloc power_switch_fsm_0_fd_clk 1 5 1 NJ 630
preplace netloc power_switch_fsm_0_fd_dat 1 5 1 NJ 650
preplace netloc rst_clk_wiz_1_100M_bus_struct_reset 1 3 1 1070 170n
preplace netloc rst_clk_wiz_1_100M_peripheral_aresetn 1 1 4 150 500 650J 500 1040 250 1600
preplace netloc sensor_data_even_1 1 0 2 NJ 790 NJ
preplace netloc sensor_data_odd_1 1 0 2 NJ 810 NJ
preplace netloc AXIS_OSD_FIFO_M_AXIS 1 4 1 1520 220n
preplace netloc MCU_M09_AXI 1 1 3 160 520 N 520 1030
preplace netloc ISC0901_M_AXI 1 2 3 630 440 N 440 1540
preplace netloc External_RAM_HyperBus_R1 1 5 1 NJ 450
preplace netloc MPU_QSPI 1 3 3 1020J 40 NJ 40 NJ
preplace netloc MCU_M08_AXI 1 3 1 1050 260n
preplace netloc MCU_LUT_RAM_BRAM_CTRL 1 3 2 1080J 220 1500
preplace netloc MCU_M_AXI_CPU_IC 1 3 2 NJ 240 1580
preplace netloc AXIS_LCD_IMG_FIFO_M_AXIS 1 4 1 1510 200n
preplace netloc MCU_M_AXI_CPU_DC 1 3 2 1040J 230 1590
preplace netloc MCU_M10_AXI 1 2 2 660 420 1020
preplace netloc microblaze_0_dlmb_1 1 3 1 1050 110n
preplace netloc microblaze_0_ilmb_1 1 3 1 1060 130n
preplace netloc MPU_IIC 1 3 3 1030J 20 NJ 20 NJ
preplace netloc MPU_SPI 1 3 3 1040J 50 NJ 50 1880J
preplace netloc axi_datamover_0_M_AXI_MM2S 1 4 1 1560 370n
preplace netloc ISC0901_M_AXIS_IMG 1 2 1 630 650n
preplace netloc External_RAM_HyperBus_R0 1 5 1 NJ 430
preplace netloc S02_AXI_1 1 3 2 N 760 1530
levelinfo -pg 1 -110 10 340 840 1330 1750 1920
pagesize -pg 1 -db -bbox -sgen -290 0 2160 1290
"
}

  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_SoC()
cr_bd_SoC ""
set_property GENERATE_SYNTH_CHECKPOINT "0" [get_files SoC.bd ] 
set_property REGISTERED_WITH_MANAGER "1" [get_files SoC.bd ] 


# Create wrapper file for SoC.bd
make_wrapper -files [get_files SoC.bd] -import -top

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xc7s50csga324-1 -flow {Vivado Synthesis 2020} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2020" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Synthesis Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'synth_1_synth_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0] "" ] } {
  create_report_config -report_name synth_1_synth_report_utilization_0 -report_type report_utilization:1.0 -steps synth_design -runs synth_1
}
set obj [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0]
if { $obj != "" } {

}
set obj [get_runs synth_1]
set_property -name "part" -value "xc7s50csga324-1" -objects $obj
set_property -name "strategy" -value "Vivado Synthesis Defaults" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part xc7s50csga324-1 -flow {Vivado Implementation 2020} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2020" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Implementation Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'impl_1_init_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_init_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps init_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_opt_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_drc_0 -report_type report_drc:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_place_report_io_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0] "" ] } {
  create_report_config -report_name impl_1_place_report_io_0 -report_type report_io:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0] "" ] } {
  create_report_config -report_name impl_1_place_report_utilization_0 -report_type report_utilization:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_control_sets_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0] "" ] } {
  create_report_config -report_name impl_1_place_report_control_sets_0 -report_type report_control_sets:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0]
if { $obj != "" } {
set_property -name "options.verbose" -value "1" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_1' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_1 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_place_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_post_place_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_place_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_place_power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_route_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_route_report_drc_0 -report_type report_drc:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_methodology_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0] "" ] } {
  create_report_config -report_name impl_1_route_report_methodology_0 -report_type report_methodology:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_power_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0] "" ] } {
  create_report_config -report_name impl_1_route_report_power_0 -report_type report_power:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_route_status_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0] "" ] } {
  create_report_config -report_name impl_1_route_report_route_status_0 -report_type report_route_status:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_route_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_route_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_route_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_clock_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0] "" ] } {
  create_report_config -report_name impl_1_route_report_clock_utilization_0 -report_type report_clock_utilization:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_route_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
set obj [get_runs impl_1]
set_property -name "part" -value "xc7s50csga324-1" -objects $obj
set_property -name "strategy" -value "Vivado Implementation Defaults" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

# Change current directory to project folder
cd [file dirname [info script]]

puts "INFO: Project created:${_xil_proj_name_}"
# Create 'drc_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "drc_1" ] ] ""]} {
create_dashboard_gadget -name {drc_1} -type drc
}
set obj [get_dashboard_gadgets [ list "drc_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_drc_0" -objects $obj

# Create 'methodology_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "methodology_1" ] ] ""]} {
create_dashboard_gadget -name {methodology_1} -type methodology
}
set obj [get_dashboard_gadgets [ list "methodology_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_methodology_0" -objects $obj

# Create 'power_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "power_1" ] ] ""]} {
create_dashboard_gadget -name {power_1} -type power
}
set obj [get_dashboard_gadgets [ list "power_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_power_0" -objects $obj

# Create 'timing_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "timing_1" ] ] ""]} {
create_dashboard_gadget -name {timing_1} -type timing
}
set obj [get_dashboard_gadgets [ list "timing_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_timing_summary_0" -objects $obj

# Create 'utilization_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_1" ] ] ""]} {
create_dashboard_gadget -name {utilization_1} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_1" ] ]
set_property -name "reports" -value "synth_1#synth_1_synth_report_utilization_0" -objects $obj
set_property -name "run.step" -value "synth_design" -objects $obj
set_property -name "run.type" -value "synthesis" -objects $obj

# Create 'utilization_2' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_2" ] ] ""]} {
create_dashboard_gadget -name {utilization_2} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_2" ] ]
set_property -name "reports" -value "impl_1#impl_1_place_report_utilization_0" -objects $obj

move_dashboard_gadget -name {utilization_1} -row 0 -col 0
move_dashboard_gadget -name {power_1} -row 1 -col 0
move_dashboard_gadget -name {drc_1} -row 2 -col 0
move_dashboard_gadget -name {timing_1} -row 0 -col 1
move_dashboard_gadget -name {utilization_2} -row 1 -col 1
move_dashboard_gadget -name {methodology_1} -row 2 -col 1
