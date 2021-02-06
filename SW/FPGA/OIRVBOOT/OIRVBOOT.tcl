#*****************************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# OIRVBOOT.tcl: Tcl script for re-creating project 'OIRVBOOT'
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
   "${origin_dir}/src/hdl/common/axis_pipeliner.v" \
   "${origin_dir}/src/hdl/palette_lut/axis_palette_lut.v" \
   "${origin_dir}/src/hdl/common/rom128xN.v" \
   "${origin_dir}/src/hdl/LCD/lcd_ctrl.v" \
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
   "${origin_dir}/src/hdl/common/pipeline.v" \
   "${origin_dir}/src/hdl/common/m_axis_stub.v" \
   "${origin_dir}/src/sdk/hwboot/Release/hwboot.elf" \
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
set _xil_proj_name_ "OIRVBOOT"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "OIRVBOOT.tcl"

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
set_property -name "webtalk.activehdl_export_sim" -value "141" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "141" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "141" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "141" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "141" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "141" -objects $obj
set_property -name "webtalk.xcelium_export_sim" -value "1" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "141" -objects $obj
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
 [file normalize "${origin_dir}/src/hdl/common/axis_pipeliner.v"] \
 [file normalize "${origin_dir}/src/hdl/palette_lut/axis_palette_lut.v"] \
 [file normalize "${origin_dir}/src/hdl/common/rom128xN.v"] \
 [file normalize "${origin_dir}/src/hdl/LCD/lcd_ctrl.v"] \
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
 [file normalize "${origin_dir}/src/hdl/common/pipeline.v"] \
 [file normalize "${origin_dir}/src/hdl/common/m_axis_stub.v"] \
 [file normalize "${origin_dir}/src/sdk/hwboot/Release/hwboot.elf"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
set file "$origin_dir/src/sdk/hwboot/Release/hwboot.elf"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "scoped_to_cells" -value "microblaze_0" -objects $file_obj
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
if { [get_files axis_pipeliner.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/common/axis_pipeliner.v
}
if { [get_files axis_palette_lut.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/palette_lut/axis_palette_lut.v
}
if { [get_files rom128xN.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/common/rom128xN.v
}
if { [get_files lcd_ctrl.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/LCD/lcd_ctrl.v
}
if { [get_files s_axis_stub.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/common/s_axis_stub.v
}
if { [get_files s_axis_stub.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/common/s_axis_stub.v
}
if { [get_files s_axis_stub.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/common/s_axis_stub.v
}
if { [get_files s_axis_stub.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/common/s_axis_stub.v
}
if { [get_files vdma_ctrl.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/VDMA/vdma_ctrl.v
}
if { [get_files edge_to_pulse.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/common/edge_to_pulse.v
}
if { [get_files button_state_decoder.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/misc/button_state_decoder.v
}
if { [get_files edge_to_pulse.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/common/edge_to_pulse.v
}
if { [get_files button_state_decoder.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/misc/button_state_decoder.v
}
if { [get_files edge_to_pulse.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/common/edge_to_pulse.v
}
if { [get_files button_state_decoder.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/misc/button_state_decoder.v
}
if { [get_files edge_to_pulse.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/common/edge_to_pulse.v
}
if { [get_files button_state_decoder.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/misc/button_state_decoder.v
}
if { [get_files debouncer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/misc/debouncer.v
}
if { [get_files debouncer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/misc/debouncer.v
}
if { [get_files debouncer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/misc/debouncer.v
}
if { [get_files debouncer.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/misc/debouncer.v
}
if { [get_files gpio_concat.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/GPIO/gpio_concat.v
}
if { [get_files gpio_splitter.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/GPIO/gpio_splitter.v
}
if { [get_files lcd_backlight_ctrl.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/LCD/lcd_backlight_ctrl.v
}
if { [get_files power_switch_fsm.v] == "" } {
  import_files -quiet -fileset sources_1 D:/Work/Projects/IRV/Dev/OIRV/repo/SW/FPGA/OIRVBOOT/src/hdl/misc/power_switch_fsm.v
}


# Proc to create BD SoC
proc cr_bd_SoC { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# gpio_splitter, lcd_backlight_ctrl, power_switch_fsm, axis_palette_lut, lcd_ctrl, s_axis_stub, s_axis_stub, s_axis_stub, s_axis_stub, vdma_ctrl, button_state_decoder, button_state_decoder, button_state_decoder, button_state_decoder, debouncer, debouncer, debouncer, debouncer, gpio_concat



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
  OVGN:user:OpenHBMC:1.1\
  xilinx.com:ip:axi_bram_ctrl:4.1\
  xilinx.com:ip:axi_gpio:2.0\
  xilinx.com:ip:axi_hwicap:3.0\
  xilinx.com:ip:axi_iic:2.0\
  xilinx.com:ip:axi_quad_spi:3.2\
  xilinx.com:ip:axi_timer:2.0\
  xilinx.com:ip:mdm:3.2\
  xilinx.com:ip:microblaze:11.0\
  xilinx.com:ip:axi_intc:4.1\
  xilinx.com:ip:xlconcat:2.1\
  xilinx.com:ip:proc_sys_reset:5.0\
  xilinx.com:ip:clk_wiz:6.0\
  xilinx.com:ip:axis_dwidth_converter:1.1\
  xilinx.com:ip:blk_mem_gen:8.4\
  xilinx.com:ip:xpm_cdc_gen:1.0\
  xilinx.com:ip:axis_data_fifo:2.0\
  xilinx.com:ip:axi_datamover:5.1\
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
  axis_palette_lut\
  lcd_ctrl\
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
  create_bd_pin -dir O btn_3_out_imm
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir O -from 19 -to 0 gpio
  create_bd_pin -dir I noisy_in_0
  create_bd_pin -dir I noisy_in_1
  create_bd_pin -dir I noisy_in_2
  create_bd_pin -dir I noisy_in_3
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
   CONFIG.CLK_HZ {81000000} \
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
   CONFIG.CLK_HZ {81000000} \
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
   CONFIG.CLK_HZ {81000000} \
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
   CONFIG.CLK_HZ {81000000} \
 ] $button_state_decoder_3

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
   CONFIG.CLK_HZ {81000000} \
 ] $debouncer_0

  # Create instance: debouncer_1, and set properties
  set block_name debouncer
  set block_cell_name debouncer_1
  if { [catch {set debouncer_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $debouncer_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {81000000} \
 ] $debouncer_1

  # Create instance: debouncer_2, and set properties
  set block_name debouncer
  set block_cell_name debouncer_2
  if { [catch {set debouncer_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $debouncer_2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {81000000} \
 ] $debouncer_2

  # Create instance: debouncer_3, and set properties
  set block_name debouncer
  set block_cell_name debouncer_3
  if { [catch {set debouncer_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $debouncer_3 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {81000000} \
 ] $debouncer_3

  # Create instance: gpio_concat_0, and set properties
  set block_name gpio_concat
  set block_cell_name gpio_concat_0
  if { [catch {set gpio_concat_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gpio_concat_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net button_state_decoder_0_btn_out_down [get_bd_pins button_state_decoder_0/btn_out_down] [get_bd_pins gpio_concat_0/btn_0_down]
  connect_bd_net -net button_state_decoder_0_btn_out_imm [get_bd_pins button_state_decoder_0/btn_out_imm] [get_bd_pins gpio_concat_0/btn_0_imm]
  connect_bd_net -net button_state_decoder_0_btn_out_long [get_bd_pins button_state_decoder_0/btn_out_long] [get_bd_pins gpio_concat_0/btn_0_long]
  connect_bd_net -net button_state_decoder_0_btn_out_shrt [get_bd_pins button_state_decoder_0/btn_out_shrt] [get_bd_pins gpio_concat_0/btn_0_shrt]
  connect_bd_net -net button_state_decoder_0_btn_out_up [get_bd_pins button_state_decoder_0/btn_out_up] [get_bd_pins gpio_concat_0/btn_0_up]
  connect_bd_net -net button_state_decoder_1_btn_out_down [get_bd_pins button_state_decoder_1/btn_out_down] [get_bd_pins gpio_concat_0/btn_1_down]
  connect_bd_net -net button_state_decoder_1_btn_out_imm [get_bd_pins button_state_decoder_1/btn_out_imm] [get_bd_pins gpio_concat_0/btn_1_imm]
  connect_bd_net -net button_state_decoder_1_btn_out_long [get_bd_pins button_state_decoder_1/btn_out_long] [get_bd_pins gpio_concat_0/btn_1_long]
  connect_bd_net -net button_state_decoder_1_btn_out_shrt [get_bd_pins button_state_decoder_1/btn_out_shrt] [get_bd_pins gpio_concat_0/btn_1_shrt]
  connect_bd_net -net button_state_decoder_1_btn_out_up [get_bd_pins button_state_decoder_1/btn_out_up] [get_bd_pins gpio_concat_0/btn_1_up]
  connect_bd_net -net button_state_decoder_2_btn_out_down [get_bd_pins button_state_decoder_2/btn_out_down] [get_bd_pins gpio_concat_0/btn_2_down]
  connect_bd_net -net button_state_decoder_2_btn_out_imm [get_bd_pins button_state_decoder_2/btn_out_imm] [get_bd_pins gpio_concat_0/btn_2_imm]
  connect_bd_net -net button_state_decoder_2_btn_out_long [get_bd_pins button_state_decoder_2/btn_out_long] [get_bd_pins gpio_concat_0/btn_2_long]
  connect_bd_net -net button_state_decoder_2_btn_out_shrt [get_bd_pins button_state_decoder_2/btn_out_shrt] [get_bd_pins gpio_concat_0/btn_2_shrt]
  connect_bd_net -net button_state_decoder_2_btn_out_up [get_bd_pins button_state_decoder_2/btn_out_up] [get_bd_pins gpio_concat_0/btn_2_up]
  connect_bd_net -net button_state_decoder_3_btn_out_down [get_bd_pins button_state_decoder_3/btn_out_down] [get_bd_pins gpio_concat_0/btn_3_down]
  connect_bd_net -net button_state_decoder_3_btn_out_imm [get_bd_pins btn_3_out_imm] [get_bd_pins button_state_decoder_3/btn_out_imm] [get_bd_pins gpio_concat_0/btn_3_imm]
  connect_bd_net -net button_state_decoder_3_btn_out_long [get_bd_pins button_state_decoder_3/btn_out_long] [get_bd_pins gpio_concat_0/btn_3_long]
  connect_bd_net -net button_state_decoder_3_btn_out_shrt [get_bd_pins button_state_decoder_3/btn_out_shrt] [get_bd_pins gpio_concat_0/btn_3_shrt]
  connect_bd_net -net button_state_decoder_3_btn_out_up [get_bd_pins button_state_decoder_3/btn_out_up] [get_bd_pins gpio_concat_0/btn_3_up]
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins button_state_decoder_0/clk] [get_bd_pins button_state_decoder_1/clk] [get_bd_pins button_state_decoder_2/clk] [get_bd_pins button_state_decoder_3/clk] [get_bd_pins debouncer_0/clk] [get_bd_pins debouncer_1/clk] [get_bd_pins debouncer_2/clk] [get_bd_pins debouncer_3/clk]
  connect_bd_net -net debouncer_0_filtered_out [get_bd_pins button_state_decoder_0/btn_in] [get_bd_pins debouncer_0/filtered_out]
  connect_bd_net -net debouncer_1_filtered_out [get_bd_pins button_state_decoder_1/btn_in] [get_bd_pins debouncer_1/filtered_out]
  connect_bd_net -net debouncer_2_filtered_out [get_bd_pins button_state_decoder_2/btn_in] [get_bd_pins debouncer_2/filtered_out]
  connect_bd_net -net debouncer_3_filtered_out [get_bd_pins button_state_decoder_3/btn_in] [get_bd_pins debouncer_3/filtered_out]
  connect_bd_net -net gpio_concat_0_gpio [get_bd_pins gpio] [get_bd_pins gpio_concat_0/gpio]
  connect_bd_net -net noisy_in_0_1 [get_bd_pins noisy_in_0] [get_bd_pins debouncer_0/noisy_in]
  connect_bd_net -net noisy_in_1_1 [get_bd_pins noisy_in_1] [get_bd_pins debouncer_1/noisy_in]
  connect_bd_net -net noisy_in_2_1 [get_bd_pins noisy_in_2] [get_bd_pins debouncer_2/noisy_in]
  connect_bd_net -net noisy_in_3_1 [get_bd_pins noisy_in_3] [get_bd_pins debouncer_3/noisy_in]
  connect_bd_net -net rstn_1 [get_bd_pins rstn] [get_bd_pins button_state_decoder_0/rstn] [get_bd_pins button_state_decoder_1/rstn] [get_bd_pins button_state_decoder_2/rstn] [get_bd_pins button_state_decoder_3/rstn] [get_bd_pins debouncer_0/rstn] [get_bd_pins debouncer_1/rstn] [get_bd_pins debouncer_2/rstn] [get_bd_pins debouncer_3/rstn]

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

  # Create instance: axi_datamover_0, and set properties
  set axi_datamover_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_datamover:5.1 axi_datamover_0 ]
  set_property -dict [ list \
   CONFIG.c_dummy {1} \
   CONFIG.c_enable_s2mm {0} \
   CONFIG.c_include_s2mm {Omit} \
   CONFIG.c_include_s2mm_stsfifo {false} \
   CONFIG.c_m_axi_s2mm_awid {1} \
   CONFIG.c_mm2s_btt_used {23} \
   CONFIG.c_mm2s_burst_size {128} \
   CONFIG.c_mm2s_include_sf {false} \
   CONFIG.c_s2mm_addr_pipe_depth {3} \
   CONFIG.c_s2mm_include_sf {false} \
 ] $axi_datamover_0

  # Create instance: s_axis_stub_0, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_0
  if { [catch {set s_axis_stub_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: s_axis_stub_1, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_1
  if { [catch {set s_axis_stub_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: s_axis_stub_2, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_2
  if { [catch {set s_axis_stub_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: s_axis_stub_3, and set properties
  set block_name s_axis_stub
  set block_cell_name s_axis_stub_3
  if { [catch {set s_axis_stub_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $s_axis_stub_3 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: vdma_ctrl_0, and set properties
  set block_name vdma_ctrl
  set block_cell_name vdma_ctrl_0
  if { [catch {set vdma_ctrl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vdma_ctrl_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins vdma_ctrl_0/S_AXI_LITE]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXI_MM2S] [get_bd_intf_pins axi_datamover_0/M_AXI_MM2S]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M_AXIS_IMG] [get_bd_intf_pins AXIS_LCD_IMG_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins M_AXIS_OSD] [get_bd_intf_pins AXIS_OSD_FIFO/M_AXIS]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXIS_MM2S [get_bd_intf_pins axi_datamover_0/M_AXIS_MM2S] [get_bd_intf_pins vdma_ctrl_0/S_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXIS_MM2S_STS [get_bd_intf_pins axi_datamover_0/M_AXIS_MM2S_STS] [get_bd_intf_pins vdma_ctrl_0/S_AXIS_MM2S_STS]
  connect_bd_intf_net -intf_net vdma_ctrl_0_M_AXIS_CH0 [get_bd_intf_pins AXIS_LCD_IMG_FIFO/S_AXIS] [get_bd_intf_pins vdma_ctrl_0/M_AXIS_CH0]
  connect_bd_intf_net -intf_net vdma_ctrl_0_M_AXIS_CH1 [get_bd_intf_pins AXIS_OSD_FIFO/S_AXIS] [get_bd_intf_pins vdma_ctrl_0/M_AXIS_CH1]
  connect_bd_intf_net -intf_net vdma_ctrl_0_M_AXIS_CH2 [get_bd_intf_pins s_axis_stub_0/S_AXIS_STUB] [get_bd_intf_pins vdma_ctrl_0/M_AXIS_CH2]
  connect_bd_intf_net -intf_net vdma_ctrl_0_M_AXIS_CH3 [get_bd_intf_pins s_axis_stub_1/S_AXIS_STUB] [get_bd_intf_pins vdma_ctrl_0/M_AXIS_CH3]
  connect_bd_intf_net -intf_net vdma_ctrl_0_M_AXIS_CH4 [get_bd_intf_pins s_axis_stub_2/S_AXIS_STUB] [get_bd_intf_pins vdma_ctrl_0/M_AXIS_CH4]
  connect_bd_intf_net -intf_net vdma_ctrl_0_M_AXIS_CH5 [get_bd_intf_pins s_axis_stub_3/S_AXIS_STUB] [get_bd_intf_pins vdma_ctrl_0/M_AXIS_CH5]
  connect_bd_intf_net -intf_net vdma_ctrl_0_M_AXIS_MM2S_CMD [get_bd_intf_pins axi_datamover_0/S_AXIS_MM2S_CMD] [get_bd_intf_pins vdma_ctrl_0/M_AXIS_MM2S_CMD]

  # Create port connections
  connect_bd_net -net AXIS_LCD_IMG_FIFO_prog_full [get_bd_pins AXIS_LCD_IMG_FIFO/prog_full] [get_bd_pins vdma_ctrl_0/fifo_ch0_prog_full]
  connect_bd_net -net AXIS_OSD_FIFO_prog_full [get_bd_pins AXIS_OSD_FIFO/prog_full] [get_bd_pins vdma_ctrl_0/fifo_ch1_prog_full]
  connect_bd_net -net m_axi_mm2s_aclk_0_1 [get_bd_pins s_axis_aclk] [get_bd_pins AXIS_LCD_IMG_FIFO/s_axis_aclk] [get_bd_pins AXIS_OSD_FIFO/s_axis_aclk] [get_bd_pins axi_datamover_0/m_axi_mm2s_aclk] [get_bd_pins axi_datamover_0/m_axis_mm2s_cmdsts_aclk] [get_bd_pins s_axis_stub_0/s_axis_aclk] [get_bd_pins s_axis_stub_1/s_axis_aclk] [get_bd_pins s_axis_stub_2/s_axis_aclk] [get_bd_pins s_axis_stub_3/s_axis_aclk] [get_bd_pins vdma_ctrl_0/axi_aclk]
  connect_bd_net -net m_axi_mm2s_aresetn_0_1 [get_bd_pins s_axis_aresetn] [get_bd_pins AXIS_LCD_IMG_FIFO/s_axis_aresetn] [get_bd_pins AXIS_OSD_FIFO/s_axis_aresetn] [get_bd_pins axi_datamover_0/m_axi_mm2s_aresetn] [get_bd_pins axi_datamover_0/m_axis_mm2s_cmdsts_aresetn] [get_bd_pins s_axis_stub_0/s_axis_aresetn] [get_bd_pins s_axis_stub_1/s_axis_aresetn] [get_bd_pins s_axis_stub_2/s_axis_aresetn] [get_bd_pins s_axis_stub_3/s_axis_aresetn] [get_bd_pins vdma_ctrl_0/axi_aresetn]
  connect_bd_net -net m_axis_aclk_0_1 [get_bd_pins clk_lcd] [get_bd_pins AXIS_LCD_IMG_FIFO/m_axis_aclk] [get_bd_pins AXIS_OSD_FIFO/m_axis_aclk]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins vdma_ctrl_0/fifo_ch2_prog_full] [get_bd_pins vdma_ctrl_0/fifo_ch3_prog_full] [get_bd_pins vdma_ctrl_0/fifo_ch4_prog_full] [get_bd_pins vdma_ctrl_0/fifo_ch5_prog_full] [get_bd_pins xlconstant_1/dout]

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
  
  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_RSTB_Pin {true} \
 ] $blk_mem_gen_0

  # Create instance: lcd_ctrl_0, and set properties
  set block_name lcd_ctrl
  set block_cell_name lcd_ctrl_0
  if { [catch {set lcd_ctrl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $lcd_ctrl_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.LCD_CLK_HZ {54000000} \
 ] $lcd_ctrl_0

  # Create instance: xpm_cdc_gen_0, and set properties
  set xpm_cdc_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xpm_cdc_gen:1.0 xpm_cdc_gen_0 ]
  set_property -dict [ list \
   CONFIG.CDC_TYPE {xpm_cdc_sync_rst} \
   CONFIG.DEST_SYNC_FF {3} \
 ] $xpm_cdc_gen_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS_OSD] [get_bd_intf_pins axis_osd_dwidth_converter/S_AXIS]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXIS_IMG] [get_bd_intf_pins axis_img_dwidth_converter/S_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins LUT_RAM] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axis_dwidth_converter_0_M_AXIS [get_bd_intf_pins axis_osd_dwidth_converter/M_AXIS] [get_bd_intf_pins lcd_ctrl_0/S_AXIS_OSD]
  connect_bd_intf_net -intf_net axis_img_dwidth_converter_M_AXIS [get_bd_intf_pins axis_img_dwidth_converter/M_AXIS] [get_bd_intf_pins axis_palette_lut/S_AXIS]
  connect_bd_intf_net -intf_net axis_palette_lut_LUT_RAM [get_bd_intf_pins axis_palette_lut/LUT_RAM] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTB]
  connect_bd_intf_net -intf_net axis_palette_lut_M_AXIS [get_bd_intf_pins axis_palette_lut/M_AXIS] [get_bd_intf_pins lcd_ctrl_0/S_AXIS_IMG]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins axis_img_dwidth_converter/aresetn] [get_bd_pins axis_osd_dwidth_converter/aresetn] [get_bd_pins axis_palette_lut/axis_aresetn] [get_bd_pins lcd_ctrl_0/s_axis_aresetn] [get_bd_pins xpm_cdc_gen_0/dest_rst_out]
  connect_bd_net -net lcd_ctrl_0_lcd_resetn [get_bd_pins lcd_resetn] [get_bd_pins lcd_ctrl_0/lcd_resetn]
  connect_bd_net -net lcd_ctrl_0_lcd_spi_scl [get_bd_pins lcd_spi_scl] [get_bd_pins lcd_ctrl_0/lcd_spi_scl]
  connect_bd_net -net lcd_ctrl_0_lcd_spi_sda [get_bd_pins lcd_spi_sda] [get_bd_pins lcd_ctrl_0/lcd_spi_sda]
  connect_bd_net -net s_axis_aclk_0_1 [get_bd_pins clk_lcd] [get_bd_pins axis_img_dwidth_converter/aclk] [get_bd_pins axis_osd_dwidth_converter/aclk] [get_bd_pins axis_palette_lut/axis_aclk] [get_bd_pins lcd_ctrl_0/s_axis_aclk] [get_bd_pins xpm_cdc_gen_0/dest_clk]
  connect_bd_net -net src_rst_0_1 [get_bd_pins aresetn] [get_bd_pins xpm_cdc_gen_0/src_rst]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: ClockSystem
proc create_hier_cell_ClockSystem { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_ClockSystem() - Empty argument(s)!"}
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
  create_bd_pin -dir O -type clk clk_sys
  create_bd_pin -dir I -type clk extclk
  create_bd_pin -dir O locked

  # Create instance: clk_wiz, and set properties
  set clk_wiz [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {236.683} \
   CONFIG.CLKOUT1_PHASE_ERROR {227.606} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {81.000} \
   CONFIG.CLKOUT2_JITTER {267.074} \
   CONFIG.CLKOUT2_PHASE_ERROR {227.606} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {54.000} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {220.007} \
   CONFIG.CLKOUT3_PHASE_ERROR {227.606} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {108.000} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLKOUT4_JITTER {220.007} \
   CONFIG.CLKOUT4_PHASE_ERROR {227.606} \
   CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {108.000} \
   CONFIG.CLKOUT4_REQUESTED_PHASE {270.000} \
   CONFIG.CLKOUT4_USED {true} \
   CONFIG.CLKOUT5_JITTER {202.158} \
   CONFIG.CLKOUT5_PHASE_ERROR {227.606} \
   CONFIG.CLKOUT5_REQUESTED_OUT_FREQ {194.400} \
   CONFIG.CLKOUT5_USED {true} \
   CONFIG.CLK_OUT1_PORT {clk_sys} \
   CONFIG.CLK_OUT2_PORT {clk_lcd} \
   CONFIG.CLK_OUT3_PORT {clk_ram_0} \
   CONFIG.CLK_OUT4_PORT {clk_ram_270} \
   CONFIG.CLK_OUT5_PORT {clk_idelay_ref} \
   CONFIG.JITTER_SEL {No_Jitter} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {36.000} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {12.000} \
   CONFIG.MMCM_CLKOUT0_DUTY_CYCLE {0.5} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {18} \
   CONFIG.MMCM_CLKOUT1_DUTY_CYCLE {0.5} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {9} \
   CONFIG.MMCM_CLKOUT2_DUTY_CYCLE {0.5} \
   CONFIG.MMCM_CLKOUT3_DIVIDE {9} \
   CONFIG.MMCM_CLKOUT3_DUTY_CYCLE {0.5} \
   CONFIG.MMCM_CLKOUT3_PHASE {270.000} \
   CONFIG.MMCM_CLKOUT4_DIVIDE {5} \
   CONFIG.MMCM_CLKOUT4_DUTY_CYCLE {0.5} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {5} \
   CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
   CONFIG.USE_MIN_POWER {true} \
   CONFIG.USE_RESET {false} \
 ] $clk_wiz

  # Create port connections
  connect_bd_net -net clk_in1_0_1 [get_bd_pins extclk] [get_bd_pins clk_wiz/clk_in1]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins locked] [get_bd_pins clk_wiz/locked]
  connect_bd_net -net clk_wiz_clk_idelay_ref [get_bd_pins clk_idelay_ref] [get_bd_pins clk_wiz/clk_idelay_ref]
  connect_bd_net -net clk_wiz_clk_lcd [get_bd_pins clk_lcd] [get_bd_pins clk_wiz/clk_lcd]
  connect_bd_net -net clk_wiz_clk_ram_0 [get_bd_pins clk_ram_0] [get_bd_pins clk_wiz/clk_ram_0]
  connect_bd_net -net clk_wiz_clk_ram_270 [get_bd_pins clk_ram_270] [get_bd_pins clk_wiz/clk_ram_270]
  connect_bd_net -net clk_wiz_clk_sys [get_bd_pins clk_sys] [get_bd_pins clk_wiz/clk_sys]

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
  set i2c_exp_irq [ create_bd_port -dir I -from 0 -to 0 i2c_exp_irq ]
  set lcd_led_ctrl [ create_bd_port -dir O lcd_led_ctrl ]
  set lcd_resetn [ create_bd_port -dir O -type rst lcd_resetn ]
  set lcd_spi_scl [ create_bd_port -dir O lcd_spi_scl ]
  set lcd_spi_sda [ create_bd_port -dir O lcd_spi_sda ]
  set shtr_drive_ena [ create_bd_port -dir O shtr_drive_ena ]

  # Create instance: AXI_Full_Interconnect, and set properties
  set AXI_Full_Interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 AXI_Full_Interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
   CONFIG.NUM_SI {2} \
   CONFIG.S00_HAS_DATA_FIFO {2} \
   CONFIG.S01_HAS_DATA_FIFO {2} \
   CONFIG.STRATEGY {2} \
 ] $AXI_Full_Interconnect

  # Create instance: ClockSystem
  create_hier_cell_ClockSystem [current_bd_instance .] ClockSystem

  # Create instance: LCD
  create_hier_cell_LCD [current_bd_instance .] LCD

  # Create instance: OpenHBMC_R0, and set properties
  set OpenHBMC_R0 [ create_bd_cell -type ip -vlnv OVGN:user:OpenHBMC:1.1 OpenHBMC_R0 ]
  set_property -dict [ list \
   CONFIG.C_HBMC_CLOCK_HZ {108000000} \
   CONFIG.C_IDELAYCTRL_INTEGRATED {false} \
 ] $OpenHBMC_R0

  # Create instance: OpenHBMC_R1, and set properties
  set OpenHBMC_R1 [ create_bd_cell -type ip -vlnv OVGN:user:OpenHBMC:1.1 OpenHBMC_R1 ]
  set_property -dict [ list \
   CONFIG.C_HBMC_CLOCK_HZ {108000000} \
   CONFIG.C_IDELAYCTRL_INTEGRATED {false} \
 ] $OpenHBMC_R1

  # Create instance: VDMA
  create_hier_cell_VDMA [current_bd_instance .] VDMA

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.ECC_TYPE {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS_2 {1} \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO2_WIDTH {20} \
   CONFIG.C_GPIO_WIDTH {10} \
   CONFIG.C_INTERRUPT_PRESENT {1} \
   CONFIG.C_IS_DUAL {1} \
 ] $axi_gpio_0

  # Create instance: axi_hwicap_0, and set properties
  set axi_hwicap_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_hwicap:3.0 axi_hwicap_0 ]
  set_property -dict [ list \
   CONFIG.C_BRAM_SRL_FIFO_TYPE {0} \
   CONFIG.C_WRITE_FIFO_DEPTH {128} \
 ] $axi_hwicap_0

  # Create instance: axi_iic_0, and set properties
  set axi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0 ]
  set_property -dict [ list \
   CONFIG.C_SCL_INERTIAL_DELAY {30} \
   CONFIG.C_SDA_INERTIAL_DELAY {30} \
 ] $axi_iic_0

  # Create instance: axi_quad_spi, and set properties
  set axi_quad_spi [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi ]
  set_property -dict [ list \
   CONFIG.C_SCK_RATIO {2} \
   CONFIG.C_SPI_MEMORY {4} \
   CONFIG.C_SPI_MODE {2} \
 ] $axi_quad_spi

  # Create instance: axi_spi, and set properties
  set axi_spi [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_spi ]
  set_property -dict [ list \
   CONFIG.C_SCK_RATIO {4} \
   CONFIG.C_USE_STARTUP {0} \
   CONFIG.C_USE_STARTUP_INT {0} \
 ] $axi_spi

  # Create instance: axi_timer_0, and set properties
  set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0 ]

  # Create instance: buttons
  create_hier_cell_buttons [current_bd_instance .] buttons

  # Create instance: gpio_splitter_0, and set properties
  set block_name gpio_splitter
  set block_cell_name gpio_splitter_0
  if { [catch {set gpio_splitter_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gpio_splitter_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: lcd_backlight_ctrl_0, and set properties
  set block_name lcd_backlight_ctrl
  set block_cell_name lcd_backlight_ctrl_0
  if { [catch {set lcd_backlight_ctrl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $lcd_backlight_ctrl_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {81000000} \
 ] $lcd_backlight_ctrl_0

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]
  set_property -dict [ list \
   CONFIG.C_ADDR_SIZE {32} \
   CONFIG.C_M_AXI_ADDR_WIDTH {32} \
   CONFIG.C_USE_UART {1} \
 ] $mdm_1

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_0 ]
  set_property -dict [ list \
   CONFIG.C_ADDR_TAG_BITS {0} \
   CONFIG.C_DCACHE_ADDR_TAG {0} \
   CONFIG.C_DEBUG_ENABLED {1} \
   CONFIG.C_D_AXI {1} \
   CONFIG.C_D_LMB {1} \
   CONFIG.C_I_LMB {1} \
   CONFIG.C_USE_DCACHE {0} \
   CONFIG.C_USE_ICACHE {0} \
   CONFIG.G_TEMPLATE_LIST {9} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
   CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {11} \
   CONFIG.STRATEGY {1} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {7} \
 ] $microblaze_0_xlconcat

  # Create instance: power_switch_fsm_0, and set properties
  set block_name power_switch_fsm
  set block_cell_name power_switch_fsm_0
  if { [catch {set power_switch_fsm_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $power_switch_fsm_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.CLK_HZ {81000000} \
 ] $power_switch_fsm_0

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]

  # Create interface connections
  connect_bd_intf_net -intf_net AXI_Full_Interconnect_M00_AXI [get_bd_intf_pins AXI_Full_Interconnect/M00_AXI] [get_bd_intf_pins OpenHBMC_R0/S_AXI]
  connect_bd_intf_net -intf_net AXI_Full_Interconnect_M01_AXI [get_bd_intf_pins AXI_Full_Interconnect/M01_AXI] [get_bd_intf_pins OpenHBMC_R1/S_AXI]
  connect_bd_intf_net -intf_net OpenHBMC_R0_HyperBus [get_bd_intf_ports HyperBus_R0] [get_bd_intf_pins OpenHBMC_R0/HyperBus]
  connect_bd_intf_net -intf_net OpenHBMC_R1_HyperBus [get_bd_intf_ports HyperBus_R1] [get_bd_intf_pins OpenHBMC_R1/HyperBus]
  connect_bd_intf_net -intf_net S01_AXI_1 [get_bd_intf_pins AXI_Full_Interconnect/S01_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M10_AXI]
  connect_bd_intf_net -intf_net S_AXI_LITE_1 [get_bd_intf_pins VDMA/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M08_AXI]
  connect_bd_intf_net -intf_net VDMA_M_AXIS_IMG [get_bd_intf_pins LCD/S_AXIS_IMG] [get_bd_intf_pins VDMA/M_AXIS_IMG]
  connect_bd_intf_net -intf_net VDMA_M_AXIS_OSD [get_bd_intf_pins LCD/S_AXIS_OSD] [get_bd_intf_pins VDMA/M_AXIS_OSD]
  connect_bd_intf_net -intf_net VDMA_M_AXI_MM2S [get_bd_intf_pins AXI_Full_Interconnect/S00_AXI] [get_bd_intf_pins VDMA/M_AXI_MM2S]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins LCD/LUT_RAM] [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_ports IIC] [get_bd_intf_pins axi_iic_0/IIC]
  connect_bd_intf_net -intf_net axi_quad_spi_SPI_0 [get_bd_intf_ports QSPI] [get_bd_intf_pins axi_quad_spi/SPI_0]
  connect_bd_intf_net -intf_net axi_spi_SPI_0 [get_bd_intf_ports SPI] [get_bd_intf_pins axi_spi/SPI_0]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins axi_timer_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins axi_iic_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M05_AXI [get_bd_intf_pins axi_quad_spi/AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M06_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M07_AXI [get_bd_intf_pins axi_spi/AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M07_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M09_AXI [get_bd_intf_pins axi_hwicap_0/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M09_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins microblaze_0_axi_intc/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_0_mdm_axi [get_bd_intf_pins mdm_1/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]

  # Create port connections
  connect_bd_net -net ClockSystem_clk_idelay_ref [get_bd_pins ClockSystem/clk_idelay_ref] [get_bd_pins OpenHBMC_R0/clk_idelay_ref] [get_bd_pins OpenHBMC_R1/clk_idelay_ref]
  connect_bd_net -net ClockSystem_clk_lcd [get_bd_pins ClockSystem/clk_lcd] [get_bd_pins LCD/clk_lcd] [get_bd_pins VDMA/clk_lcd]
  connect_bd_net -net ClockSystem_clk_ram_0 [get_bd_pins ClockSystem/clk_ram_0] [get_bd_pins OpenHBMC_R0/clk_hbmc_0] [get_bd_pins OpenHBMC_R1/clk_hbmc_0]
  connect_bd_net -net ClockSystem_clk_ram_270 [get_bd_pins ClockSystem/clk_ram_270] [get_bd_pins OpenHBMC_R0/clk_hbmc_270] [get_bd_pins OpenHBMC_R1/clk_hbmc_270]
  connect_bd_net -net ClockSystem_locked [get_bd_pins ClockSystem/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in]
  connect_bd_net -net In3_0_1 [get_bd_ports i2c_exp_irq] [get_bd_pins microblaze_0_xlconcat/In3]
  connect_bd_net -net LCD_lcd_resetn_0 [get_bd_ports lcd_resetn] [get_bd_pins LCD/lcd_resetn]
  connect_bd_net -net LCD_lcd_spi_scl_0 [get_bd_ports lcd_spi_scl] [get_bd_pins LCD/lcd_spi_scl]
  connect_bd_net -net LCD_lcd_spi_sda_0 [get_bd_ports lcd_spi_sda] [get_bd_pins LCD/lcd_spi_sda]
  connect_bd_net -net axi_gpio_0_gpio_io_o [get_bd_pins axi_gpio_0/gpio_io_o] [get_bd_pins gpio_splitter_0/gpio]
  connect_bd_net -net axi_gpio_0_ip2intc_irpt [get_bd_pins axi_gpio_0/ip2intc_irpt] [get_bd_pins microblaze_0_xlconcat/In0]
  connect_bd_net -net axi_hwicap_0_ip2intc_irpt [get_bd_pins axi_hwicap_0/ip2intc_irpt] [get_bd_pins microblaze_0_xlconcat/In6]
  connect_bd_net -net axi_iic_0_iic2intc_irpt [get_bd_pins axi_iic_0/iic2intc_irpt] [get_bd_pins microblaze_0_xlconcat/In1]
  connect_bd_net -net axi_quad_spi_eos [get_bd_pins axi_hwicap_0/eos_in] [get_bd_pins axi_quad_spi/eos]
  connect_bd_net -net axi_quad_spi_ip2intc_irpt [get_bd_pins axi_quad_spi/ip2intc_irpt] [get_bd_pins microblaze_0_xlconcat/In2]
  connect_bd_net -net axi_spi_ip2intc_irpt [get_bd_pins axi_spi/ip2intc_irpt] [get_bd_pins microblaze_0_xlconcat/In5]
  connect_bd_net -net axi_timer_0_interrupt [get_bd_pins axi_timer_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In4]
  connect_bd_net -net buttons_btn_out_imm [get_bd_pins buttons/btn_3_out_imm] [get_bd_pins power_switch_fsm_0/btn_pressed]
  connect_bd_net -net buttons_gpio [get_bd_pins axi_gpio_0/gpio2_io_i] [get_bd_pins buttons/gpio]
  connect_bd_net -net clk_in1_0_1 [get_bd_ports extclk] [get_bd_pins ClockSystem/extclk]
  connect_bd_net -net gpio_splitter_0_act_led [get_bd_ports act_led] [get_bd_pins gpio_splitter_0/act_led]
  connect_bd_net -net gpio_splitter_0_focus_drive_ena [get_bd_ports focus_drive_ena] [get_bd_pins gpio_splitter_0/focus_drive_ena]
  connect_bd_net -net gpio_splitter_0_lcd_led_level [get_bd_pins gpio_splitter_0/lcd_led_level] [get_bd_pins lcd_backlight_ctrl_0/level]
  connect_bd_net -net gpio_splitter_0_pwr_off_req [get_bd_pins gpio_splitter_0/pwr_off_req] [get_bd_pins lcd_backlight_ctrl_0/srst] [get_bd_pins power_switch_fsm_0/pwr_off_req]
  connect_bd_net -net gpio_splitter_0_shtr_drive_ena [get_bd_ports shtr_drive_ena] [get_bd_pins gpio_splitter_0/shtr_drive_ena]
  connect_bd_net -net lcd_backlight_ctrl_0_pulse_out [get_bd_ports lcd_led_ctrl] [get_bd_pins lcd_backlight_ctrl_0/pulse_out]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins AXI_Full_Interconnect/ACLK] [get_bd_pins AXI_Full_Interconnect/M00_ACLK] [get_bd_pins AXI_Full_Interconnect/M01_ACLK] [get_bd_pins AXI_Full_Interconnect/S00_ACLK] [get_bd_pins AXI_Full_Interconnect/S01_ACLK] [get_bd_pins ClockSystem/clk_sys] [get_bd_pins OpenHBMC_R0/s_axi_aclk] [get_bd_pins OpenHBMC_R1/s_axi_aclk] [get_bd_pins VDMA/s_axis_aclk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_hwicap_0/icap_clk] [get_bd_pins axi_hwicap_0/s_axi_aclk] [get_bd_pins axi_iic_0/s_axi_aclk] [get_bd_pins axi_quad_spi/ext_spi_clk] [get_bd_pins axi_quad_spi/s_axi_aclk] [get_bd_pins axi_spi/ext_spi_clk] [get_bd_pins axi_spi/s_axi_aclk] [get_bd_pins axi_timer_0/s_axi_aclk] [get_bd_pins buttons/clk] [get_bd_pins lcd_backlight_ctrl_0/clk] [get_bd_pins mdm_1/S_AXI_ACLK] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/M05_ACLK] [get_bd_pins microblaze_0_axi_periph/M06_ACLK] [get_bd_pins microblaze_0_axi_periph/M07_ACLK] [get_bd_pins microblaze_0_axi_periph/M08_ACLK] [get_bd_pins microblaze_0_axi_periph/M09_ACLK] [get_bd_pins microblaze_0_axi_periph/M10_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins power_switch_fsm_0/clk] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net noisy_in_0_1 [get_bd_ports btn_0] [get_bd_pins buttons/noisy_in_0]
  connect_bd_net -net noisy_in_1_1 [get_bd_ports btn_1] [get_bd_pins buttons/noisy_in_1]
  connect_bd_net -net noisy_in_2_1 [get_bd_ports btn_2] [get_bd_pins buttons/noisy_in_2]
  connect_bd_net -net noisy_in_3_1 [get_bd_ports btn_3] [get_bd_pins buttons/noisy_in_3]
  connect_bd_net -net power_switch_fsm_0_fd_clk [get_bd_ports fd_clk] [get_bd_pins power_switch_fsm_0/fd_clk]
  connect_bd_net -net power_switch_fsm_0_fd_dat [get_bd_ports fd_dat] [get_bd_pins power_switch_fsm_0/fd_dat]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins AXI_Full_Interconnect/ARESETN] [get_bd_pins AXI_Full_Interconnect/M00_ARESETN] [get_bd_pins AXI_Full_Interconnect/M01_ARESETN] [get_bd_pins AXI_Full_Interconnect/S00_ARESETN] [get_bd_pins AXI_Full_Interconnect/S01_ARESETN] [get_bd_pins LCD/aresetn] [get_bd_pins OpenHBMC_R0/s_axi_aresetn] [get_bd_pins OpenHBMC_R1/s_axi_aresetn] [get_bd_pins VDMA/s_axis_aresetn] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_hwicap_0/s_axi_aresetn] [get_bd_pins axi_iic_0/s_axi_aresetn] [get_bd_pins axi_quad_spi/s_axi_aresetn] [get_bd_pins axi_spi/s_axi_aresetn] [get_bd_pins axi_timer_0/s_axi_aresetn] [get_bd_pins buttons/rstn] [get_bd_pins mdm_1/S_AXI_ARESETN] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/M05_ARESETN] [get_bd_pins microblaze_0_axi_periph/M06_ARESETN] [get_bd_pins microblaze_0_axi_periph/M07_ARESETN] [get_bd_pins microblaze_0_axi_periph/M08_ARESETN] [get_bd_pins microblaze_0_axi_periph/M09_ARESETN] [get_bd_pins microblaze_0_axi_periph/M10_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn]

  # Create address segments
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs OpenHBMC_R1/S_AXI/Mem] -force
  assign_bd_address -offset 0xC0000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x40000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x40200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_hwicap_0/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0x40800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_iic_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x44A10000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_quad_spi/AXI_LITE/Reg] -force
  assign_bd_address -offset 0x44A20000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_spi/AXI_LITE/Reg] -force
  assign_bd_address -offset 0x41C00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x00040000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] -force
  assign_bd_address -offset 0x00000000 -range 0x00040000 -target_address_space [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] -force
  assign_bd_address -offset 0x41400000 -range 0x00001000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mdm_1/S_AXI/Reg] -force
  assign_bd_address -offset 0x41200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_axi_intc/S_AXI/Reg] -force
  assign_bd_address -offset 0x44A00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs VDMA/vdma_ctrl_0/S_AXI_LITE/reg0] -force
  assign_bd_address -offset 0x76000000 -range 0x00800000 -target_address_space [get_bd_addr_spaces VDMA/axi_datamover_0/Data_MM2S] [get_bd_addr_segs OpenHBMC_R0/S_AXI/Mem] -force
  assign_bd_address -offset 0x76800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces VDMA/axi_datamover_0/Data_MM2S] [get_bd_addr_segs OpenHBMC_R1/S_AXI/Mem] -force

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   "ActiveEmotionalView":"Default View",
   "Default View_ScaleFactor":"0.869323",
   "Default View_TopLeft":"2076,266",
   "ExpandedHierarchyInLayout":"",
   "guistr":"# # String gsaved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:10.0 non-TLS
#  -string -flagsOSRD
preplace port HyperBus_R0 -pg 1 -lvl 9 -x 3140 -y 110 -defaultsOSRD
preplace port HyperBus_R1 -pg 1 -lvl 9 -x 3140 -y 310 -defaultsOSRD
preplace port IIC -pg 1 -lvl 9 -x 3140 -y 650 -defaultsOSRD
preplace port QSPI -pg 1 -lvl 9 -x 3140 -y 460 -defaultsOSRD
preplace port SPI -pg 1 -lvl 9 -x 3140 -y 840 -defaultsOSRD
preplace port btn_0 -pg 1 -lvl 0 -x -10 -y 1400 -defaultsOSRD
preplace port btn_1 -pg 1 -lvl 0 -x -10 -y 1420 -defaultsOSRD
preplace port btn_2 -pg 1 -lvl 0 -x -10 -y 1440 -defaultsOSRD
preplace port btn_3 -pg 1 -lvl 0 -x -10 -y 1460 -defaultsOSRD
preplace port extclk -pg 1 -lvl 0 -x -10 -y 920 -defaultsOSRD
preplace port fd_clk -pg 1 -lvl 9 -x 3140 -y 1340 -defaultsOSRD
preplace port fd_dat -pg 1 -lvl 9 -x 3140 -y 1360 -defaultsOSRD
preplace port focus_drive_ena -pg 1 -lvl 9 -x 3140 -y 1260 -defaultsOSRD
preplace port lcd_led_ctrl -pg 1 -lvl 9 -x 3140 -y 1170 -defaultsOSRD
preplace port lcd_resetn -pg 1 -lvl 9 -x 3140 -y 1000 -defaultsOSRD
preplace port lcd_spi_scl -pg 1 -lvl 9 -x 3140 -y 1020 -defaultsOSRD
preplace port lcd_spi_sda -pg 1 -lvl 9 -x 3140 -y 1040 -defaultsOSRD
preplace port shtr_drive_ena -pg 1 -lvl 9 -x 3140 -y 1280 -defaultsOSRD
preplace portBus act_led -pg 1 -lvl 9 -x 3140 -y 1240 -defaultsOSRD
preplace portBus i2c_exp_irq -pg 1 -lvl 0 -x -10 -y 1100 -defaultsOSRD
preplace inst AXI_Full_Interconnect -pg 1 -lvl 7 -x 2580 -y 290 -defaultsOSRD
preplace inst ClockSystem -pg 1 -lvl 1 -x 120 -y 920 -defaultsOSRD
preplace inst LCD -pg 1 -lvl 8 -x 2970 -y 1020 -defaultsOSRD
preplace inst OpenHBMC_R0 -pg 1 -lvl 8 -x 2970 -y 110 -defaultsOSRD
preplace inst OpenHBMC_R1 -pg 1 -lvl 8 -x 2970 -y 310 -defaultsOSRD
preplace inst VDMA -pg 1 -lvl 6 -x 2210 -y 1010 -defaultsOSRD
preplace inst axi_bram_ctrl_0 -pg 1 -lvl 7 -x 2580 -y 940 -defaultsOSRD
preplace inst axi_gpio_0 -pg 1 -lvl 6 -x 2210 -y 1190 -defaultsOSRD
preplace inst axi_hwicap_0 -pg 1 -lvl 6 -x 2210 -y 520 -defaultsOSRD
preplace inst axi_iic_0 -pg 1 -lvl 8 -x 2970 -y 670 -defaultsOSRD
preplace inst axi_quad_spi -pg 1 -lvl 8 -x 2970 -y 490 -defaultsOSRD
preplace inst axi_spi -pg 1 -lvl 8 -x 2970 -y 850 -defaultsOSRD
preplace inst axi_timer_0 -pg 1 -lvl 6 -x 2210 -y 770 -defaultsOSRD
preplace inst buttons -pg 1 -lvl 7 -x 2580 -y 1430 -defaultsOSRD
preplace inst gpio_splitter_0 -pg 1 -lvl 7 -x 2580 -y 1220 -defaultsOSRD
preplace inst mdm_1 -pg 1 -lvl 3 -x 890 -y 810 -defaultsOSRD
preplace inst microblaze_0 -pg 1 -lvl 4 -x 1310 -y 820 -defaultsOSRD
preplace inst microblaze_0_axi_intc -pg 1 -lvl 3 -x 890 -y 1100 -defaultsOSRD
preplace inst microblaze_0_axi_periph -pg 1 -lvl 5 -x 1730 -y 410 -defaultsOSRD
preplace inst microblaze_0_local_memory -pg 1 -lvl 5 -x 1730 -y 830 -defaultsOSRD
preplace inst microblaze_0_xlconcat -pg 1 -lvl 2 -x 510 -y 1100 -defaultsOSRD
preplace inst power_switch_fsm_0 -pg 1 -lvl 8 -x 2970 -y 1350 -defaultsOSRD
preplace inst rst_clk_wiz_1_100M -pg 1 -lvl 2 -x 510 -y 810 -defaultsOSRD
preplace inst lcd_backlight_ctrl_0 -pg 1 -lvl 8 -x 2970 -y 1170 -defaultsOSRD
preplace netloc ClockSystem_clk_idelay_ref 1 1 7 220 20 NJ 20 NJ 20 NJ 20 1960J 70 NJ 70 2810
preplace netloc ClockSystem_clk_lcd 1 1 7 250 920 NJ 920 NJ 920 NJ 920 1970 920 2370J 1060 NJ
preplace netloc ClockSystem_clk_ram_0 1 1 7 240 50 NJ 50 NJ 50 NJ 50 NJ 50 NJ 50 2830
preplace netloc ClockSystem_clk_ram_270 1 1 7 230 30 NJ 30 NJ 30 NJ 30 NJ 30 NJ 30 2840
preplace netloc ClockSystem_locked 1 1 1 270 790n
preplace netloc In3_0_1 1 0 2 NJ 1100 NJ
preplace netloc LCD_lcd_resetn_0 1 8 1 NJ 1000
preplace netloc LCD_lcd_spi_scl_0 1 8 1 NJ 1020
preplace netloc LCD_lcd_spi_sda_0 1 8 1 NJ 1040
preplace netloc axi_gpio_0_gpio_io_o 1 6 1 2370 1170n
preplace netloc axi_gpio_0_ip2intc_irpt 1 1 6 330 980 NJ 980 NJ 980 NJ 980 1880J 1090 2350
preplace netloc axi_hwicap_0_ip2intc_irpt 1 1 6 280 60 NJ 60 NJ 60 NJ 60 NJ 60 2360
preplace netloc axi_iic_0_iic2intc_irpt 1 1 8 290 40 NJ 40 NJ 40 NJ 40 NJ 40 NJ 40 2820J 750 3100
preplace netloc axi_quad_spi_eos 1 5 4 2000 620 2360J 580 NJ 580 3110
preplace netloc axi_quad_spi_ip2intc_irpt 1 1 8 300 710 NJ 710 NJ 710 1580J 730 1970J 630 2410J 590 NJ 590 3100
preplace netloc axi_spi_ip2intc_irpt 1 1 8 310 930 NJ 930 NJ 930 NJ 930 1990J 880 2410J 860 2770J 1250 3100
preplace netloc axi_timer_0_interrupt 1 1 6 320 940 NJ 940 NJ 940 NJ 940 2000J 910 2360
preplace netloc buttons_btn_out_imm 1 7 1 2840 1350n
preplace netloc buttons_gpio 1 6 2 2360 1320 2730
preplace netloc clk_in1_0_1 1 0 1 NJ 920
preplace netloc gpio_splitter_0_act_led 1 7 2 2760J 1260 3110J
preplace netloc gpio_splitter_0_focus_drive_ena 1 7 2 2750J 1270 3120J
preplace netloc gpio_splitter_0_lcd_led_level 1 7 1 2800 1190n
preplace netloc gpio_splitter_0_pwr_off_req 1 7 1 2820 1170n
preplace netloc gpio_splitter_0_shtr_drive_ena 1 7 2 2740J 1430 3110J
preplace netloc lcd_backlight_ctrl_0_pulse_out 1 8 1 NJ 1170
preplace netloc mdm_1_debug_sys_rst 1 1 3 330 950 NJ 950 1040
preplace netloc microblaze_0_Clk 1 1 7 260 960 700 900 1070 910 1560 70 1930 110 2390 110 2780
preplace netloc microblaze_0_intr 1 2 1 680 1100n
preplace netloc noisy_in_0_1 1 0 7 NJ 1400 NJ 1400 NJ 1400 NJ 1400 NJ 1400 NJ 1400 NJ
preplace netloc noisy_in_1_1 1 0 7 NJ 1420 NJ 1420 NJ 1420 NJ 1420 NJ 1420 NJ 1420 NJ
preplace netloc noisy_in_2_1 1 0 7 NJ 1440 NJ 1440 NJ 1440 NJ 1440 NJ 1440 NJ 1440 NJ
preplace netloc noisy_in_3_1 1 0 7 NJ 1460 NJ 1460 NJ 1460 NJ 1460 NJ 1460 NJ 1460 NJ
preplace netloc power_switch_fsm_0_fd_clk 1 8 1 NJ 1340
preplace netloc power_switch_fsm_0_fd_dat 1 8 1 NJ 1360
preplace netloc rst_clk_wiz_1_100M_bus_struct_reset 1 2 3 710 960 NJ 960 1580J
preplace netloc rst_clk_wiz_1_100M_mb_reset 1 2 2 690 890 1060
preplace netloc rst_clk_wiz_1_100M_peripheral_aresetn 1 2 6 720 730 NJ 730 1570 740 1980 640 2400 120 2800
preplace netloc axi_spi_SPI_0 1 8 1 NJ 840
preplace netloc axi_bram_ctrl_0_BRAM_PORTA 1 7 1 2790 940n
preplace netloc microblaze_0_axi_periph_M09_AXI 1 5 1 1940 480n
preplace netloc microblaze_0_axi_periph_M02_AXI 1 5 1 1960 350n
preplace netloc microblaze_0_axi_periph_M07_AXI 1 5 3 1920 420 2410J 470 2810J
preplace netloc microblaze_0_axi_periph_M03_AXI 1 5 1 1910 370n
preplace netloc microblaze_0_ilmb_1 1 4 1 N 820
preplace netloc S_AXI_LITE_1 1 5 1 1920 470n
preplace netloc AXI_Full_Interconnect_M01_AXI 1 7 1 2770 260n
preplace netloc axi_iic_0_IIC 1 8 1 NJ 650
preplace netloc microblaze_0_dlmb_1 1 4 1 N 800
preplace netloc microblaze_0_axi_periph_M05_AXI 1 5 3 1880 400 2370J 460 NJ
preplace netloc AXI_Full_Interconnect_M00_AXI 1 7 1 2740 60n
preplace netloc microblaze_0_axi_dp 1 4 1 1550 150n
preplace netloc microblaze_0_mdm_axi 1 2 4 740 90 NJ 90 NJ 90 1880
preplace netloc microblaze_0_axi_periph_M04_AXI 1 5 3 1950 650 NJ 650 NJ
preplace netloc microblaze_0_interrupt 1 3 1 1050 790n
preplace netloc microblaze_0_debug 1 3 1 1040 790n
preplace netloc axi_quad_spi_SPI_0 1 8 1 NJ 460
preplace netloc VDMA_M_AXI_MM2S 1 6 1 2350 180n
preplace netloc microblaze_0_intc_axi 1 2 4 730 80 NJ 80 NJ 80 1890
preplace netloc VDMA_M_AXIS_OSD 1 6 2 2360J 1030 2840
preplace netloc microblaze_0_axi_periph_M06_AXI 1 5 2 1890 410 2420J
preplace netloc VDMA_M_AXIS_IMG 1 6 2 2380J 1020 2790
preplace netloc S01_AXI_1 1 5 2 1900 200 NJ
preplace netloc OpenHBMC_R0_HyperBus 1 8 1 NJ 110
preplace netloc OpenHBMC_R1_HyperBus 1 8 1 NJ 310
levelinfo -pg 1 -10 120 510 890 1310 1730 2210 2580 2970 3140
pagesize -pg 1 -db -bbox -sgen -160 0 3300 1530
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
