.PARAM

.SUBCKT test GND1 GND2 VDD1 VDD2 Vin Vout
*.PININFO vin:I vout:O gnd:B vdd:B
MM1 n1 Vin GND1 GND1 N_18 W=2.00u L=0.18u
MM0 n1 Vin VDD1 VDD1 P_18 W=2.50u L=0.18u
MM3 Vout n1 GND2 GND2 N_18 W=2.00u L=0.18u
MM2 Vout n1 VDD2 VDD2 P_18 W=2.50u L=0.18u

.ENDS
