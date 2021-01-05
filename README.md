# PBSM_Marlin_SKR_conf
Configuration to upgrade the Printrbot Simple Metal to an SKR Mini V1.2 controller.

![Board mount](/images/adapter.png)
The board adapter (in its current form) needs 4x M3x5mm standoffs. to mount the board.

# Wiring:
![Wiring photo](/images/wires.jpg)
#### Z-Probe voltage divider harness:
The inductive probe used for bed leveling, I've wired mine to run off the +12V tap on the board, with a 12k&Omega; voltage divider:

(Signal)----[9k&Omega;]----{Vout}----[3k&Omega;]----(GND)

Vout is the 3V signal from the signal output of the probe, wire this to the z-stop connector and __not__ the probe connector.

#### Motors:
I wired all the motors into JST connectors.

# Configuration Notes:
## Heaters:
#### Hotend:
PID settings for the Ubis hotend: `M301 P22.20 I1.08 D114.00`
#### Bed:
The Bed doesn't need PID control, due to the thermal mass of the bed and low wattage of the heater, so I have the "bang-bang" mode enabled.

## Bed Leveling:
Using bilinear mesh 7x7 (49pt), because my stock printrbot bent aluminum bed is rather warped (+/- .35mm).

## Motion Settings:
The Printrbot stock step/mm settings have just been copied over: `M92 X80.00 Y80.00 Z2020.00 E94.50`
with max feedrates:
`M203 X150.00 Y150.00 Z7.00 E40.00`
and maximum acceleration setting:
`M201 X2000.00 Y2000.00 Z100.00 E10000.00`
with acceleration set to:
`M204 P1500.00 R3000.00 T1500`
