#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 5e8b99c10962400daaf85482615d501e -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot buss_behav xil_defaultlib.buss -log elaborate.log
