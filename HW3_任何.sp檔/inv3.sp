************************************************************************
* auCdl Netlist:
* 
* Library Name:  ICD_lib
* Top Cell Name: inv3
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
*PARAM是宣告變數

************************************************************************
* Library Name: ICD_lib
* Cell Name:    inv3
* View Name:    schematic
************************************************************************

.SUBCKT inv3 gnd vdd vin vout
*.PININFO vin:I vout:O gnd:B vdd:B
MM1 vout vin gnd gnd N_18 W=2.00u L=0.18u
MM0 vout vin vdd vdd P_18 W=2.50u L=0.18u
.ENDS
