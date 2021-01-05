# PBSM_Marlin_SKR_conf
Configuration to upgrade the Printrbot Simple Metal to an SKR Mini V1.2 controller.

# Wiring:

#### Z-Probe voltage divider harness:
The inductive probe used for bed leveling, I've wired mine to run off the +12V tap on the board, with a 12k$\Omega$

---
# Configuration Notes:
## Heaters:
#### Hotend:
PID settings for the Ubis hotend: `M301 P22.20 I1.08 D114.00`
#### Bed:
The Bed doesn't need PID control, due to the thermal mass of the bed and low wattage of the heater, so I have the "bang-bang" mode enabled.

## Bed Leveling:
Using bilinear mesh 7x7 (49pt), because the stock printrbot bent aluminum bed is rather warped (+/- .35mm).

## Motion Settings:
The Printrbot stock step/mm settings have just been copied over: `M92 X80.00 Y80.00 Z2020.00 E94.50`
with max feedrates:
`M203 X150.00 Y150.00 Z7.00 E40.00`
and maximum acceleration setting:
`M201 X2000.00 Y2000.00 Z100.00 E10000.00`
with acceleration set to:
`M204 P1500.00 R3000.00 T1500`
