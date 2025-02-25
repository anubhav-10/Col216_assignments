#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/prabhat/Xilinx/Vivado/2016.4/ids_lite/ISE/bin/lin64:/home/prabhat/Xilinx/Vivado/2016.4/bin
else
  PATH=/home/prabhat/Xilinx/Vivado/2016.4/ids_lite/ISE/bin/lin64:/home/prabhat/Xilinx/Vivado/2016.4/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/prabhat/Xilinx/Vivado/2016.4/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/prabhat/Xilinx/Vivado/2016.4/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/prabhat/COL216/Col216_assignments/A6_ahb_lite_bus/lab6_new/lab6_new.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log buss.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source buss.tcl
