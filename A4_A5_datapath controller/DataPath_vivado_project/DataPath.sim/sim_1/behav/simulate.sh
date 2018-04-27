#!/bin/bash -f
xv_path="/home/prabhat/Xilinx/Vivado/2016.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim DC_behav -key {Behavioral:sim_1:Functional:DC} -tclbatch DC.tcl -log simulate.log
