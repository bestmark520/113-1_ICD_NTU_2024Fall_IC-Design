.prot
.lib '../cic018.l' TT
.temp 25
.unprot
.option pre

.inc "inv3.sp"

x1 gnd vdd vin vout inv3

VDD vdd gnd dc=1.8
VIN vin gnd dc=0

.dc vin 0 1.8 0.01

.meas dc trig FIND V(vout) WHEN V(vin)=0.9

.probe V(vout)

.end