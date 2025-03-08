# x-Trident-AW109SP-add-ins
Add ins for the excellent AW109SP produced by x-Trident.
These add-ins are not produced by x-Trident, so if these add-ins don't work , its not their fault. 

Things that have been implemented up to now. 

Commands for some datarefs which mean they can be mapped to joystick buttons.

Fuel panel - Valves on / off, valve toggle (if you have an on switch), fuel pumps. 

Forward Overhead Panel - Battery , Generators, Gen Busses, Avionics Master Switch and power lever monunted start buttons. 

Some Autopilot buttons (AP1, AP2, HDG, IAS, ALT, NAV, RHT, HOV). Some of the other APMS buttons are already provided by xTrident by default and I do not plan to duplicate any of their work. 

Some Honeycomb Bravo mapping to allow the changing of heading / alt / ias / crs / vs etc by mapping the bravo knobs to individual controls and using the AW109 datarefs. 

Engine Mode Switches (without a physical rotary switch to map).

Transmitter selector on the P1 Audio Panel. 

Mapping of axes for linear "things" like rotor brake lever position and "emergency / parking" brake position. 

The xlua scripts should be placed into the plugins/xlua/scripts directory. 
Each script must be located inside a folder of the same name, the scripts must use the .lua extension in their file name.

Script names have been chosen to avoid known x-Trident offical script names so should be able to co-exist. 

I have started to create a Wiki for this small project to describe someo the issues faced when mapping hardware to software functions, this can be found at https://github.com/GarySpender/x-trident-aw109sp-add-ins/wiki

**Things to Note**
If a button is mapped to a switch, sometimes you have to move the switch twice to toggle the button. 
Also if a button is mapped to a switch, then things like AP1 and AP2 will re-engage if they are powered up and the switch is in the On position. 
Things like this look like the model isn't working correctly and has caught me out in recent weeks. 
