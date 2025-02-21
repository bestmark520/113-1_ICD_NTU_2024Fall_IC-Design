* Inverter Spice

* 讀取同資料夾的cic018.l製成檔案
.lib ‘cic018.l’ tt 
*********************Inverter*********************
*[body]在標準 CMOS 電路設計中：
*PMOS 的 body（基板） 通常連接到 VDD，這樣可以避免 body 和 source 之間形成寄生二極管。
*NMOS 的 body（基板） 通常連接到 GND，同樣是為了避免寄生二極管的問題。
* [名稱] [drain] [gate] [source] [body] [n_18，呼叫1.8V的mos] [l=length] [w=width] [m=並聯數]
* [名稱] [source] [gate] [drain] [body] [p_18，呼叫1.8V的mos] [l=length] [w=width] [m=並聯數]
* [名稱] [輸出] [gate] [接直流或接地] [body] [呼叫1.8V的mos] [l=length] [w=width] [m=並聯數]
.subckt inverter vdd gnd in out
MM1 out in gnd gnd N_18 l=0.18u w=0.25u m=1
MM2 out in vdd vdd P_18 l=2u w=13u m=1
.ends
**************************************************

*********************SUB-CIRCUIT******************
* 呼叫子電路 [名稱] [netlist] [呼叫的電路名稱]
X1 VDD gnd in out inverter
**************************************************

***************INDEPENDENT SOURCE*****************
VDD Vdd 0 DC 1.8V
VSS gnd 0 DC 0V
* Vin是獨立電源，pulse([準位1] [準位2] [等多久拉起來] [rasing time] [falling time] [維持準位2多久] [一個pulse週期多久])
* pulse([準位1] [準位2] [TD] [TR] [TF] [PW] [PER])
Vin in 0 pulse(0 1.8 0 1n 1n 100n 200n)
*************************************************

.op
.option post

* .tran [經準度] [總時長]
.tran 1n 1u 

* .probe 看某電流電壓
.probe I(MM1) I(MM2)

.end
