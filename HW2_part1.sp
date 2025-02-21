* 4-bit Ripple Carry Adder with Corrected MOS Format
.lib 'cic018.l' TT

* Full Adder Subcircuit
.SUBCKT FULL_ADDER A B Cin S Cout VDD GND
* [名稱] [輸出] [gate] [接直流或接地] [body] [呼叫1.8V的mos] [l=length] [w=width] [m=並聯數]
* PMOS transistors
MP1 n1 A VDD VDD P_18 l=0.18u w=0.75u m=1
MP2 n1 B VDD VDD P_18 l=0.18u w=0.75u m=1
MP3 Cbar Cin n1 VDD P_18 l=0.18u w=0.75u m=1
MP7 n3 A VDD VDD P_18 l=0.18u w=0.75u m=1
MP8 n3 B VDD VDD P_18 l=0.18u w=0.75u m=1
MP9 n3 Cin VDD VDD P_18 l=0.18u w=0.75u m=1
MP10 Sbar Cbar n3 VDD P_18 l=0.18u w=0.75u m=1
MP15 Sbar Cin n7 VDD P_18 l=0.18u w=0.75u m=1
MP16 n7 B n8 VDD P_18 l=0.18u w=0.75u m=1
MP17 n8 A VDD VDD P_18 l=0.18u w=0.75u m=1
MP21 n9 A VDD VDD P_18 l=0.18u w=0.75u m=1
MP22 Cbar B n9 VDD P_18 l=0.18u w=0.75u m=1
MP25 S Sbar VDD VDD P_18 l=0.18u w=0.75u m=1
MP27 Cout Cbar VDD VDD P_18 l=0.18u w=0.75u m=1

* NMOS transistors
MN4 n2 A GND GND N_18 l=0.18u w=0.25u m=1
MN5 n2 B GND GND N_18 l=0.18u w=0.25u m=1
MN6 Cbar Cin n2 GND N_18 l=0.18u w=0.25u m=1
MN11 Sbar A n5 GND N_18 l=0.18u w=0.25u m=1
MN12 n5 B n6 GND N_18 l=0.18u w=0.25u m=1
MN13 n6 Cin GND GND N_18 l=0.18u w=0.25u m=1
MN14 Sbar Cbar n4 GND N_18 l=0.18u w=0.25u m=1
MN18 n4 A GND GND N_18 l=0.18u w=0.25u m=1
MN19 n4 B GND GND N_18 l=0.18u w=0.25u m=1
MN20 n4 Cin GND GND N_18 l=0.18u w=0.25u m=1
MN23 Cbar A n10 GND N_18 l=0.18u w=0.25u m=1
MN24 n10 B GND GND N_18 l=0.18u w=0.25u m=1
MN26 S Sbar GND GND N_18 l=0.18u w=0.25u m=1
MN28 Cout Cbar GND GND N_18 l=0.18u w=0.25u m=1
.ENDS

* 4-bit Ripple Carry Adder
XFA1 A1 B1 Cin S1 C1 VDD GND FULL_ADDER
XFA2 A2 B2 C1 S2 C2 VDD GND FULL_ADDER
XFA3 A3 B3 C2 S3 C3 VDD GND FULL_ADDER
XFA4 A4 B4 C3 S4 Cout VDD GND FULL_ADDER

* Power supply
VDD VDD 0 DC 1.8V
VSS GND 0 DC 0V

* Input signals for 0001 + 0001
VA1 A1 GND pulse(0 1.8 100n 1.25n 1.25n 100n 200n)
VA2 A2 GND pulse(0 0 0 1.25n 1.25n 100n 200n)
VA3 A3 GND pulse(0 0 0 1.25n 1.25n 100n 200n)
VA4 A4 GND pulse(0 0 0 1.25n 1.25n 100n 200n)
VB1 B1 GND pulse(0 1.8 100n 1.25n 1.25n 100n 200n)
VB2 B2 GND pulse(0 0 0 1.25n 1.25n 100n 200n)
VB3 B3 GND pulse(0 0 0 1.25n 1.25n 100n 200n)
VB4 B4 GND pulse(0 0 0 1.25n 1.25n 100n 200n)
VCIN Cin GND pulse(0 0 0 1.25n 1.25n 100n 200n)

*pulse([準位1] [準位2] [等多久拉起來] [rasing time] [falling time] [維持準位2多久] [一個pulse週期多久])
*pulse([準位1] [準位2] [TD] [TR] [TF] [PW] [PER])
*pulse(0 1.8 0 1n 1n 100n 200n)

* Analysis commands
.tran 0.1n 400n
.print tran v(A1) v(A2) v(A3) v(A4) v(B1) v(B2) v(B3) v(B4) v(Cin) v(S1) v(S2) v(S3) v(S4) v(Cout)
.option post=2
.temp 25
.option accurate=1

.end

***