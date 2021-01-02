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
   "${origin_dir}/src/ip/AXIS_FIFO_2K_X16/AXIS_FIFO_2K_X16.xci" \
   "${origin_dir}/src/hdl/bad_pixel_replacer/axis_bpr_3x3_interpol.v" \
   "${origin_dir}/src/hdl/bad_pixel_replacer/axis_img_border_gen.v" \
   "${origin_dir}/src/hdl/bad_pixel_replacer/axis_img_border_remover.v" \
   "${origin_dir}/src/hdl/common/axis_pipeliner.v" \
   "${origin_dir}/src/hdl/bad_pixel_replacer/bpr_3x1_interpol.v" \
   "${origin_dir}/src/hdl/bad_pixel_replacer/bpr_3x3_interpol.v" \
   "${origin_dir}/src/hdl/bad_pixel_replacer/bpr_averager.v" \
   "${origin_dir}/src/hdl/common/pipeline.v" \
   "${origin_dir}/src/hdl/bad_pixel_replacer/axis_bad_pix_replacer.v" \
   "${origin_dir}/src/hdl/dma_ctrl_fsm.v" \
   "${origin_dir}/src/ip/DSP_LINEAR_FUNC/DSP_LINEAR_FUNC.xci" \
   "${origin_dir}/src/hdl/common/axis_2w_splitter.v" \
   "${origin_dir}/src/hdl/common/axis_dsp_linear_func.v" \
   "${origin_dir}/src/hdl/frame_averager/axis_frame_averager.v" \
   "${origin_dir}/src/ip/AXIS_HIST_SCALE_DIVIDER/AXIS_HIST_SCALE_DIVIDER.xci" \
   "${origin_dir}/src/ip/RAW_HIST_RAM/RAW_HIST_RAM.xci" \
   "${origin_dir}/src/hdl/hist_equalizer/hist_calc.v" \
   "${origin_dir}/src/hdl/hist_equalizer/hist_rebuilder.v" \
   "${origin_dir}/src/hdl/hist_equalizer/hist_scaler.v" \
   "${origin_dir}/src/hdl/hist_equalizer/axis_hist_equalizer.v" \
   "${origin_dir}/src/ip/HIST_LUT_RAM/HIST_LUT_RAM.xci" \
   "${origin_dir}/src/hdl/hist_equalizer/axis_hist_remapper.v" \
   "${origin_dir}/src/hdl/palette_lut/axis_palette_lut.v" \
   "${origin_dir}/src/hdl/common/rom128xN.v" \
   "${origin_dir}/src/hdl/lcd/lcd_cnsmr.v" \
   "${origin_dir}/src/hdl/nuc/nuc_dsp.v" \
   "${origin_dir}/src/hdl/nuc/axis_nuc.v" \
   "${origin_dir}/src/hdl/ISC0901_ctrl_fsm.v" \
   "${origin_dir}/src/hdl/gpio/gpio_concat.v" \
   "${origin_dir}/src/hdl/gpio/gpio_splitter.v" \
   "${origin_dir}/src/hdl/lcd/lcd_backlight_ctrl.v" \
   "${origin_dir}/src/hdl/misc/power_switch_fsm.v" \
   "${origin_dir}/src/hdl/common/s_axis_stub.v" \
   "${origin_dir}/src/hdl/top.v" \
   "${origin_dir}/src/hdl/common/m_axis_stub.v" \
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
set_property -name "webtalk.activehdl_export_sim" -value "21" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "21" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "21" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "21" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "21" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "21" -objects $obj
set_property -name "webtalk.xcelium_export_sim" -value "7" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "21" -objects $obj
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
 [file normalize "${origin_dir}/src/ip/AXIS_FIFO_2K_X16/AXIS_FIFO_2K_X16.xci"] \
 [file normalize "${origin_dir}/src/hdl/bad_pixel_replacer/axis_bpr_3x3_interpol.v"] \
 [file normalize "${origin_dir}/src/hdl/bad_pixel_replacer/axis_img_border_gen.v"] \
 [file normalize "${origin_dir}/src/hdl/bad_pixel_replacer/axis_img_border_remover.v"] \
 [file normalize "${origin_dir}/src/hdl/common/axis_pipeliner.v"] \
 [file normalize "${origin_dir}/src/hdl/bad_pixel_replacer/bpr_3x1_interpol.v"] \
 [file normalize "${origin_dir}/src/hdl/bad_pixel_replacer/bpr_3x3_interpol.v"] \
 [file normalize "${origin_dir}/src/hdl/bad_pixel_replacer/bpr_averager.v"] \
 [file normalize "${origin_dir}/src/hdl/common/pipeline.v"] \
 [file normalize "${origin_dir}/src/hdl/bad_pixel_replacer/axis_bad_pix_replacer.v"] \
 [file normalize "${origin_dir}/src/hdl/dma_ctrl_fsm.v"] \
 [file normalize "${origin_dir}/src/ip/DSP_LINEAR_FUNC/DSP_LINEAR_FUNC.xci"] \
 [file normalize "${origin_dir}/src/hdl/common/axis_2w_splitter.v"] \
 [file normalize "${origin_dir}/src/hdl/common/axis_dsp_linear_func.v"] \
 [file normalize "${origin_dir}/src/hdl/frame_averager/axis_frame_averager.v"] \
 [file normalize "${origin_dir}/src/ip/AXIS_HIST_SCALE_DIVIDER/AXIS_HIST_SCALE_DIVIDER.xci"] \
 [file normalize "${origin_dir}/src/ip/RAW_HIST_RAM/RAW_HIST_RAM.xci"] \
 [file normalize "${origin_dir}/src/hdl/hist_equalizer/hist_calc.v"] \
 [file normalize "${origin_dir}/src/hdl/hist_equalizer/hist_rebuilder.v"] \
 [file normalize "${origin_dir}/src/hdl/hist_equalizer/hist_scaler.v"] \
 [file normalize "${origin_dir}/src/hdl/hist_equalizer/axis_hist_equalizer.v"] \
 [file normalize "${origin_dir}/src/ip/HIST_LUT_RAM/HIST_LUT_RAM.xci"] \
 [file normalize "${origin_dir}/src/hdl/hist_equalizer/axis_hist_remapper.v"] \
 [file normalize "${origin_dir}/src/hdl/palette_lut/axis_palette_lut.v"] \
 [file normalize "${origin_dir}/src/hdl/common/rom128xN.v"] \
 [file normalize "${origin_dir}/src/hdl/lcd/lcd_cnsmr.v"] \
 [file normalize "${origin_dir}/src/hdl/nuc/nuc_dsp.v"] \
 [file normalize "${origin_dir}/src/hdl/nuc/axis_nuc.v"] \
 [file normalize "${origin_dir}/src/hdl/ISC0901_ctrl_fsm.v"] \
 [file normalize "${origin_dir}/src/hdl/gpio/gpio_concat.v"] \
 [file normalize "${origin_dir}/src/hdl/gpio/gpio_splitter.v"] \
 [file normalize "${origin_dir}/src/hdl/lcd/lcd_backlight_ctrl.v"] \
 [file normalize "${origin_dir}/src/hdl/misc/power_switch_fsm.v"] \
 [file normalize "${origin_dir}/src/hdl/common/s_axis_stub.v"] \
 [file normalize "${origin_dir}/src/hdl/top.v"] \
 [file normalize "${origin_dir}/src/hdl/common/m_axis_stub.v"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
set file "$origin_dir/src/ip/AXIS_FIFO_2K_X16/AXIS_FIFO_2K_X16.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/DSP_LINEAR_FUNC/DSP_LINEAR_FUNC.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/AXIS_HIST_SCALE_DIVIDER/AXIS_HIST_SCALE_DIVIDER.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/RAW_HIST_RAM/RAW_HIST_RAM.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj

set file "$origin_dir/src/ip/HIST_LUT_RAM/HIST_LUT_RAM.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj


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
set_property -name "target_part" -value "xc7s50csga324-1" -objects $obj

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
if { [get_files AXIS_FIFO_2K_X16.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/AXIS_FIFO_2K_X16/AXIS_FIFO_2K_X16.xci
}
if { [get_files axis_bpr_3x3_interpol.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/bad_pixel_replacer/axis_bpr_3x3_interpol.v
}
if { [get_files axis_img_border_gen.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/bad_pixel_replacer/axis_img_border_gen.v
}
if { [get_files axis_img_border_remover.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/bad_pixel_replacer/axis_img_border_remover.v
}
if { [get_files axis_pipeliner.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_pipeliner.v
}
if { [get_files bpr_3x1_interpol.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/bad_pixel_replacer/bpr_3x1_interpol.v
}
if { [get_files bpr_3x3_interpol.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/bad_pixel_replacer/bpr_3x3_interpol.v
}
if { [get_files bpr_averager.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/bad_pixel_replacer/bpr_averager.v
}
if { [get_files pipeline.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/pipeline.v
}
if { [get_files axis_bad_pix_replacer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/bad_pixel_replacer/axis_bad_pix_replacer.v
}
if { [get_files dma_ctrl_fsm.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/dma_ctrl_fsm.v
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
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/frame_averager/axis_frame_averager.v
}
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
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/hist_equalizer/hist_calc.v
}
if { [get_files hist_rebuilder.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/hist_equalizer/hist_rebuilder.v
}
if { [get_files hist_scaler.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/hist_equalizer/hist_scaler.v
}
if { [get_files axis_hist_equalizer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/hist_equalizer/axis_hist_equalizer.v
}
if { [get_files HIST_LUT_RAM.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/HIST_LUT_RAM/HIST_LUT_RAM.xci
}
if { [get_files axis_pipeliner.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_pipeliner.v
}
if { [get_files axis_hist_remapper.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/hist_equalizer/axis_hist_remapper.v
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
if { [get_files lcd_cnsmr.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/lcd/lcd_cnsmr.v
}
if { [get_files DSP_LINEAR_FUNC.xci] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/ip/DSP_LINEAR_FUNC/DSP_LINEAR_FUNC.xci
}
if { [get_files axis_pipeliner.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/axis_pipeliner.v
}
if { [get_files nuc_dsp.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/nuc/nuc_dsp.v
}
if { [get_files pipeline.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/common/pipeline.v
}
if { [get_files axis_nuc.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/nuc/axis_nuc.v
}
if { [get_files ISC0901_ctrl_fsm.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/ISC0901_ctrl_fsm.v
}
if { [get_files gpio_concat.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/gpio/gpio_concat.v
}
if { [get_files gpio_splitter.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/gpio/gpio_splitter.v
}
if { [get_files lcd_backlight_ctrl.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/lcd/lcd_backlight_ctrl.v
}
if { [get_files power_switch_fsm.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRV0901/src/hdl/misc/power_switch_fsm.v
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


# Proc to create BD SoC
proc cr_bd_SoC { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# gpio_concat, gpio_splitter, lcd_backlight_ctrl, power_switch_fsm, s_axis_stub, s_axis_stub, s_axis_stub, s_axis_stub, axis_bad_pix_replacer, dma_ctrl_fsm, axis_frame_averager, axis_hist_equalizer, axis_hist_remapper, axis_palette_lut, lcd_cnsmr, axis_nuc, ISC0901_ctrl_fsm



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
  xilinx.com:ip:axis_broadcaster:1.1\
  xilinx.com:ip:axis_dwidth_converter:1.1\
  xilinx.com:ip:clk_wiz:6.0\
  xilinx.com:ip:axis_data_fifo:2.0\
  xilinx.com:ip:axi_datamover:5.1\
  xilinx.com:ip:xpm_cdc_gen:1.0\
  xilinx.com:ip:xlconstant:1.1\
  OVGN:user:OpenHBMC:1.1\
  xilinx.com:ip:axis_subset_converter:1.1\
  xilinx.com:ip:blk_mem_gen:8.4\
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
  gpio_concat\
  gpio_splitter\
  lcd_backlight_ctrl\
  power_switch_fsm\
  s_axis_stub\
  s_axis_stub\
  s_axis_stub\
  s_axis_stub\
  axis_bad_pix_replacer\
  dma_ctrl_fsm\
  axis_frame_averager\
  axis_hist_equalizer\
  axis_hist_remapper\
  axis_palette_lut\
  lcd_cnsmr\
  axis_nuc\
  ISC0901_ctrl_fsm\
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
  
# Hierarchical cell: Sensor
proc create_hier_cell_Sensor { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_Sensor() - Empty argument(s)!"}
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

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_RTEMP

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_BIAS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_CMD


  # Create pins
  create_bd_pin -dir I -type clk clk_sensor
  create_bd_pin -dir I -type clk clk_sys
  create_bd_pin -dir O dest_arst
  create_bd_pin -dir O eol
  create_bd_pin -dir O sensor_bias
  create_bd_pin -dir O sensor_clk_fwd
  create_bd_pin -dir O sensor_cmd
  create_bd_pin -dir I sensor_data_even
  create_bd_pin -dir I sensor_data_odd
  create_bd_pin -dir O sensor_ena
  create_bd_pin -dir I sensor_rstn
  create_bd_pin -dir O sof_raw

  # Create instance: AXIS_SENSOR_FIFO, and set properties
  set AXIS_SENSOR_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_SENSOR_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {0} \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $AXIS_SENSOR_FIFO

  # Create instance: ISC0901_ctrl_fsm, and set properties
  set block_name ISC0901_ctrl_fsm
  set block_cell_name ISC0901_ctrl_fsm
  if { [catch {set ISC0901_ctrl_fsm [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ISC0901_ctrl_fsm eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
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
   CONFIG.CDC_TYPE {xpm_cdc_sync_rst} \
   CONFIG.DEST_SYNC_FF {3} \
 ] $sensor_domain_reset

  # Create instance: sof_raw_cdc, and set properties
  set sof_raw_cdc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xpm_cdc_gen:1.0 sof_raw_cdc ]
  set_property -dict [ list \
   CONFIG.CDC_TYPE {xpm_cdc_pulse} \
   CONFIG.DEST_SYNC_FF {3} \
   CONFIG.INIT_SYNC_FF {false} \
   CONFIG.REG_OUTPUT {true} \
   CONFIG.RST_USED {false} \
 ] $sof_raw_cdc

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M_AXIS_RTEMP] [get_bd_intf_pins ISC0901_ctrl_fsm/M_AXIS_RTEMP]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXIS_IMG] [get_bd_intf_pins AXIS_SENSOR_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S_AXIS_CMD] [get_bd_intf_pins ISC0901_ctrl_fsm/S_AXIS_CMD]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins S_AXIS_BIAS] [get_bd_intf_pins ISC0901_ctrl_fsm/S_AXIS_BIAS]
  connect_bd_intf_net -intf_net ISC0901_ctrl_fsm_0_M_AXIS_IMG [get_bd_intf_pins AXIS_SENSOR_FIFO/S_AXIS] [get_bd_intf_pins ISC0901_ctrl_fsm/M_AXIS_IMG]

  # Create port connections
  connect_bd_net -net ISC0901_ctrl_fsm_0_sof [get_bd_pins ISC0901_ctrl_fsm/sof] [get_bd_pins sof_raw_cdc/src_pulse]
  connect_bd_net -net ISC0901_ctrl_fsm_eol [get_bd_pins eol] [get_bd_pins ISC0901_ctrl_fsm/eol]
  connect_bd_net -net ISC0901_ctrl_fsm_fifo_aresetn [get_bd_pins ISC0901_ctrl_fsm/fifo_aresetn] [get_bd_pins fifo_aresetn_cdc/src_arst]
  connect_bd_net -net ISC0901_ctrl_fsm_sensor_bias [get_bd_pins sensor_bias] [get_bd_pins ISC0901_ctrl_fsm/sensor_bias]
  connect_bd_net -net ISC0901_ctrl_fsm_sensor_clk_fwd [get_bd_pins sensor_clk_fwd] [get_bd_pins ISC0901_ctrl_fsm/sensor_clk_fwd]
  connect_bd_net -net ISC0901_ctrl_fsm_sensor_cmd [get_bd_pins sensor_cmd] [get_bd_pins ISC0901_ctrl_fsm/sensor_cmd]
  connect_bd_net -net ISC0901_ctrl_fsm_sensor_ena [get_bd_pins sensor_ena] [get_bd_pins ISC0901_ctrl_fsm/sensor_ena]
  connect_bd_net -net fifo_aresetn_cdc_dest_arst [get_bd_pins dest_arst] [get_bd_pins AXIS_SENSOR_FIFO/s_axis_aresetn] [get_bd_pins fifo_aresetn_cdc/dest_arst]
  connect_bd_net -net m_axis_aclk_1 [get_bd_pins clk_sys] [get_bd_pins AXIS_SENSOR_FIFO/m_axis_aclk] [get_bd_pins fifo_aresetn_cdc/dest_clk] [get_bd_pins sof_raw_cdc/dest_clk]
  connect_bd_net -net sensor_data_even_1 [get_bd_pins sensor_data_even] [get_bd_pins ISC0901_ctrl_fsm/sensor_data_even]
  connect_bd_net -net sensor_data_odd_1 [get_bd_pins sensor_data_odd] [get_bd_pins ISC0901_ctrl_fsm/sensor_data_odd]
  connect_bd_net -net sensor_domain_reset_dest_rst_out [get_bd_pins ISC0901_ctrl_fsm/aresetn] [get_bd_pins sensor_domain_reset/dest_rst_out]
  connect_bd_net -net sof_raw_cdc_dest_pulse [get_bd_pins sof_raw] [get_bd_pins sof_raw_cdc/dest_pulse]
  connect_bd_net -net src_clk_1 [get_bd_pins clk_sensor] [get_bd_pins AXIS_SENSOR_FIFO/s_axis_aclk] [get_bd_pins ISC0901_ctrl_fsm/clk] [get_bd_pins sensor_domain_reset/dest_clk] [get_bd_pins sof_raw_cdc/src_clk]
  connect_bd_net -net src_rst_1 [get_bd_pins sensor_rstn] [get_bd_pins sensor_domain_reset/src_rst]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: NUC
proc create_hier_cell_NUC { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_NUC() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_NUC

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_GAIN

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_NUC

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_OFST


  # Create pins
  create_bd_pin -dir I -type clk axis_aclk
  create_bd_pin -dir I -type rst axis_aresetn
  create_bd_pin -dir I nuc_bypass

  # Create instance: AXIS_NUC_WC_1_TO_2, and set properties
  set AXIS_NUC_WC_1_TO_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 AXIS_NUC_WC_1_TO_2 ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {4} \
 ] $AXIS_NUC_WC_1_TO_2

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
  
  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_SENSOR_SINGLE_PIX1_M_AXIS [get_bd_intf_pins AXIS_NUC_WC_1_TO_2/M_AXIS] [get_bd_intf_pins axis_nuc/S_AXIS_RAW]
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M_AXIS_NUC] [get_bd_intf_pins axis_nuc/M_AXIS_NUC]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXIS_NUC] [get_bd_intf_pins AXIS_NUC_WC_1_TO_2/S_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S_AXIS_GAIN] [get_bd_intf_pins axis_nuc/S_AXIS_GAIN]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins S_AXIS_OFST] [get_bd_intf_pins axis_nuc/S_AXIS_OFST]

  # Create port connections
  connect_bd_net -net axis_aclk_1 [get_bd_pins axis_aclk] [get_bd_pins AXIS_NUC_WC_1_TO_2/aclk] [get_bd_pins axis_nuc/axis_aclk]
  connect_bd_net -net axis_aresetn_1 [get_bd_pins axis_aresetn] [get_bd_pins AXIS_NUC_WC_1_TO_2/aresetn] [get_bd_pins axis_nuc/axis_aresetn]
  connect_bd_net -net bypass_1 [get_bd_pins nuc_bypass] [get_bd_pins axis_nuc/bypass]

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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:bram_rtl:1.0 LUT_RAM_BRAM_CTRL

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_CPU_DC

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_CPU_IC

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 QSPI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 SPI


  # Create pins
  create_bd_pin -dir I -type clk Clk
  create_bd_pin -dir I dcm_locked
  create_bd_pin -dir I -from 3 -to 0 gpio2_io_i
  create_bd_pin -dir O -from 14 -to 0 gpio_io_o
  create_bd_pin -dir I -from 0 -to 0 i2c_exp_irq
  create_bd_pin -dir O -from 0 -to 0 -type rst peripheral_aresetn

  # Create instance: AXI_Lite_Interconnect, and set properties
  set AXI_Lite_Interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 AXI_Lite_Interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {8} \
   CONFIG.STRATEGY {1} \
 ] $AXI_Lite_Interconnect

  # Create instance: axi_gpio, and set properties
  set axi_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {0} \
   CONFIG.C_ALL_INPUTS_2 {1} \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO2_WIDTH {4} \
   CONFIG.C_GPIO_WIDTH {15} \
   CONFIG.C_INTERRUPT_PRESENT {1} \
   CONFIG.C_IS_DUAL {1} \
 ] $axi_gpio

  # Create instance: axi_iic, and set properties
  set axi_iic [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic ]

  # Create instance: axi_lut_ram_ctrl, and set properties
  set axi_lut_ram_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_lut_ram_ctrl ]
  set_property -dict [ list \
   CONFIG.READ_LATENCY {1} \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_lut_ram_ctrl

  # Create instance: axi_quad_spi, and set properties
  set axi_quad_spi [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi ]
  set_property -dict [ list \
   CONFIG.C_SPI_MEMORY {0} \
   CONFIG.C_SPI_MODE {2} \
   CONFIG.C_USE_STARTUP {0} \
 ] $axi_quad_spi

  # Create instance: axi_spi, and set properties
  set axi_spi [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_spi ]
  set_property -dict [ list \
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

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory $hier_obj microblaze_0_local_memory

  # Create instance: microblaze_irq_concat, and set properties
  set microblaze_irq_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_irq_concat ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {6} \
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
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins QSPI] [get_bd_intf_pins axi_quad_spi/SPI_0]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins IIC] [get_bd_intf_pins axi_iic/IIC]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins SPI] [get_bd_intf_pins axi_spi/SPI_0]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins LUT_RAM_BRAM_CTRL] [get_bd_intf_pins axi_lut_ram_ctrl/BRAM_PORTA]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins M_AXI_CPU_IC] [get_bd_intf_pins microblaze_0/M_AXI_IC]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins M_AXI_CPU_DC] [get_bd_intf_pins microblaze_0/M_AXI_DC]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins AXI_Lite_Interconnect/S00_AXI] [get_bd_intf_pins microblaze_0/M_AXI_DP]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins AXI_Lite_Interconnect/M00_AXI] [get_bd_intf_pins microblaze_0_axi_intc/s_axi]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_0_mdm_axi [get_bd_intf_pins AXI_Lite_Interconnect/M01_AXI] [get_bd_intf_pins mdm/S_AXI]

  # Create port connections
  connect_bd_net -net Clk_1 [get_bd_pins Clk] [get_bd_pins AXI_Lite_Interconnect/ACLK] [get_bd_pins AXI_Lite_Interconnect/M00_ACLK] [get_bd_pins AXI_Lite_Interconnect/M01_ACLK] [get_bd_pins AXI_Lite_Interconnect/M02_ACLK] [get_bd_pins AXI_Lite_Interconnect/M03_ACLK] [get_bd_pins AXI_Lite_Interconnect/M04_ACLK] [get_bd_pins AXI_Lite_Interconnect/M05_ACLK] [get_bd_pins AXI_Lite_Interconnect/M06_ACLK] [get_bd_pins AXI_Lite_Interconnect/M07_ACLK] [get_bd_pins AXI_Lite_Interconnect/S00_ACLK] [get_bd_pins axi_gpio/s_axi_aclk] [get_bd_pins axi_iic/s_axi_aclk] [get_bd_pins axi_lut_ram_ctrl/s_axi_aclk] [get_bd_pins axi_quad_spi/ext_spi_clk] [get_bd_pins axi_quad_spi/s_axi_aclk] [get_bd_pins axi_spi/ext_spi_clk] [get_bd_pins axi_spi/s_axi_aclk] [get_bd_pins axi_timer/s_axi_aclk] [get_bd_pins mdm/S_AXI_ACLK] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins rst_clk_wiz/slowest_sync_clk]
  connect_bd_net -net axi_gpio_gpio_io_o [get_bd_pins gpio_io_o] [get_bd_pins axi_gpio/gpio_io_o]
  connect_bd_net -net axi_gpio_ip2intc_irpt [get_bd_pins axi_gpio/ip2intc_irpt] [get_bd_pins microblaze_irq_concat/In0]
  connect_bd_net -net axi_iic_iic2intc_irpt [get_bd_pins axi_iic/iic2intc_irpt] [get_bd_pins microblaze_irq_concat/In1]
  connect_bd_net -net axi_quad_spi_ip2intc_irpt [get_bd_pins axi_quad_spi/ip2intc_irpt] [get_bd_pins microblaze_irq_concat/In2]
  connect_bd_net -net axi_spi_ip2intc_irpt [get_bd_pins axi_spi/ip2intc_irpt] [get_bd_pins microblaze_irq_concat/In5]
  connect_bd_net -net axi_timer_interrupt [get_bd_pins axi_timer/interrupt] [get_bd_pins microblaze_irq_concat/In4]
  connect_bd_net -net dcm_locked_1 [get_bd_pins dcm_locked] [get_bd_pins rst_clk_wiz/dcm_locked] [get_bd_pins rst_clk_wiz/ext_reset_in]
  connect_bd_net -net gpio2_io_i_1 [get_bd_pins gpio2_io_i] [get_bd_pins axi_gpio/gpio2_io_i]
  connect_bd_net -net i2c_exp_irq_1 [get_bd_pins i2c_exp_irq] [get_bd_pins microblaze_irq_concat/In3]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_irq_concat/dout]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_clk_wiz/mb_reset]
  connect_bd_net -net rst_clk_wiz_peripheral_aresetn [get_bd_pins peripheral_aresetn] [get_bd_pins AXI_Lite_Interconnect/ARESETN] [get_bd_pins AXI_Lite_Interconnect/M00_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M01_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M02_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M03_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M04_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M05_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M06_ARESETN] [get_bd_pins AXI_Lite_Interconnect/M07_ARESETN] [get_bd_pins AXI_Lite_Interconnect/S00_ARESETN] [get_bd_pins axi_gpio/s_axi_aresetn] [get_bd_pins axi_iic/s_axi_aresetn] [get_bd_pins axi_lut_ram_ctrl/s_axi_aresetn] [get_bd_pins axi_quad_spi/s_axi_aresetn] [get_bd_pins axi_spi/s_axi_aresetn] [get_bd_pins axi_timer/s_axi_aresetn] [get_bd_pins mdm/S_AXI_ARESETN] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins rst_clk_wiz/peripheral_aresetn]

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
  
  # Create instance: axis_subset_converter_0, and set properties
  set axis_subset_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 axis_subset_converter_0 ]
  set_property -dict [ list \
   CONFIG.M_TUSER_WIDTH {1} \
   CONFIG.S_TUSER_WIDTH {2} \
   CONFIG.TUSER_REMAP {tuser[1:1]} \
 ] $axis_subset_converter_0

  # Create instance: lcd_cnsmr, and set properties
  set block_name lcd_cnsmr
  set block_cell_name lcd_cnsmr
  if { [catch {set lcd_cnsmr [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $lcd_cnsmr eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.LCD_CLK_HZ {67500000} \
 ] $lcd_cnsmr

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
  connect_bd_intf_net -intf_net axis_osd_dwidth_converter_M_AXIS [get_bd_intf_pins axis_osd_dwidth_converter/M_AXIS] [get_bd_intf_pins axis_subset_converter_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_palette_lut_0_LUT_RAM [get_bd_intf_pins axis_palette_lut/LUT_RAM] [get_bd_intf_pins lcd_palette_lut_ram/BRAM_PORTB]
  connect_bd_intf_net -intf_net axis_palette_lut_0_M_AXIS [get_bd_intf_pins axis_palette_lut/M_AXIS] [get_bd_intf_pins lcd_cnsmr/S_AXIS_IMG]
  connect_bd_intf_net -intf_net axis_subset_converter_0_M_AXIS [get_bd_intf_pins axis_subset_converter_0/M_AXIS] [get_bd_intf_pins lcd_cnsmr/S_AXIS_OSD]

  # Create port connections
  connect_bd_net -net Net1 [get_bd_pins axis_img_dwidth_converter/aresetn] [get_bd_pins axis_osd_dwidth_converter/aresetn] [get_bd_pins axis_palette_lut/axis_aresetn] [get_bd_pins axis_subset_converter_0/aresetn] [get_bd_pins lcd_cnsmr/s_axis_aresetn] [get_bd_pins xpm_cdc_gen_0/dest_rst_out]
  connect_bd_net -net lcd_cnsmr_lcd_resetn [get_bd_pins lcd_resetn] [get_bd_pins lcd_cnsmr/lcd_resetn]
  connect_bd_net -net lcd_cnsmr_lcd_spi_scl [get_bd_pins lcd_spi_scl] [get_bd_pins lcd_cnsmr/lcd_spi_scl]
  connect_bd_net -net lcd_cnsmr_lcd_spi_sda [get_bd_pins lcd_spi_sda] [get_bd_pins lcd_cnsmr/lcd_spi_sda]
  connect_bd_net -net s_axis_aclk_1 [get_bd_pins clk_lcd] [get_bd_pins axis_img_dwidth_converter/aclk] [get_bd_pins axis_osd_dwidth_converter/aclk] [get_bd_pins axis_palette_lut/axis_aclk] [get_bd_pins axis_subset_converter_0/aclk] [get_bd_pins lcd_cnsmr/s_axis_aclk] [get_bd_pins xpm_cdc_gen_0/dest_clk]
  connect_bd_net -net src_rst_1 [get_bd_pins aresetn] [get_bd_pins xpm_cdc_gen_0/src_rst]

  # Restore current instance
  current_bd_instance $oldCurInst
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
  create_bd_pin -dir I sof

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
  connect_bd_net -net sof_1 [get_bd_pins sof] [get_bd_pins axis_hist_equalizer/sof]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: Frame_Averager
proc create_hier_cell_Frame_Averager { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_Frame_Averager() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_AVGO

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_IMG

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_AVGI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_IMG


  # Create pins
  create_bd_pin -dir I -from 2 -to 0 average_level
  create_bd_pin -dir I -type clk axis_aclk
  create_bd_pin -dir I -type rst axis_aresetn
  create_bd_pin -dir O sof_avg_out
  create_bd_pin -dir I sof_raw_in

  # Create instance: AXIS_AVG_WC_2_TO_1, and set properties
  set AXIS_AVG_WC_2_TO_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 AXIS_AVG_WC_2_TO_1 ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {2} \
 ] $AXIS_AVG_WC_2_TO_1

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

  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_SENSOR_SINGLE_PIX_M_AXIS [get_bd_intf_pins AXIS_AVG_WC_2_TO_1/M_AXIS] [get_bd_intf_pins axis_frame_averager/S_AXIS_IMG]
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M_AXIS_AVGO] [get_bd_intf_pins axis_frame_averager/M_AXIS_AVGO]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXIS_IMG] [get_bd_intf_pins AXIS_AVG_WC_2_TO_1/S_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S_AXIS_AVGI] [get_bd_intf_pins axis_frame_averager/S_AXIS_AVGI]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins M_AXIS_IMG] [get_bd_intf_pins axis_frame_averager/M_AXIS_IMG]

  # Create port connections
  connect_bd_net -net average_level_1 [get_bd_pins average_level] [get_bd_pins axis_frame_averager/average_level]
  connect_bd_net -net axis_aclk_1 [get_bd_pins axis_aclk] [get_bd_pins AXIS_AVG_WC_2_TO_1/aclk] [get_bd_pins axis_frame_averager/axis_aclk]
  connect_bd_net -net axis_aresetn_1 [get_bd_pins axis_aresetn] [get_bd_pins AXIS_AVG_WC_2_TO_1/aresetn] [get_bd_pins axis_frame_averager/axis_aresetn]
  connect_bd_net -net axis_frame_averager_sof_avg_out [get_bd_pins sof_avg_out] [get_bd_pins axis_frame_averager/sof_avg_out]
  connect_bd_net -net sof_raw_in_1 [get_bd_pins sof_raw_in] [get_bd_pins axis_frame_averager/sof_raw_in]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: External_RAM
proc create_hier_cell_External_RAM { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_External_RAM() - Empty argument(s)!"}
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
   CONFIG.NUM_SI {4} \
   CONFIG.S00_HAS_DATA_FIFO {2} \
   CONFIG.S01_HAS_DATA_FIFO {2} \
   CONFIG.S02_HAS_DATA_FIFO {2} \
   CONFIG.S03_HAS_DATA_FIFO {2} \
   CONFIG.STRATEGY {2} \
 ] $AXI_Full_Interconnect

  # Create instance: OpenHBMC_R0, and set properties
  set OpenHBMC_R0 [ create_bd_cell -type ip -vlnv OVGN:user:OpenHBMC:1.1 OpenHBMC_R0 ]
  set_property -dict [ list \
   CONFIG.C_HBMC_CLOCK_HZ {100000000} \
 ] $OpenHBMC_R0

  # Create instance: OpenHBMC_R1, and set properties
  set OpenHBMC_R1 [ create_bd_cell -type ip -vlnv OVGN:user:OpenHBMC:1.1 OpenHBMC_R1 ]
  set_property -dict [ list \
   CONFIG.C_HBMC_CLOCK_HZ {100000000} \
   CONFIG.C_IDELAYCTRL_INTEGRATED {false} \
 ] $OpenHBMC_R1

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins HyperBus_R0] [get_bd_intf_pins OpenHBMC_R0/HyperBus]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins HyperBus_R1] [get_bd_intf_pins OpenHBMC_R1/HyperBus]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins S03_AXI] [get_bd_intf_pins AXI_Full_Interconnect/S03_AXI]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins S02_AXI] [get_bd_intf_pins AXI_Full_Interconnect/S02_AXI]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins S01_AXI] [get_bd_intf_pins AXI_Full_Interconnect/S01_AXI]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins S00_AXI] [get_bd_intf_pins AXI_Full_Interconnect/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins AXI_Full_Interconnect/M00_AXI] [get_bd_intf_pins OpenHBMC_R0/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins AXI_Full_Interconnect/M01_AXI] [get_bd_intf_pins OpenHBMC_R1/S_AXI]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins ACLK] [get_bd_pins AXI_Full_Interconnect/ACLK] [get_bd_pins AXI_Full_Interconnect/M00_ACLK] [get_bd_pins AXI_Full_Interconnect/M01_ACLK] [get_bd_pins AXI_Full_Interconnect/S00_ACLK] [get_bd_pins AXI_Full_Interconnect/S01_ACLK] [get_bd_pins AXI_Full_Interconnect/S02_ACLK] [get_bd_pins AXI_Full_Interconnect/S03_ACLK] [get_bd_pins OpenHBMC_R0/s_axi_aclk] [get_bd_pins OpenHBMC_R1/s_axi_aclk]
  connect_bd_net -net ARESETN_1 [get_bd_pins ARESETN] [get_bd_pins AXI_Full_Interconnect/ARESETN] [get_bd_pins AXI_Full_Interconnect/M00_ARESETN] [get_bd_pins AXI_Full_Interconnect/M01_ARESETN] [get_bd_pins AXI_Full_Interconnect/S00_ARESETN] [get_bd_pins AXI_Full_Interconnect/S01_ARESETN] [get_bd_pins AXI_Full_Interconnect/S02_ARESETN] [get_bd_pins AXI_Full_Interconnect/S03_ARESETN] [get_bd_pins OpenHBMC_R0/s_axi_aresetn] [get_bd_pins OpenHBMC_R1/s_axi_aresetn]
  connect_bd_net -net clk_hbmc_0_1 [get_bd_pins clk_hbmc_0] [get_bd_pins OpenHBMC_R0/clk_hbmc_0] [get_bd_pins OpenHBMC_R1/clk_hbmc_0]
  connect_bd_net -net clk_hbmc_270_1 [get_bd_pins clk_hbmc_270] [get_bd_pins OpenHBMC_R0/clk_hbmc_270] [get_bd_pins OpenHBMC_R1/clk_hbmc_270]
  connect_bd_net -net clk_idelay_ref_1 [get_bd_pins clk_idelay_ref] [get_bd_pins OpenHBMC_R0/clk_idelay_ref] [get_bd_pins OpenHBMC_R1/clk_idelay_ref]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: DMA
proc create_hier_cell_DMA { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_DMA() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS4

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_BIAS_FIFO

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_CNSMR_0

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_CNSMR_1

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_CNSMR_2

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_CNSMR_3

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_GAIN_FIFO

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_LCD_IMG

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_OFST_FIFO

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_OSD

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS_SENSOR_CMD_FIFO

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_MM2S

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_S2MM

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_AVGO_FIFO

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_EQUAL_FIFO

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_RAW_FIFO

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_RTEMP_FIFO


  # Create pins
  create_bd_pin -dir I -type clk aclk
  create_bd_pin -dir I -type rst aresetn
  create_bd_pin -dir I -type clk clk_lcd
  create_bd_pin -dir I -type clk clk_sensor
  create_bd_pin -dir I -type rst fsm_aresetn
  create_bd_pin -dir I -type rst s_axis_aresetn
  create_bd_pin -dir I sof_avg_in
  create_bd_pin -dir I sof_raw_in
  create_bd_pin -dir I src_pulse

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

  # Create instance: AXIS_BIAS_FIFO, and set properties
  set AXIS_BIAS_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_BIAS_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.PROG_FULL_THRESH {337} \
 ] $AXIS_BIAS_FIFO

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

  # Create instance: AXIS_HE_WC_1_TO_4, and set properties
  set AXIS_HE_WC_1_TO_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 AXIS_HE_WC_1_TO_4 ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {4} \
 ] $AXIS_HE_WC_1_TO_4

  # Create instance: AXIS_LCD_IMG_FIFO, and set properties
  set AXIS_LCD_IMG_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_LCD_IMG_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.PROG_FULL_THRESH {256} \
 ] $AXIS_LCD_IMG_FIFO

  # Create instance: AXIS_OFST_FIFO, and set properties
  set AXIS_OFST_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_OFST_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {1} \
   CONFIG.IS_ACLK_ASYNC {0} \
   CONFIG.PROG_FULL_THRESH {337} \
 ] $AXIS_OFST_FIFO

  # Create instance: AXIS_OSD_FIFO, and set properties
  set AXIS_OSD_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_OSD_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_FULL {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.PROG_FULL_THRESH {256} \
 ] $AXIS_OSD_FIFO

  # Create instance: AXIS_RAW_FIFO, and set properties
  set AXIS_RAW_FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 AXIS_RAW_FIFO ]
  set_property -dict [ list \
   CONFIG.FIFO_MEMORY_TYPE {block} \
   CONFIG.HAS_PROG_EMPTY {1} \
   CONFIG.HAS_PROG_FULL {0} \
   CONFIG.IS_ACLK_ASYNC {0} \
   CONFIG.PROG_EMPTY_THRESH {167} \
 ] $AXIS_RAW_FIFO

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

  # Create instance: axi_datamover, and set properties
  set axi_datamover [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_datamover:5.1 axi_datamover ]
  set_property -dict [ list \
   CONFIG.c_dummy {1} \
   CONFIG.c_m_axi_mm2s_id_width {4} \
   CONFIG.c_m_axi_s2mm_id_width {4} \
   CONFIG.c_mm2s_btt_used {23} \
   CONFIG.c_mm2s_burst_size {128} \
   CONFIG.c_s2mm_btt_used {23} \
   CONFIG.c_s2mm_burst_size {64} \
 ] $axi_datamover

  # Create instance: dma_ctrl_fsm, and set properties
  set block_name dma_ctrl_fsm
  set block_cell_name dma_ctrl_fsm
  if { [catch {set dma_ctrl_fsm [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $dma_ctrl_fsm eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.C_IMAGE_AVERAGING_ENABLE {1} \
   CONFIG.C_RAM_BUFFERS_BASE_ADDR {0x76800000} \
 ] $dma_ctrl_fsm

  # Create instance: eol_raw_cdc, and set properties
  set eol_raw_cdc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xpm_cdc_gen:1.0 eol_raw_cdc ]
  set_property -dict [ list \
   CONFIG.CDC_TYPE {xpm_cdc_pulse} \
   CONFIG.DEST_SYNC_FF {3} \
   CONFIG.INIT_SYNC_FF {false} \
   CONFIG.REG_OUTPUT {true} \
   CONFIG.RST_USED {false} \
 ] $eol_raw_cdc

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
 ] $xlconstant_1

  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_AVGO_FIFO_M_AXIS [get_bd_intf_pins AXIS_AVGO_FIFO/M_AXIS] [get_bd_intf_pins dma_ctrl_fsm/S_AXIS_AVGO]
  connect_bd_intf_net -intf_net AXIS_EQUAL_FIFO_M_AXIS [get_bd_intf_pins AXIS_EQUAL_FIFO/M_AXIS] [get_bd_intf_pins dma_ctrl_fsm/S_AXIS_EQUAL]
  connect_bd_intf_net -intf_net AXIS_HE_WC_1_TO_4_M_AXIS [get_bd_intf_pins AXIS_EQUAL_FIFO/S_AXIS] [get_bd_intf_pins AXIS_HE_WC_1_TO_4/M_AXIS]
  connect_bd_intf_net -intf_net AXIS_RAW_FIFO_M_AXIS [get_bd_intf_pins AXIS_RAW_FIFO/M_AXIS] [get_bd_intf_pins dma_ctrl_fsm/S_AXIS_RAW]
  connect_bd_intf_net -intf_net AXIS_RTEMP_FIFO_M_AXIS [get_bd_intf_pins AXIS_RTEMP_FIFO/M_AXIS] [get_bd_intf_pins dma_ctrl_fsm/S_AXIS_RTEMP]
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M_AXIS_LCD_IMG] [get_bd_intf_pins AXIS_LCD_IMG_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXIS_OSD] [get_bd_intf_pins AXIS_OSD_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M_AXI_S2MM] [get_bd_intf_pins axi_datamover/M_AXI_S2MM]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins M_AXI_MM2S] [get_bd_intf_pins axi_datamover/M_AXI_MM2S]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins S_AXIS_RTEMP_FIFO] [get_bd_intf_pins AXIS_RTEMP_FIFO/S_AXIS]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins M_AXIS_GAIN_FIFO] [get_bd_intf_pins AXIS_GAIN_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net Conn7 [get_bd_intf_pins M_AXIS_BIAS_FIFO] [get_bd_intf_pins AXIS_BIAS_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net Conn8 [get_bd_intf_pins M_AXIS_SENSOR_CMD_FIFO] [get_bd_intf_pins AXIS_SENSOR_CMD_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net Conn9 [get_bd_intf_pins S_AXIS_AVGO_FIFO] [get_bd_intf_pins AXIS_AVGO_FIFO/S_AXIS]
  connect_bd_intf_net -intf_net Conn10 [get_bd_intf_pins M_AXIS_CNSMR_0] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_CNSMR_0]
  connect_bd_intf_net -intf_net Conn11 [get_bd_intf_pins M_AXIS_OFST_FIFO] [get_bd_intf_pins AXIS_OFST_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net Conn12 [get_bd_intf_pins M_AXIS_CNSMR_2] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_CNSMR_2]
  connect_bd_intf_net -intf_net Conn13 [get_bd_intf_pins M_AXIS4] [get_bd_intf_pins AXIS_AVGI_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net Conn14 [get_bd_intf_pins M_AXIS_CNSMR_1] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_CNSMR_1]
  connect_bd_intf_net -intf_net Conn15 [get_bd_intf_pins M_AXIS_CNSMR_3] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_CNSMR_3]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_pins S_AXIS_EQUAL_FIFO] [get_bd_intf_pins AXIS_HE_WC_1_TO_4/S_AXIS]
  connect_bd_intf_net -intf_net S_AXIS_RAW_FIFO_1 [get_bd_intf_pins S_AXIS_RAW_FIFO] [get_bd_intf_pins AXIS_RAW_FIFO/S_AXIS]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXIS_MM2S [get_bd_intf_pins axi_datamover/M_AXIS_MM2S] [get_bd_intf_pins dma_ctrl_fsm/S_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXIS_MM2S_STS [get_bd_intf_pins axi_datamover/M_AXIS_MM2S_STS] [get_bd_intf_pins dma_ctrl_fsm/S_AXIS_MM2S_STS]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXIS_S2MM_STS [get_bd_intf_pins axi_datamover/M_AXIS_S2MM_STS] [get_bd_intf_pins dma_ctrl_fsm/S_AXIS_S2MM_STS]
  connect_bd_intf_net -intf_net dma_ctrl_fsm_0_M_AXIS_MM2S_CMD [get_bd_intf_pins axi_datamover/S_AXIS_MM2S_CMD] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_MM2S_CMD]
  connect_bd_intf_net -intf_net dma_ctrl_fsm_0_M_AXIS_S2MM [get_bd_intf_pins axi_datamover/S_AXIS_S2MM] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_S2MM]
  connect_bd_intf_net -intf_net dma_ctrl_fsm_0_M_AXIS_S2MM_CMD [get_bd_intf_pins axi_datamover/S_AXIS_S2MM_CMD] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_S2MM_CMD]
  connect_bd_intf_net -intf_net dma_ctrl_fsm_M_AXIS_AVGI [get_bd_intf_pins AXIS_AVGI_FIFO/S_AXIS] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_AVGI]
  connect_bd_intf_net -intf_net dma_ctrl_fsm_M_AXIS_BIAS [get_bd_intf_pins AXIS_BIAS_FIFO/S_AXIS] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_BIAS]
  connect_bd_intf_net -intf_net dma_ctrl_fsm_M_AXIS_CNSMR_4 [get_bd_intf_pins AXIS_LCD_IMG_FIFO/S_AXIS] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_CNSMR_4]
  connect_bd_intf_net -intf_net dma_ctrl_fsm_M_AXIS_GAIN [get_bd_intf_pins AXIS_GAIN_FIFO/S_AXIS] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_GAIN]
  connect_bd_intf_net -intf_net dma_ctrl_fsm_M_AXIS_OFST [get_bd_intf_pins AXIS_OFST_FIFO/S_AXIS] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_OFST]
  connect_bd_intf_net -intf_net dma_ctrl_fsm_M_AXIS_OSD [get_bd_intf_pins AXIS_OSD_FIFO/S_AXIS] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_OSD]
  connect_bd_intf_net -intf_net dma_ctrl_fsm_M_AXIS_SENSOR_CMD [get_bd_intf_pins AXIS_SENSOR_CMD_FIFO/S_AXIS] [get_bd_intf_pins dma_ctrl_fsm/M_AXIS_SENSOR_CMD]

  # Create port connections
  connect_bd_net -net AXIS_AVGI_FIFO_prog_full [get_bd_pins AXIS_AVGI_FIFO/prog_full] [get_bd_pins dma_ctrl_fsm/fifo_avgi_prog_full]
  connect_bd_net -net AXIS_AVGO_FIFO_prog_empty [get_bd_pins AXIS_AVGO_FIFO/prog_empty] [get_bd_pins dma_ctrl_fsm/fifo_avgo_prog_empty]
  connect_bd_net -net AXIS_BIAS_FIFO_prog_full [get_bd_pins AXIS_BIAS_FIFO/prog_full] [get_bd_pins dma_ctrl_fsm/fifo_bias_prog_full]
  connect_bd_net -net AXIS_EQUAL_FIFO_prog_empty [get_bd_pins AXIS_EQUAL_FIFO/prog_empty] [get_bd_pins dma_ctrl_fsm/fifo_equal_prog_empty]
  connect_bd_net -net AXIS_GAIN_FIFO_prog_full [get_bd_pins AXIS_GAIN_FIFO/prog_full] [get_bd_pins dma_ctrl_fsm/fifo_gain_prog_full]
  connect_bd_net -net AXIS_IMG_FIFO_prog_full [get_bd_pins AXIS_LCD_IMG_FIFO/prog_full] [get_bd_pins dma_ctrl_fsm/fifo_cnsmr_4_prog_full]
  connect_bd_net -net AXIS_OFST_FIFO_prog_full [get_bd_pins AXIS_OFST_FIFO/prog_full] [get_bd_pins dma_ctrl_fsm/fifo_ofst_prog_full]
  connect_bd_net -net AXIS_OSD_FIFO_prog_full [get_bd_pins AXIS_OSD_FIFO/prog_full] [get_bd_pins dma_ctrl_fsm/fifo_osd_prog_full]
  connect_bd_net -net AXIS_RAW_FIFO_prog_empty [get_bd_pins AXIS_RAW_FIFO/prog_empty] [get_bd_pins dma_ctrl_fsm/fifo_raw_prog_empty]
  connect_bd_net -net eol_raw_cdc_dest_pulse [get_bd_pins dma_ctrl_fsm/eol_strb] [get_bd_pins eol_raw_cdc/dest_pulse]
  connect_bd_net -net fsm_aresetn_1 [get_bd_pins fsm_aresetn] [get_bd_pins AXIS_EQUAL_FIFO/s_axis_aresetn] [get_bd_pins AXIS_HE_WC_1_TO_4/aresetn] [get_bd_pins dma_ctrl_fsm/fsm_aresetn]
  connect_bd_net -net m_axi_mm2s_aclk_1 [get_bd_pins aclk] [get_bd_pins AXIS_AVGI_FIFO/s_axis_aclk] [get_bd_pins AXIS_AVGO_FIFO/s_axis_aclk] [get_bd_pins AXIS_BIAS_FIFO/s_axis_aclk] [get_bd_pins AXIS_EQUAL_FIFO/s_axis_aclk] [get_bd_pins AXIS_GAIN_FIFO/s_axis_aclk] [get_bd_pins AXIS_HE_WC_1_TO_4/aclk] [get_bd_pins AXIS_LCD_IMG_FIFO/s_axis_aclk] [get_bd_pins AXIS_OFST_FIFO/s_axis_aclk] [get_bd_pins AXIS_OSD_FIFO/s_axis_aclk] [get_bd_pins AXIS_RAW_FIFO/s_axis_aclk] [get_bd_pins AXIS_RTEMP_FIFO/m_axis_aclk] [get_bd_pins AXIS_SENSOR_CMD_FIFO/s_axis_aclk] [get_bd_pins axi_datamover/m_axi_mm2s_aclk] [get_bd_pins axi_datamover/m_axi_s2mm_aclk] [get_bd_pins axi_datamover/m_axis_mm2s_cmdsts_aclk] [get_bd_pins axi_datamover/m_axis_s2mm_cmdsts_awclk] [get_bd_pins dma_ctrl_fsm/axis_aclk] [get_bd_pins eol_raw_cdc/dest_clk]
  connect_bd_net -net m_axi_mm2s_aresetn_1 [get_bd_pins aresetn] [get_bd_pins AXIS_LCD_IMG_FIFO/s_axis_aresetn] [get_bd_pins AXIS_OSD_FIFO/s_axis_aresetn] [get_bd_pins axi_datamover/m_axi_mm2s_aresetn] [get_bd_pins axi_datamover/m_axi_s2mm_aresetn] [get_bd_pins axi_datamover/m_axis_mm2s_cmdsts_aresetn] [get_bd_pins axi_datamover/m_axis_s2mm_cmdsts_aresetn] [get_bd_pins dma_ctrl_fsm/axis_aresetn]
  connect_bd_net -net m_axis_aclk_1 [get_bd_pins clk_lcd] [get_bd_pins AXIS_LCD_IMG_FIFO/m_axis_aclk] [get_bd_pins AXIS_OSD_FIFO/m_axis_aclk]
  connect_bd_net -net s_axis_aclk_1 [get_bd_pins clk_sensor] [get_bd_pins AXIS_BIAS_FIFO/m_axis_aclk] [get_bd_pins AXIS_RTEMP_FIFO/s_axis_aclk] [get_bd_pins AXIS_SENSOR_CMD_FIFO/m_axis_aclk] [get_bd_pins eol_raw_cdc/src_clk]
  connect_bd_net -net s_axis_aresetn_1 [get_bd_pins s_axis_aresetn] [get_bd_pins AXIS_AVGI_FIFO/s_axis_aresetn] [get_bd_pins AXIS_AVGO_FIFO/s_axis_aresetn] [get_bd_pins AXIS_BIAS_FIFO/s_axis_aresetn] [get_bd_pins AXIS_GAIN_FIFO/s_axis_aresetn] [get_bd_pins AXIS_OFST_FIFO/s_axis_aresetn] [get_bd_pins AXIS_RAW_FIFO/s_axis_aresetn] [get_bd_pins AXIS_RTEMP_FIFO/s_axis_aresetn] [get_bd_pins AXIS_SENSOR_CMD_FIFO/s_axis_aresetn]
  connect_bd_net -net sof_avg_in_1 [get_bd_pins sof_avg_in] [get_bd_pins dma_ctrl_fsm/sof_avg_in]
  connect_bd_net -net sof_raw_in_1 [get_bd_pins sof_raw_in] [get_bd_pins dma_ctrl_fsm/sof_raw_in]
  connect_bd_net -net src_pulse_1 [get_bd_pins src_pulse] [get_bd_pins eol_raw_cdc/src_pulse]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins dma_ctrl_fsm/fifo_cnsmr_0_prog_full] [get_bd_pins dma_ctrl_fsm/fifo_cnsmr_1_prog_full] [get_bd_pins dma_ctrl_fsm/fifo_cnsmr_2_prog_full] [get_bd_pins dma_ctrl_fsm/fifo_cnsmr_3_prog_full] [get_bd_pins xlconstant_1/dout]

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

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_DRIVES {BUFG} \
   CONFIG.CLKOUT1_JITTER {297.524} \
   CONFIG.CLKOUT1_PHASE_ERROR {260.372} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {73.63636} \
   CONFIG.CLKOUT1_USED {true} \
   CONFIG.CLKOUT2_DRIVES {BUFG} \
   CONFIG.CLKOUT2_JITTER {328.550} \
   CONFIG.CLKOUT2_PHASE_ERROR {260.372} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {54} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_DRIVES {BUFG} \
   CONFIG.CLKOUT3_JITTER {305.581} \
   CONFIG.CLKOUT3_PHASE_ERROR {260.372} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {67.5} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLKOUT4_DRIVES {BUFG} \
   CONFIG.CLKOUT5_DRIVES {BUFG} \
   CONFIG.CLKOUT6_DRIVES {BUFG} \
   CONFIG.CLKOUT7_DRIVES {BUFG} \
   CONFIG.CLK_OUT1_PORT {clk_sensor} \
   CONFIG.CLK_OUT2_PORT {clk_mmcm} \
   CONFIG.CLK_OUT3_PORT {clk_lcd} \
   CONFIG.FEEDBACK_SOURCE {FDBK_AUTO} \
   CONFIG.MMCM_BANDWIDTH {OPTIMIZED} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {30.000} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {11.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {15} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {12} \
   CONFIG.MMCM_COMPENSATION {ZHOLD} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {3} \
   CONFIG.PRIMITIVE {MMCM} \
   CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_1 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {185.18} \
   CONFIG.CLKOUT1_JITTER {263.316} \
   CONFIG.CLKOUT1_PHASE_ERROR {348.562} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200.000} \
   CONFIG.CLKOUT2_JITTER {289.703} \
   CONFIG.CLKOUT2_PHASE_ERROR {348.562} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {100.000} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {289.703} \
   CONFIG.CLKOUT3_PHASE_ERROR {348.562} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {100.000} \
   CONFIG.CLKOUT3_REQUESTED_PHASE {0.000} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLKOUT4_JITTER {289.703} \
   CONFIG.CLKOUT4_PHASE_ERROR {348.562} \
   CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {100.000} \
   CONFIG.CLKOUT4_REQUESTED_PHASE {270.000} \
   CONFIG.CLKOUT4_USED {true} \
   CONFIG.CLKOUT5_JITTER {383.423} \
   CONFIG.CLKOUT5_PHASE_ERROR {355.220} \
   CONFIG.CLKOUT5_REQUESTED_OUT_FREQ {100.000} \
   CONFIG.CLKOUT5_USED {false} \
   CONFIG.CLK_OUT1_PORT {clk_idelay_ref} \
   CONFIG.CLK_OUT2_PORT {clk_sys} \
   CONFIG.CLK_OUT3_PORT {clk_ram_0} \
   CONFIG.CLK_OUT4_PORT {clk_ram_270} \
   CONFIG.CLK_OUT5_PORT {clk_out5} \
   CONFIG.JITTER_SEL {No_Jitter} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {50.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {18.518} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {4.500} \
   CONFIG.MMCM_CLKOUT0_DUTY_CYCLE {0.500} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {9} \
   CONFIG.MMCM_CLKOUT1_DUTY_CYCLE {0.500} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {9} \
   CONFIG.MMCM_CLKOUT2_DUTY_CYCLE {0.500} \
   CONFIG.MMCM_CLKOUT2_PHASE {0.000} \
   CONFIG.MMCM_CLKOUT3_DIVIDE {9} \
   CONFIG.MMCM_CLKOUT3_DUTY_CYCLE {0.500} \
   CONFIG.MMCM_CLKOUT3_PHASE {270.000} \
   CONFIG.MMCM_CLKOUT4_DIVIDE {1} \
   CONFIG.MMCM_DIVCLK_DIVIDE {3} \
   CONFIG.NUM_OUT_CLKS {4} \
   CONFIG.PRIM_SOURCE {Global_buffer} \
   CONFIG.RESET_PORT {resetn} \
   CONFIG.RESET_TYPE {ACTIVE_LOW} \
   CONFIG.USE_MIN_POWER {false} \
 ] $clk_wiz_1

  # Create port connections
  connect_bd_net -net clk_wiz_0_clk_lcd [get_bd_pins clk_lcd] [get_bd_pins clk_wiz_0/clk_lcd]
  connect_bd_net -net clk_wiz_0_clk_mmcm [get_bd_pins clk_wiz_0/clk_mmcm] [get_bd_pins clk_wiz_1/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_sensor [get_bd_pins clk_sensor] [get_bd_pins clk_wiz_0/clk_sensor]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins clk_wiz_1/resetn]
  connect_bd_net -net clk_wiz_1_clk_idelay_ref [get_bd_pins clk_idelay_ref] [get_bd_pins clk_wiz_1/clk_idelay_ref]
  connect_bd_net -net clk_wiz_1_clk_ram_0 [get_bd_pins clk_ram_0] [get_bd_pins clk_wiz_1/clk_ram_0]
  connect_bd_net -net clk_wiz_1_clk_ram_270 [get_bd_pins clk_ram_270] [get_bd_pins clk_wiz_1/clk_ram_270]
  connect_bd_net -net clk_wiz_1_clk_sys [get_bd_pins clk_sys] [get_bd_pins clk_wiz_1/clk_sys]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins locked] [get_bd_pins clk_wiz_1/locked]
  connect_bd_net -net extclk_1 [get_bd_pins extclk] [get_bd_pins clk_wiz_0/clk_in1]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: Bad_Pixel_Replacer
