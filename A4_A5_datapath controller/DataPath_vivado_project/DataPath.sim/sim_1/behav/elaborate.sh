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
ExecStep $xv_path/bin/xelab -wto e511bf369e25450ab78ca9f7c5b280e8 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip -L xpm --snapshot DC_behav xil_defaultlib.DC -log elaborate.log
