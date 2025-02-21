************************************************************************
* auCdl Netlist:
* 
* Library Name:  ICD_lib
* Top Cell Name: inv4
* View Name:     schematic
* Netlisted on:  Oct 29 10:57:45 2024
************************************************************************

*.BIPOLAR
*.RESI = 2000 
*.RESVAL
*.CAPVAL
*.DIOPERI
*.DIOAREA
*.EQUATION
*.SCALE METER
*.MEGA
.PARAM



************************************************************************
* Library Name: ICD_lib
* Cell Name:    inv4
* View Name:    schematic
************************************************************************

.SUBCKT inv4 gnd vdd vin vout
*.PININFO vin:I vout:O gnd:B vdd:B
MM1 vout vin gnd gnd N_18 W=2.00u L=180.00n
MM0 vout vin vdd vdd P_18 W=2.00u L=180.00n
.ENDS

