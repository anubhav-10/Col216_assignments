
v
Command: %s
53*	vivadotcl2E
1write_bitstream -force -no_partial_bitfile DC.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
�
Rule violation (%s) %s - %s
20*drc2
CFGBVS-12default:default2G
3Missing CFGBVS and CONFIG_VOLTAGE Design Properties2default:default2�
�Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPIP-12default:default2$
Input pipelining2default:default2|
hDSP DP/Mult/t input DP/Mult/t/A[29:0] is not pipelined. Pipelining DSP48 input will improve performance.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPIP-12default:default2$
Input pipelining2default:default2|
hDSP DP/Mult/t input DP/Mult/t/B[17:0] is not pipelined. Pipelining DSP48 input will improve performance.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPIP-12default:default2$
Input pipelining2default:default2�
nDSP DP/Mult/t__0 input DP/Mult/t__0/A[29:0] is not pipelined. Pipelining DSP48 input will improve performance.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPIP-12default:default2$
Input pipelining2default:default2�
nDSP DP/Mult/t__0 input DP/Mult/t__0/B[17:0] is not pipelined. Pipelining DSP48 input will improve performance.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPIP-12default:default2$
Input pipelining2default:default2�
nDSP DP/Mult/t__1 input DP/Mult/t__1/A[29:0] is not pipelined. Pipelining DSP48 input will improve performance.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPIP-12default:default2$
Input pipelining2default:default2�
nDSP DP/Mult/t__1 input DP/Mult/t__1/B[17:0] is not pipelined. Pipelining DSP48 input will improve performance.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2*
PREG Output pipelining2default:default2�
�DSP DP/Mult/t output DP/Mult/t/P[47:0] is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2*
PREG Output pipelining2default:default2�
�DSP DP/Mult/t__0 output DP/Mult/t__0/P[47:0] is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2*
PREG Output pipelining2default:default2�
�DSP DP/Mult/t__1 output DP/Mult/t__1/P[47:0] is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPOP-22default:default2*
MREG Output pipelining2default:default2�
�DSP DP/Mult/t multiplier stage DP/Mult/t/P[47:0] is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPOP-22default:default2*
MREG Output pipelining2default:default2�
�DSP DP/Mult/t__0 multiplier stage DP/Mult/t__0/P[47:0] is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
DPOP-22default:default2*
MREG Output pipelining2default:default2�
�DSP DP/Mult/t__1 multiplier stage DP/Mult/t__1/P[47:0] is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/inscd_reg[2]_i_5.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/inscd_reg[2]_i_6.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/op_reg[0]_i_2.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/op_reg[2]_i_2.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/op_reg[3]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/p_reg_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/p_reg_i_6.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/p_reg_i_8.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][0]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][0]_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][10]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][11]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][12]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][13]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][14]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][15]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][16]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][17]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][18]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][19]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][1]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][1]_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][20]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][21]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][21]_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][22]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][23]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][23]_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][24]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][24]_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][25]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][25]_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][26]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][27]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][28]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][29]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][29]_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][2]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][30]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][30]_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][31]_i_17.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][31]_i_19.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][3]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][3]_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][4]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][4]_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][5]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][6]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][7]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][8]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/registers[0][9]_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_1.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_10.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_11.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_12.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_13.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_14.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_15.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_16.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_17.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_2.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_5.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_6.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_7.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_8.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__0_i_9.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_1.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_10.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_11.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_12.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_13.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_14.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_15.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_2.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_3.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_4.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_5.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_6.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_7.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_8.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t__1_i_9.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t_i_1.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t_i_10.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t_i_11.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
LUTLP-12default:default2,
Combinatorial Loop Alert2default:default2�
�1 LUT cells form a combinatorial loop. This can create a race condition. Timing analysis may not be accurate. The preferred resolution is to modify the design to remove combinatorial logic loops. If the loop is known and understood, this DRC can be bypassed by acknowledging the condition and setting the following XDC constraint on any net in the loop: 'set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>'. The cells in the loop are: Ctrl/States/t_i_12.2default:defaultZ23-20h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
	DRC 23-202default:default2
1002default:defaultZ17-14h px� 
h
DRC finished with %s
1905*	planAhead2*
0 Errors, 247 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
Y
Writing bitstream %s...
11*	bitstream2
./DC.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
732default:default2
1032default:default2
22default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
write_bitstream: 2default:default2
00:00:102default:default2
00:00:152default:default2
2230.9062default:default2
290.6332default:default2
3482default:default2
106632default:defaultZ17-722h px� 
_
Unable to parse hwdef file %s162*	vivadotcl2
DC.hwdef2default:defaultZ4-395h px� 


End Record