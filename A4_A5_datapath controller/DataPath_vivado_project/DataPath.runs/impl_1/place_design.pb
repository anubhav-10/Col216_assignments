
�
�No debug cores found in the current design.
Before running the implement_debug_core command, either use the Set Up Debug wizard (GUI mode)
or use the create_debug_core and connect_debug_core Tcl commands to insert debug cores into the design.
154*	chipscopeZ16-241h px� 
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px� 
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
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
42default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1693.1092default:default2
0.0002default:default2
8532default:default2
111602default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:00.012default:default2
1693.1092default:default2
0.0002default:default2
8532default:default2
111602default:defaultZ17-722h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
h
SPhase 1.1 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 1ccaca610
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.58 . Memory (MB): peak = 1719.109 ; gain = 26.000 ; free physical = 852 ; free virtual = 111592default:defaulth px� 
}

Phase %s%s
101*constraints2
1.2 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px� 
P
;Phase 1.2 Build Placer Netlist Model | Checksum: 20da85e70
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 1729.754 ; gain = 36.645 ; free physical = 845 ; free virtual = 111522default:defaulth px� 
z

Phase %s%s
101*constraints2
1.3 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px� 
M
8Phase 1.3 Constrain Clocks/Macros | Checksum: 20da85e70
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 1729.754 ; gain = 36.645 ; free physical = 845 ; free virtual = 111522default:defaulth px� 
I
4Phase 1 Placer Initialization | Checksum: 20da85e70
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 1729.754 ; gain = 36.645 ; free physical = 845 ; free virtual = 111522default:defaulth px� 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px� 
D
/Phase 2 Global Placement | Checksum: 213685ca8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:11 ; elapsed = 00:00:05 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 842 ; free virtual = 111492default:defaulth px� 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px� 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px� 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 213685ca8
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:11 ; elapsed = 00:00:05 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 842 ; free virtual = 111492default:defaulth px� 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px� 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 2a33e993b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:12 ; elapsed = 00:00:05 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 842 ; free virtual = 111492default:defaulth px� 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px� 
L
7Phase 3.3 Area Swap Optimization | Checksum: 2805e4a8a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:12 ; elapsed = 00:00:05 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 842 ; free virtual = 111492default:defaulth px� 
�

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 2805e4a8a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:12 ; elapsed = 00:00:05 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 842 ; free virtual = 111492default:defaulth px� 
x

Phase %s%s
101*constraints2
3.5 2default:default2)
Timing Path Optimizer2default:defaultZ18-101h px� 
K
6Phase 3.5 Timing Path Optimizer | Checksum: 22bf855bc
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:12 ; elapsed = 00:00:05 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 842 ; free virtual = 111492default:defaulth px� 
t

Phase %s%s
101*constraints2
3.6 2default:default2%
Fast Optimization2default:defaultZ18-101h px� 
G
2Phase 3.6 Fast Optimization | Checksum: 2729d623f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:13 ; elapsed = 00:00:06 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 841 ; free virtual = 111492default:defaulth px� 


Phase %s%s
101*constraints2
3.7 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px� 
R
=Phase 3.7 Small Shape Detail Placement | Checksum: 16786826d
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:14 ; elapsed = 00:00:07 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 840 ; free virtual = 111472default:defaulth px� 
u

Phase %s%s
101*constraints2
3.8 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px� 
H
3Phase 3.8 Re-assign LUT pins | Checksum: 14978097a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:14 ; elapsed = 00:00:07 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 840 ; free virtual = 111472default:defaulth px� 
�

Phase %s%s
101*constraints2
3.9 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
T
?Phase 3.9 Pipeline Register Optimization | Checksum: 14978097a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:15 ; elapsed = 00:00:07 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 840 ; free virtual = 111472default:defaulth px� 
u

Phase %s%s
101*constraints2
3.10 2default:default2%
Fast Optimization2default:defaultZ18-101h px� 
H
3Phase 3.10 Fast Optimization | Checksum: 19ab582e1
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:18 ; elapsed = 00:00:11 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 839 ; free virtual = 111462default:defaulth px� 
D
/Phase 3 Detail Placement | Checksum: 19ab582e1
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:18 ; elapsed = 00:00:11 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 839 ; free virtual = 111462default:defaulth px� 
�

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px� 
�
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
-40.3932default:defaultZ30-746h px� 
R
=Phase 4.1.1 Post Placement Optimization | Checksum: cc906e6b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:36 ; elapsed = 00:00:27 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 835 ; free virtual = 111422default:defaulth px� 
M
8Phase 4.1 Post Commit Optimization | Checksum: cc906e6b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:36 ; elapsed = 00:00:27 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 835 ; free virtual = 111422default:defaulth px� 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px� 
K
6Phase 4.2 Post Placement Cleanup | Checksum: cc906e6b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:37 ; elapsed = 00:00:27 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 835 ; free virtual = 111422default:defaulth px� 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px� 
E
0Phase 4.3 Placer Reporting | Checksum: cc906e6b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:37 ; elapsed = 00:00:27 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 835 ; free virtual = 111422default:defaulth px� 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px� 
M
8Phase 4.4 Final Placement Cleanup | Checksum: 159f38d6a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:37 ; elapsed = 00:00:27 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 835 ; free virtual = 111422default:defaulth px� 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 159f38d6a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:37 ; elapsed = 00:00:27 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 835 ; free virtual = 111422default:defaulth px� 
=
(Ending Placer Task | Checksum: fe0ffa12
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:37 ; elapsed = 00:00:27 . Memory (MB): peak = 1753.766 ; gain = 60.656 ; free physical = 835 ; free virtual = 111422default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
392default:default2
22default:default2
12default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
place_design: 2default:default2
00:00:382default:default2
00:00:282default:default2
1753.7662default:default2
60.6562default:default2
8352default:default2
111422default:defaultZ17-722h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.302default:default2
00:00:00.102default:default2
1753.7662default:default2
0.0002default:default2
8322default:default2
111422default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
|/home/prabhat/COL216/Col216_assignments/A4_A5_datapath controller/DataPath_vivado_project/DataPath.runs/impl_1/DC_placed.dcp2default:defaultZ17-1381h px� 
�
�report_io: Time (s): cpu = 00:00:00.10 ; elapsed = 00:00:00.14 . Memory (MB): peak = 1753.766 ; gain = 0.000 ; free physical = 834 ; free virtual = 11142
*commonh px� 
�
�report_utilization: Time (s): cpu = 00:00:00.08 ; elapsed = 00:00:00.11 . Memory (MB): peak = 1753.766 ; gain = 0.000 ; free physical = 834 ; free virtual = 11142
*commonh px� 
�
�report_control_sets: Time (s): cpu = 00:00:00.06 ; elapsed = 00:00:00.09 . Memory (MB): peak = 1753.766 ; gain = 0.000 ; free physical = 834 ; free virtual = 11142
*commonh px� 


End Record