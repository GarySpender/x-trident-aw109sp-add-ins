# x-trident-aw109sp-add-ins
Add ins for the excellent AW109SP produced by x-Trident
Not produced by x-Trident, so if these add ins don't work , its not their fault. 

Things that have been implemented up to now. 

Commands for some datarefs which mean they can be mapped to joystick buttons.
Mapping of axes for linear things like rotor brake lever position and emergency / parking brake positions. 

The xlua scripts should be placed into the plugins/xlua/scripts directory. 
Each script must be located inside a folder of the same name. 

Script names have been chosen to avoid know x-Trident offical script names so should be able to co-exist. 

**Things to Note**
If a button is mapped to a switch, sometimes you have to move the switch twice to toggle the button. 
Also if a button is mapped to a switch, then things like AP1 and AP2 will re-engage if they are powered up and the switch is in the On position. 
Things like this look like the model isn't working correctly and has caught me out in recent weeks. 
