.PARAM

* Full Adder Subcircuit
.SUBCKT adder A B Cin S Cout VDD GND
* PMOS transistors
MP1 n1 A VDD1 VDD1 P_18 l=0.18u w=2.50u m=1
MP2 n1 B VDD2 VDD2 P_18 l=0.18u w=2.50u m=1
MP3 Cbar Cin n1 VDD3 P_18 l=0.18u w=2.50u m=1
MP7 n3 A VDD4 VDD4 P_18 l=0.18u w=2.50u m=1
MP8 n3 B VDD5 VDD5 P_18 l=0.18u w=2.50u m=1
MP9 n3 Cin VDD6 VDD6 P_18 l=0.18u w=2.50u m=1
MP10 Sbar Cbar n3 VDD7 P_18 l=0.18u w=2.50u m=1
MP15 Sbar Cin n7 VDD8 P_18 l=0.18u w=2.50u m=1
MP16 n7 B n8 VDD9 P_18 l=0.18u w=2.50u m=1
MP17 n8 A VDD10 VDD10 P_18 l=0.18u w=2.50u m=1
MP21 n9 A VDD11 VDD11 P_18 l=0.18u w=2.50u m=1
MP22 Cbar B n9 VDD12 P_18 l=0.18u w=2.50u m=1
MP25 S Sbar VDD13 VDD13 P_18 l=0.18u w=2.50u m=1
MP27 Cout Cbar VDD14 VDD14 P_18 l=0.18u w=2.50u m=1

* NMOS transistors
MN4 n2 A GND1 GND1 N_18 l=0.18u w=2.00u m=1
MN5 n2 B GND2 GND2 N_18 l=0.18u w=2.00u m=1
MN6 Cbar Cin n2 GND3 N_18 l=0.18u w=2.00u m=1
MN11 Sbar A n5 GND4 N_18 l=0.18u w=2.00u m=1
MN12 n5 B n6 GND5 N_18 l=0.18u w=2.00u m=1
MN13 n6 Cin GND6 GND6 N_18 l=0.18u w=2.00u m=1
MN14 Sbar Cbar n4 GND7 N_18 l=0.18u w=2.00u m=1
MN18 n4 A GND8 GND8 N_18 l=0.18u w=2.00u m=1
MN19 n4 B GND9 GND9 N_18 l=0.18u w=2.00u m=1
MN20 n4 Cin GND10 GND10 N_18 l=0.18u w=2.00u m=1
MN23 Cbar A n10 GND11 N_18 l=0.18u w=2.00u m=1
MN24 n10 B GND12 GND12 N_18 l=0.18u w=2.00u m=1
MN26 S Sbar GND13 GND13 N_18 l=0.18u w=2.00u m=1
MN28 Cout Cbar GND14 GND14 N_18 l=0.18u w=2.00u m=1
.ENDS
