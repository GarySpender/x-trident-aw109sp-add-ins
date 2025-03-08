----------------------------------- DATAREFS -----------------------------------
dr_fuel_valve1          = find_dataref("aw109/cockpit/switch/fuel/sov1") 	
dr_fuel_valve2          = find_dataref("aw109/cockpit/switch/fuel/sov2") 	

dr_fuel_pump1          = find_dataref("aw109/cockpit/switch/fuel/f_pump1");
dr_fuel_pump2         = find_dataref("aw109/cockpit/switch/fuel/f_pump2");

dr_power_lever_fuel_shut_off1 = find_dataref("aw109/cockpit/lever/engine/power_lever_1");
dr_power_lever_fuel_shut_off2 = find_dataref("aw109/cockpit/lever/engine/power_lever_2")
------------------------
--	COMMAND HANDLERS
------------------------
--
-- phase
-- 0: The command is being started.
-- 1: The command is continuing to execute.
-- 2: The command has ended.

----------------------------------- RUNTIME CODE -----------------------------------

-- DO THIS EACH FLIGHT START
--function flight_start()
	--none
--end


-- REGULAR RUNTIME
function after_physics()

end

--This is the way to map two switches to on and of rather immply, off by using not on. 
--This is the preferred method
function handle_fuel_valve_1_on(phase,duration)
	if phase == 0 then
		dr_fuel_valve1 = 0 -- 0 as this is shut off valve off (so fuel on)
	end
end

function handle_fuel_valve_1_off(phase,duration)
	if phase == 0 then
		dr_fuel_valve1 = 1 -- 0 as this is shut off valve off (so fuel on)
	end
end

function handle_fuel_valve_2_on(phase,duration)
	if phase == 0 then
		dr_fuel_valve2 = 0
	end
end

function handle_fuel_valve_2_off(phase,duration)
	if phase == 0 then
		dr_fuel_valve2 = 1
	end
end

--This method works if you only have an on toggle switch and no off switch, it will not work until the switch has been movedi into the on position
--This is not the best way to do this. 
function handle_fuel_valve_1(phase,duration)
	if phase == 0 then
		dr_fuel_valve1 = 0
	elseif	phase == 2 then
		dr_fuel_valve1 = 1
	end
end

function handle_fuel_valve_2(phase,duration)
	if phase == 0 then
		dr_fuel_valve2 = 0
	elseif	phase == 2 then
		dr_fuel_valve2 = 1
	end
end

function handle_fuel_pump_1(phase,duration)
	if phase == 0 then
		dr_fuel_pump1 = 1
	elseif	phase == 2 then
		dr_fuel_pump1 = 0
	end
end

function handle_fuel_pump_2(phase,duration)
	if phase == 0 then
		dr_fuel_pump2 = 1
	elseif	phase == 2 then
		dr_fuel_pump2 = 0
	end
end

function handle_fuel_pump_1_on(phase,duration)
	if phase == 0 then
		dr_fuel_pump1 = 1
	end
end

function handle_fuel_pump_1_off(phase,duration)
	if phase == 0 then
		dr_fuel_pump1 = 0
	end
end

function handle_fuel_pump_2_on(phase,duration)
	if phase == 0 then
		dr_fuel_pump2 = 1
	end
end

function handle_fuel_pump_2_off(phase,duration)
	if phase == 0 then
		dr_fuel_pump2 = 0
	end
end


function handle_power_lever_fuel_shut_off_1(phase,duration)
	if phase == 0 then
		dr_power_lever_fuel_shut_off1 = -1
	elseif	phase == 2 then
		--dr_fuel_pump2 = 0
	end
end

function handle_power_lever_fuel_shut_off_2(phase,duration)
	if phase == 0 then
		dr_power_lever_fuel_shut_off2 = -1
	elseif	phase == 2 then
		--dr_fuel_pump2 = 0
	end
end

---TBD: check that using button code works correctly for switches.
--- FUEL PANEL
cmd_fuel_valve_1 	   = create_command("aw109/fuelpanel/valve_1",       "AW109_FUEL_SOV1",       handle_fuel_valve_1)
cmd_fuel_valve_1_on 	   = create_command("aw109/fuelpanel/valve_1_on",       "AW109_FUEL_SOV1_ON",       handle_fuel_valve_1_on)
cmd_fuel_valve_1_off 	   = create_command("aw109/fuelpanel/valve_1_off",       "AW109_FUEL_SOV1_OFF",       handle_fuel_valve_1_off)

cmd_fuel_valve_2	   = create_command("aw109/fuelpanel/valve_2",       "AW109_FUEL_SOV2",       handle_fuel_valve_2)
cmd_fuel_valve_2_on 	   = create_command("aw109/fuelpanel/valve_2_on",       "AW109_FUEL_SOV2_ON",       handle_fuel_valve_2_on)
cmd_fuel_valve_2_off 	   = create_command("aw109/fuelpanel/valve_2_off",       "AW109_FUEL_SOV2_OFF",       handle_fuel_valve_2_off)


cmd_fuel_pump_1    = create_command("aw109/fuelpanel/pump_1",       "AW109_FUEL_PUMP1",       handle_fuel_pump_1)
cmd_fuel_pump_1_on 	   = create_command("aw109/fuelpanel/pump_1_on",       "AW109_FUEL_PUMP1_ON",       handle_fuel_pump_1_on)
cmd_fuel_pump_1_off 	   = create_command("aw109/fuelpanel/pump_1_off",       "AW109_FUEL_PUMP1_OFF",       handle_fuel_pump_1_off)

cmd_fuel_pump_2	   = create_command("aw219/fuelpanel/pump_2",       "AW109_FUEL_PUMP2",       handle_fuel_pump_2)
cmd_fuel_pump_2_on 	   = create_command("aw109/fuelpanel/pump_2_on",       "AW109_FUEL_PUMP2_ON",       handle_fuel_pump_2_on)
cmd_fuel_pump_2_off 	   = create_command("aw109/fuelpanel/pump_2_off",       "AW109_FUEL_PUMP2_OFF",       handle_fuel_pump_2_off)


cmd_power_lever_fuel_shutoff_1    = create_command("aw109/overhead/power_lever_fuel_shutoff_1",       "AW109_OVERHEARD_POWER_LEVER_FUEL_SHUTOFF1",       handle_power_lever_fuel_shut_off_1)
cmd_power_lever_fuel_shutoff_2    = create_command("aw109/overhead/power_lever_fuel_shutoff_2",       "AW109_OVERHEARD_POWER_LEVER_FUEL_SHUTOFF2",       handle_power_lever_fuel_shut_off_2)
