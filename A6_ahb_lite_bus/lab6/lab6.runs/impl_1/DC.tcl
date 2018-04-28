proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /home/prabhat/COL216/Col216_assignments/A6_ahb_lite_bus/lab6/lab6.cache/wt [current_project]
  set_property parent.project_path /home/prabhat/COL216/Col216_assignments/A6_ahb_lite_bus/lab6/lab6.xpr [current_project]
  set_property ip_output_repo /home/prabhat/COL216/Col216_assignments/A6_ahb_lite_bus/lab6/lab6.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet /home/prabhat/COL216/Col216_assignments/A6_ahb_lite_bus/lab6/lab6.runs/synth_1/DC.dcp
  link_design -top DC -part xc7a35tcpg236-1
  write_hwdef -file DC.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force DC_opt.dcp
  catch { report_drc -file DC_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force DC_placed.dcp
  catch { report_io -file DC_io_placed.rpt }
  catch { report_utilization -file DC_utilization_placed.rpt -pb DC_utilization_placed.pb }
  catch { report_control_sets -verbose -file DC_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force DC_routed.dcp
  catch { report_drc -file DC_drc_routed.rpt -pb DC_drc_routed.pb -rpx DC_drc_routed.rpx }
  catch { report_methodology -file DC_methodology_drc_routed.rpt -rpx DC_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file DC_timing_summary_routed.rpt -rpx DC_timing_summary_routed.rpx }
  catch { report_power -file DC_power_routed.rpt -pb DC_power_summary_routed.pb -rpx DC_power_routed.rpx }
  catch { report_route_status -file DC_route_status.rpt -pb DC_route_status.pb }
  catch { report_clock_utilization -file DC_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force DC_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

