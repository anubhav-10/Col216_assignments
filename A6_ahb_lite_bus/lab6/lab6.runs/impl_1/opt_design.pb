
O
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px� 
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
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px� 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.35 . Memory (MB): peak = 1282.664 ; gain = 58.016 ; free physical = 1702 ; free virtual = 129142default:defaulth px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px� 
A
,Implement Debug Cores | Checksum: 158829ac9
*commonh px� 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px� 
;
&Phase 1 Retarget | Checksum: e6645907
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.10 ; elapsed = 00:00:00.10 . Memory (MB): peak = 1645.094 ; gain = 0.000 ; free physical = 1360 ; free virtual = 125722default:defaulth px� 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant propagation2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
I
Eliminated %s cells.
10*opt2
12default:defaultZ31-10h px� 
H
3Phase 2 Constant propagation | Checksum: 1d6b6673c
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.25 ; elapsed = 00:00:00.20 . Memory (MB): peak = 1645.094 ; gain = 0.000 ; free physical = 1359 ; free virtual = 125712default:defaulth px� 
f

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px� 
_
 Eliminated %s unconnected nets.
12*opt2
3203202default:default8Z31-12h px� 
\
!Eliminated %s unconnected cells.
11*opt2
1	12default:default8Z31-11h px� 
9
$Phase 3 Sweep | Checksum: 105a75f5e
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.35 ; elapsed = 00:00:00.29 . Memory (MB): peak = 1645.094 ; gain = 0.000 ; free physical = 1359 ; free virtual = 125712default:defaulth px� 
r

Phase %s%s
101*constraints2
4 2default:default2%
BUFG optimization2default:defaultZ18-101h px� 
[
 Eliminated %s unconnected nets.
12*opt2
002default:default8Z31-12h px� 
\
!Eliminated %s unconnected cells.
11*opt2
0	02default:default8Z31-11h px� 
E
0Phase 4 BUFG optimization | Checksum: 108859e89
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.52 ; elapsed = 00:00:00.43 . Memory (MB): peak = 1645.094 ; gain = 0.000 ; free physical = 1359 ; free virtual = 125712default:defaulth px� 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 1645.094 ; gain = 0.000 ; free physical = 1359 ; free virtual = 125712default:defaulth px� 
J
5Ending Logic Optimization Task | Checksum: 108859e89
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.54 ; elapsed = 00:00:00.45 . Memory (MB): peak = 1645.094 ; gain = 0.000 ; free physical = 1359 ; free virtual = 125712default:defaulth px� 
a

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px� 
s
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.002default:defaultZ34-132h px� 
J
5Ending Power Optimization Task | Checksum: 108859e89
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 1645.094 ; gain = 0.000 ; free physical = 1359 ; free virtual = 125712default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
232default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px� 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
opt_design: 2default:default2
00:00:092default:default2
00:00:082default:default2
1645.0942default:default2
420.4452default:default2
13592default:default2
125712default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2l
X/home/prabhat/COL216/Col216_assignments/A6_ahb_lite_bus/lab6/lab6.runs/impl_1/DC_opt.dcp2default:defaultZ17-1381h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
^/home/prabhat/COL216/Col216_assignments/A6_ahb_lite_bus/lab6/lab6.runs/impl_1/DC_drc_opted.rpt^/home/prabhat/COL216/Col216_assignments/A6_ahb_lite_bus/lab6/lab6.runs/impl_1/DC_drc_opted.rpt2default:default8Z2-168h px� 


End Record