proc create_hier_cell_Bad_Pixel_Replacer { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_Bad_Pixel_Replacer() - Empty argument(s)!"}
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
  create_bd_pin -dir I -type clk axis_aclk
  create_bd_pin -dir I -type rst axis_aresetn
  create_bd_pin -dir I bpr_bypass

  # Create instance: AXIS_BPR_WC_2_TO_1, and set properties
  set AXIS_BPR_WC_2_TO_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 AXIS_BPR_WC_2_TO_1 ]
  set_property -dict [ list \
   CONFIG.M_TDATA_NUM_BYTES {2} \
 ] $AXIS_BPR_WC_2_TO_1

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
  
  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_WC_2_TO_1_M_AXIS [get_bd_intf_pins AXIS_BPR_WC_2_TO_1/M_AXIS] [get_bd_intf_pins axis_bad_pix_replacer/S_AXIS]
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M_AXIS] [get_bd_intf_pins axis_bad_pix_replacer/M_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins AXIS_BPR_WC_2_TO_1/S_AXIS]

  # Create port connections
  connect_bd_net -net axis_aclk_1 [get_bd_pins axis_aclk] [get_bd_pins AXIS_BPR_WC_2_TO_1/aclk] [get_bd_pins axis_bad_pix_replacer/axis_aclk]
  connect_bd_net -net axis_aresetn_1 [get_bd_pins axis_aresetn] [get_bd_pins AXIS_BPR_WC_2_TO_1/aresetn] [get_bd_pins axis_bad_pix_replacer/axis_aresetn]
  connect_bd_net -net bypass_1 [get_bd_pins bpr_bypass] [get_bd_pins axis_bad_pix_replacer/bypass]

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
  set bias_volt_sel [ create_bd_port -dir O bias_volt_sel ]
  set btn_0 [ create_bd_port -dir I btn_0 ]
  set btn_1 [ create_bd_port -dir I btn_1 ]
  set btn_2 [ create_bd_port -dir I btn_2 ]
  set btn_3 [ create_bd_port -dir I btn_3 ]
  set extclk [ create_bd_port -dir I -type clk -freq_hz 27000000 extclk ]
  set fd_clk [ create_bd_port -dir O -type clk fd_clk ]
  set fd_dat [ create_bd_port -dir O fd_dat ]
  set i2c_exp_irq [ create_bd_port -dir I -from 0 -to 0 i2c_exp_irq ]
  set lcd_led_ctrl [ create_bd_port -dir O lcd_led_ctrl ]
  set lcd_resetn [ create_bd_port -dir O -type rst lcd_resetn ]
  set lcd_spi_scl [ create_bd_port -dir O lcd_spi_scl ]
  set lcd_spi_sda [ create_bd_port -dir O lcd_spi_sda ]
  set sensor_bias [ create_bd_port -dir O sensor_bias ]
  set sensor_clk_fwd [ create_bd_port -dir O sensor_clk_fwd ]
  set sensor_cmd [ create_bd_port -dir O sensor_cmd ]
  set sensor_data_even [ create_bd_port -dir I sensor_data_even ]
  set sensor_data_odd [ create_bd_port -dir I sensor_data_odd ]
  set sensor_ena [ create_bd_port -dir O sensor_ena ]

  # Create instance: Bad_Pixel_Replacer
  create_hier_cell_Bad_Pixel_Replacer [current_bd_instance .] Bad_Pixel_Replacer

  # Create instance: Clk_System
  create_hier_cell_Clk_System [current_bd_instance .] Clk_System

  # Create instance: DMA
  create_hier_cell_DMA [current_bd_instance .] DMA

  # Create instance: External_RAM
  create_hier_cell_External_RAM [current_bd_instance .] External_RAM

  # Create instance: Frame_Averager
  create_hier_cell_Frame_Averager [current_bd_instance .] Frame_Averager

  # Create instance: Histogram_Equalization
  create_hier_cell_Histogram_Equalization [current_bd_instance .] Histogram_Equalization

  # Create instance: LCD
  create_hier_cell_LCD [current_bd_instance .] LCD

  # Create instance: MCU
  create_hier_cell_MCU [current_bd_instance .] MCU

  # Create instance: NUC
  create_hier_cell_NUC [current_bd_instance .] NUC

  # Create instance: Sensor
  create_hier_cell_Sensor [current_bd_instance .] Sensor

  # Create instance: axis_broadcaster, and set properties
  set axis_broadcaster [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster ]
  set_property -dict [ list \
   CONFIG.M02_TDATA_REMAP {tdata[31:0]} \
   CONFIG.NUM_MI {2} \
 ] $axis_broadcaster

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

  # Create instance: s_axis_stub_4, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_4
  if { [catch {set s_axis_stub_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_4 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: s_axis_stub_5, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_5
  if { [catch {set s_axis_stub_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_5 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: s_axis_stub_6, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_6
  if { [catch {set s_axis_stub_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_6 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: s_axis_stub_7, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_7
  if { [catch {set s_axis_stub_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_7 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net Bad_Pixel_Replacer_M_AXIS [get_bd_intf_pins Bad_Pixel_Replacer/M_AXIS] [get_bd_intf_pins Histogram_Equalization/S_AXIS]
  connect_bd_intf_net -intf_net DMA_M_AXIS4 [get_bd_intf_pins DMA/M_AXIS4] [get_bd_intf_pins Frame_Averager/S_AXIS_AVGI]
  connect_bd_intf_net -intf_net DMA_M_AXIS_BIAS_FIFO [get_bd_intf_pins DMA/M_AXIS_BIAS_FIFO] [get_bd_intf_pins Sensor/S_AXIS_BIAS]
  connect_bd_intf_net -intf_net DMA_M_AXIS_CNSMR_0 [get_bd_intf_pins DMA/M_AXIS_CNSMR_0] [get_bd_intf_pins s_axis_stub_4/S_AXIS_STUB]
  connect_bd_intf_net -intf_net DMA_M_AXIS_CNSMR_1 [get_bd_intf_pins DMA/M_AXIS_CNSMR_1] [get_bd_intf_pins s_axis_stub_5/S_AXIS_STUB]
  connect_bd_intf_net -intf_net DMA_M_AXIS_CNSMR_2 [get_bd_intf_pins DMA/M_AXIS_CNSMR_2] [get_bd_intf_pins s_axis_stub_6/S_AXIS_STUB]
  connect_bd_intf_net -intf_net DMA_M_AXIS_CNSMR_3 [get_bd_intf_pins DMA/M_AXIS_CNSMR_3] [get_bd_intf_pins s_axis_stub_7/S_AXIS_STUB]
  connect_bd_intf_net -intf_net DMA_M_AXIS_GAIN_FIFO [get_bd_intf_pins DMA/M_AXIS_GAIN_FIFO] [get_bd_intf_pins NUC/S_AXIS_GAIN]
  connect_bd_intf_net -intf_net DMA_M_AXIS_OFST_FIFO [get_bd_intf_pins DMA/M_AXIS_OFST_FIFO] [get_bd_intf_pins NUC/S_AXIS_OFST]
  connect_bd_intf_net -intf_net DMA_M_AXIS_SENSOR_CMD_FIFO [get_bd_intf_pins DMA/M_AXIS_SENSOR_CMD_FIFO] [get_bd_intf_pins Sensor/S_AXIS_CMD]
  connect_bd_intf_net -intf_net DMA_M_AXI_MM2S [get_bd_intf_pins DMA/M_AXI_MM2S] [get_bd_intf_pins External_RAM/S02_AXI]
  connect_bd_intf_net -intf_net DMA_M_AXI_S2MM [get_bd_intf_pins DMA/M_AXI_S2MM] [get_bd_intf_pins External_RAM/S03_AXI]
  connect_bd_intf_net -intf_net External_RAM_HyperBus_R0 [get_bd_intf_ports HyperBus_R0] [get_bd_intf_pins External_RAM/HyperBus_R0]
  connect_bd_intf_net -intf_net External_RAM_HyperBus_R1 [get_bd_intf_ports HyperBus_R1] [get_bd_intf_pins External_RAM/HyperBus_R1]
  connect_bd_intf_net -intf_net Histogram_Equalization_M_AXIS [get_bd_intf_pins DMA/S_AXIS_EQUAL_FIFO] [get_bd_intf_pins Histogram_Equalization/M_AXIS]
  connect_bd_intf_net -intf_net MCU_LUT_RAM_BRAM_CTRL [get_bd_intf_pins LCD/LUT_RAM] [get_bd_intf_pins MCU/LUT_RAM_BRAM_CTRL]
  connect_bd_intf_net -intf_net MCU_M_AXI_CPU_DC [get_bd_intf_pins External_RAM/S01_AXI] [get_bd_intf_pins MCU/M_AXI_CPU_DC]
  connect_bd_intf_net -intf_net MCU_M_AXI_CPU_IC [get_bd_intf_pins External_RAM/S00_AXI] [get_bd_intf_pins MCU/M_AXI_CPU_IC]
  connect_bd_intf_net -intf_net MPU_IIC [get_bd_intf_ports IIC] [get_bd_intf_pins MCU/IIC]
  connect_bd_intf_net -intf_net MPU_QSPI [get_bd_intf_ports QSPI] [get_bd_intf_pins MCU/QSPI]
  connect_bd_intf_net -intf_net MPU_SPI [get_bd_intf_ports SPI] [get_bd_intf_pins MCU/SPI]
  connect_bd_intf_net -intf_net NUC_M_AXIS_NUC [get_bd_intf_pins NUC/M_AXIS_NUC] [get_bd_intf_pins axis_broadcaster/S_AXIS]
  connect_bd_intf_net -intf_net S_AXIS_AVGO_FIFO_1 [get_bd_intf_pins DMA/S_AXIS_AVGO_FIFO] [get_bd_intf_pins Frame_Averager/M_AXIS_AVGO]
  connect_bd_intf_net -intf_net S_AXIS_IMG_1 [get_bd_intf_pins DMA/M_AXIS_LCD_IMG] [get_bd_intf_pins LCD/S_AXIS_IMG]
  connect_bd_intf_net -intf_net S_AXIS_IMG_2 [get_bd_intf_pins Frame_Averager/S_AXIS_IMG] [get_bd_intf_pins Sensor/M_AXIS_IMG]
  connect_bd_intf_net -intf_net S_AXIS_NUC_1 [get_bd_intf_pins Frame_Averager/M_AXIS_IMG] [get_bd_intf_pins NUC/S_AXIS_NUC]
  connect_bd_intf_net -intf_net S_AXIS_OSD_1 [get_bd_intf_pins DMA/M_AXIS_OSD] [get_bd_intf_pins LCD/S_AXIS_OSD]
  connect_bd_intf_net -intf_net S_AXIS_RTEMP_FIFO_1 [get_bd_intf_pins DMA/S_AXIS_RTEMP_FIFO] [get_bd_intf_pins Sensor/M_AXIS_RTEMP]
  connect_bd_intf_net -intf_net axis_broadcaster1_M00_AXIS [get_bd_intf_pins DMA/S_AXIS_RAW_FIFO] [get_bd_intf_pins axis_broadcaster/M00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_M01_AXIS [get_bd_intf_pins Bad_Pixel_Replacer/S_AXIS] [get_bd_intf_pins axis_broadcaster/M01_AXIS]

  # Create port connections
  connect_bd_net -net Clk_System_clk_idelay_ref [get_bd_pins Clk_System/clk_idelay_ref] [get_bd_pins External_RAM/clk_idelay_ref]
  connect_bd_net -net Clk_System_clk_ram_0 [get_bd_pins Clk_System/clk_ram_0] [get_bd_pins External_RAM/clk_hbmc_0]
  connect_bd_net -net Clk_System_clk_ram_270 [get_bd_pins Clk_System/clk_ram_270] [get_bd_pins External_RAM/clk_hbmc_270]
  connect_bd_net -net LCD_lcd_resetn [get_bd_ports lcd_resetn] [get_bd_pins LCD/lcd_resetn]
  connect_bd_net -net LCD_lcd_spi_scl [get_bd_ports lcd_spi_scl] [get_bd_pins LCD/lcd_spi_scl]
  connect_bd_net -net LCD_lcd_spi_sda [get_bd_ports lcd_spi_sda] [get_bd_pins LCD/lcd_spi_sda]
  connect_bd_net -net MPU_gpio_io_o [get_bd_pins MCU/gpio_io_o] [get_bd_pins gpio_splitter/gpio]
  connect_bd_net -net Net [get_bd_pins gpio_splitter/pwr_off_req] [get_bd_pins lcd_backlight_ctrl/srst] [get_bd_pins power_switch_fsm/pwr_off_req]
  connect_bd_net -net Net1 [get_bd_pins DMA/s_axis_aresetn] [get_bd_pins Frame_Averager/axis_aresetn] [get_bd_pins NUC/axis_aresetn] [get_bd_pins Sensor/dest_arst] [get_bd_pins axis_broadcaster/aresetn]
  connect_bd_net -net Net2 [get_bd_pins Clk_System/clk_lcd] [get_bd_pins DMA/clk_lcd] [get_bd_pins LCD/clk_lcd]
  connect_bd_net -net Sensor_eol [get_bd_pins DMA/src_pulse] [get_bd_pins Sensor/eol]
  connect_bd_net -net Sensor_sensor_bias [get_bd_ports sensor_bias] [get_bd_pins Sensor/sensor_bias]
  connect_bd_net -net Sensor_sensor_clk_fwd [get_bd_ports sensor_clk_fwd] [get_bd_pins Sensor/sensor_clk_fwd]
  connect_bd_net -net Sensor_sensor_cmd [get_bd_ports sensor_cmd] [get_bd_pins Sensor/sensor_cmd]
  connect_bd_net -net Sensor_sensor_ena [get_bd_ports sensor_ena] [get_bd_pins Sensor/sensor_ena]
  connect_bd_net -net axis_frame_averager_0_sof_avg_out [get_bd_pins DMA/sof_avg_in] [get_bd_pins Frame_Averager/sof_avg_out] [get_bd_pins Histogram_Equalization/sof]
  connect_bd_net -net bnt_3_1 [get_bd_ports btn_3] [get_bd_pins gpio_concat/btn_3] [get_bd_pins power_switch_fsm/btn_pressed]
  connect_bd_net -net btn_0_0_1 [get_bd_ports btn_0] [get_bd_pins gpio_concat/btn_0]
  connect_bd_net -net btn_1_0_1 [get_bd_ports btn_1] [get_bd_pins gpio_concat/btn_1]
  connect_bd_net -net btn_2_0_1 [get_bd_ports btn_2] [get_bd_pins gpio_concat/btn_2]
  connect_bd_net -net clk_wiz_0_clk_sensor [get_bd_pins Clk_System/clk_sensor] [get_bd_pins DMA/clk_sensor] [get_bd_pins Sensor/clk_sensor]
  connect_bd_net -net dcm_locked_1 [get_bd_pins Clk_System/locked] [get_bd_pins MCU/dcm_locked]
  connect_bd_net -net extclk_1 [get_bd_ports extclk] [get_bd_pins Clk_System/extclk]
  connect_bd_net -net gpio_concat_gpio [get_bd_pins MCU/gpio2_io_i] [get_bd_pins gpio_concat/gpio]
  connect_bd_net -net gpio_splitter_0_act_led [get_bd_ports act_led] [get_bd_pins gpio_splitter/act_led]
  connect_bd_net -net gpio_splitter_0_dma_fsm_aresetn [get_bd_pins Bad_Pixel_Replacer/axis_aresetn] [get_bd_pins DMA/fsm_aresetn] [get_bd_pins Histogram_Equalization/aresetn] [get_bd_pins Sensor/sensor_rstn] [get_bd_pins gpio_splitter/dma_fsm_aresetn]
  connect_bd_net -net gpio_splitter_0_lcd_led_level [get_bd_pins gpio_splitter/lcd_led_level] [get_bd_pins lcd_backlight_ctrl/level]
  connect_bd_net -net gpio_splitter_avg_level [get_bd_pins Frame_Averager/average_level] [get_bd_pins gpio_splitter/avg_level]
  connect_bd_net -net gpio_splitter_bias_volt_sel [get_bd_ports bias_volt_sel] [get_bd_pins gpio_splitter/bias_volt_sel]
  connect_bd_net -net gpio_splitter_bpr_bypass [get_bd_pins Bad_Pixel_Replacer/bpr_bypass] [get_bd_pins gpio_splitter/bpr_bypass]
  connect_bd_net -net gpio_splitter_nuc_bypass [get_bd_pins NUC/nuc_bypass] [get_bd_pins gpio_splitter/nuc_bypass]
  connect_bd_net -net i2c_exp_irq_1 [get_bd_ports i2c_exp_irq] [get_bd_pins MCU/i2c_exp_irq]
  connect_bd_net -net lcd_backlight_ctrl_0_pulse_out [get_bd_ports lcd_led_ctrl] [get_bd_pins lcd_backlight_ctrl/pulse_out]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins Bad_Pixel_Replacer/axis_aclk] [get_bd_pins Clk_System/clk_sys] [get_bd_pins DMA/aclk] [get_bd_pins External_RAM/ACLK] [get_bd_pins Frame_Averager/axis_aclk] [get_bd_pins Histogram_Equalization/aclk] [get_bd_pins MCU/Clk] [get_bd_pins NUC/axis_aclk] [get_bd_pins Sensor/clk_sys] [get_bd_pins axis_broadcaster/aclk] [get_bd_pins lcd_backlight_ctrl/clk] [get_bd_pins power_switch_fsm/clk] [get_bd_pins s_axis_stub_4/s_axis_aclk] [get_bd_pins s_axis_stub_5/s_axis_aclk] [get_bd_pins s_axis_stub_6/s_axis_aclk] [get_bd_pins s_axis_stub_7/s_axis_aclk]
  connect_bd_net -net power_switch_fsm_0_fd_clk [get_bd_ports fd_clk] [get_bd_pins power_switch_fsm/fd_clk]
  connect_bd_net -net power_switch_fsm_0_fd_dat [get_bd_ports fd_dat] [get_bd_pins power_switch_fsm/fd_dat]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins DMA/aresetn] [get_bd_pins External_RAM/ARESETN] [get_bd_pins LCD/aresetn] [get_bd_pins MCU/peripheral_aresetn] [get_bd_pins s_axis_stub_4/s_axis_aresetn] [get_bd_pins s_axis_stub_5/s_axis_aresetn] [get_bd_pins s_axis_stub_6/s_axis_aresetn] [get_bd_pins s_axis_stub_7/s_axis_aresetn]
  connect_bd_net -net sensor_data_even_1 [get_bd_ports sensor_data_even] [get_bd_pins Sensor/sensor_data_even]
  connect_bd_net -net sensor_data_odd_1 [get_bd_ports sensor_data_odd] [get_bd_pins Sensor/sensor_data_odd]
  connect_bd_net -net sof_strb_cdc_dest_pulse [get_bd_pins DMA/sof_raw_in] [get_bd_pins Frame_Averager/sof_raw_in] [get_bd_pins Sensor/sof_raw]

  # Create address segments
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces DMA/axi_datamover/Data_MM2S] [get_bd_addr_segs External_RAM/OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces DMA/axi_datamover/Data_S2MM] [get_bd_addr_segs External_RAM/OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces DMA/axi_datamover/Data_MM2S] [get_bd_addr_segs External_RAM/OpenHBMC_R1/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces DMA/axi_datamover/Data_S2MM] [get_bd_addr_segs External_RAM/OpenHBMC_R1/S_AXI/Mem] -force
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs External_RAM/OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Instruction] [get_bd_addr_segs External_RAM/OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs External_RAM/OpenHBMC_R1/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Instruction] [get_bd_addr_segs External_RAM/OpenHBMC_R1/S_AXI/Mem] -force
  assign_bd_address -offset 0x40000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_gpio/S_AXI/Reg] -force
  assign_bd_address -offset 0x40800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_iic/S_AXI/Reg] -force
  assign_bd_address -offset 0x50000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_lut_ram_ctrl/S_AXI/Mem0] -force
  assign_bd_address -offset 0x44A00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_quad_spi/AXI_LITE/Reg] -force
  assign_bd_address -offset 0x44A10000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_spi/AXI_LITE/Reg] -force
  assign_bd_address -offset 0x41C00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/axi_timer/S_AXI/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] -force
  assign_bd_address -offset 0x00000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Instruction] [get_bd_addr_segs MCU/microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] -force
  assign_bd_address -offset 0x41400000 -range 0x00001000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/mdm/S_AXI/Reg] -force
  assign_bd_address -offset 0x41200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces MCU/microblaze_0/Data] [get_bd_addr_segs MCU/microblaze_0_axi_intc/S_AXI/Reg] -force


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
