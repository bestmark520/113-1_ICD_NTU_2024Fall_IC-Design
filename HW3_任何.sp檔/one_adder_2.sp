*
.PARAM

* Full Adder Subcircuit
.SUBCKT adder A B Cin S Cout VDD GND
* PMOS transistors
MP1 n1 A VDD VDD P_18 l=0.18u w=2.50u m=1
MP2 n1 B VDD VDD P_18 l=0.18u w=2.50u m=1
MP3 Cbar Cin n1 VDD P_18 l=0.18u w=2.50u m=1
MP7 n3 A VDD VDD P_18 l=0.18u w=2.50u m=1
MP8 n3 B VDD VDD P_18 l=0.18u w=2.50u m=1
MP9 n3 Cin VDD VDD P_18 l=0.18u w=2.50u m=1
MP10 Sbar Cbar n3 VDD P_18 l=0.18u w=2.50u m=1
MP15 Sbar Cin n7 VDD P_18 l=0.18u w=2.50u m=1
MP16 n7 B n8 VDD P_18 l=0.18u w=2.50u m=1
MP17 n8 A VDD VDD P_18 l=0.18u w=2.50u m=1
MP21 n9 A VDD VDD P_18 l=0.18u w=2.50u m=1
MP22 Cbar B n9 VDD P_18 l=0.18u w=2.50u m=1
MP25 S Sbar VDD VDD P_18 l=0.18u w=2.50u m=1
MP27 Cout Cbar VDD VDD P_18 l=0.18u w=2.50u m=1

* NMOS transistors
MN4 n2 A GND GND N_18 l=0.18u w=2.00u m=1
MN5 n2 B GND GND N_18 l=0.18u w=2.00u m=1
MN6 Cbar Cin n2 GND N_18 l=0.18u w=2.00u m=1
MN11 Sbar A n5 GND N_18 l=0.18u w=2.00u m=1
MN12 n5 B n6 GND N_18 l=0.18u w=2.00u m=1
MN13 n6 Cin GND GND N_18 l=0.18u w=2.00u m=1
MN14 Sbar Cbar n4 GND N_18 l=0.18u w=2.00u m=1
MN18 n4 A GND GND N_18 l=0.18u w=2.00u m=1
MN19 n4 B GND GND N_18 l=0.18u w=2.00u m=1
MN20 n4 Cin GND GND N_18 l=0.18u w=2.00u m=1
MN23 Cbar A n10 GND N_18 l=0.18u w=2.00u m=1
MN24 n10 B GND GND N_18 l=0.18u w=2.00u m=1
MN26 S Sbar GND GND N_18 l=0.18u w=2.00u m=1
MN28 Cout Cbar GND GND N_18 l=0.18u w=2.00u m=1
.ENDS
