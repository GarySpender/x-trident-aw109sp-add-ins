--Scrip to map most of the overhead forward panel electrical switches
----------------------------------- DATAREFS -----------------------------------
dr_genbus1_engage = find_dataref("aw109/cockpit/switch/electrical/gen_bus1");
dr_genbus2_engage = find_dataref("aw109/cockpit/switch/electrical/gen_bus2");

dr_inverter1_engage = find_dataref("aw109/cockpit/switch/electrical/inv1");
dr_inverter2_engage = find_dataref("aw109/cockpit/switch/electrical/inv2");

dr_battery_switch = find_dataref("aw109/cockpit/switch/electrical/battery");

dr_avionics_master = find_dataref("aw109/cockpit/switch/electrical/mstr_avnx")

dr_gen1_switch = find_dataref("aw109/cockpit/switch/electrical/gen1");
dr_gen2_switch = find_dataref("aw109/cockpit/switch/electrical/gen2");

dr_starter_1 = find_dataref("aw109/cockpit/button/engine/starter1");
dr_starter_2 = find_dataref("aw109/cockpit/button/engine/starter2");

dr_pitot_heat_1 = find_dataref("aw109/cockpit/switch/misc/pitot1")
dr_pitot_heat_2 = find_dataref("aw109/cockpit/switch/misc/pitot2")

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

--Single switch mapped to do on and off
function handle_genbus_1(phase,duration)
	if phase == 0 then
		dr_genbus1_engage = 1
	elseif	phase == 2 then
		dr_genbus1_engage = 0
	end
end

function handle_genbus_2(phase,duration)
	if phase == 0 then
		dr_genbus2_engage = 1
	elseif	phase == 2 then
		dr_genbus2_engage = 0
	end
end

function handle_pitot_1_toggle(phase,duration)
	if phase == 0 then
		if dr_pitot_heat_1 == 0 then 
			dr_pitot_heat_1  = 1
			elseif dr_pitot_heat_1 == 1 then
			dr_pitot_heat_1  =0
		end
	end
end

function handle_pitot_2_toggle(phase,duration)
	if phase == 0 then
		if dr_pitot_heat_2 == 0 then 
			dr_pitot_heat_2 = 1
			elseif dr_pitot_heat_2 == 1 then
			dr_pitot_heat_2  =0
		end
	end
end

function handle_inverter_1(phase,duration)
	if phase == 0 then
		dr_inverter1_engage = 1
	elseif	phase == 2 then
		dr_inverter1_engage = 0
	end
end

function handle_inverter_2(phase,duration)
	if phase == 0 then
		dr_inverter2_engage = 1
	elseif	phase == 2 then
		dr_inverter2_engage = 0
	end
end

function handle_battery_switch(phase,duration)
	if phase == 0 then
		dr_battery_switch = 1
	elseif	phase == 2 then
		dr_battery_switch = 0
	end
end

function handle_gen1_switch(phase,duration)
	if phase == 0 then
		dr_gen1_switch = 1
	elseif	phase == 2 then
		dr_gen1_switch = 0
	end
end

function handle_gen2_switch(phase,duration)
	if phase == 0 then
		dr_gen2_switch = 1
	elseif	phase == 2 then
		dr_gen2_switch = 0
	end
end

function handle_avionics_master_switch(phase,duration)
	if phase == 0 then
		dr_avionics_master = 1
	elseif	phase == 2 then
		dr_avionics_master = 0
	end
end

function handle_generator_switches(phase,duration)
	handle_gen1_switch(phase,duration)
	handle_gen2_switch(phase,duration)
end

function handle_engine_starter_1_button_push(phase, duration)
	if phase == 0 then
		dr_starter_1=1 
	elseif	phase == 2 then
		dr_starter_1 = 0
	end
end

function handle_engine_starter_2_button_push(phase, duration)
	if phase == 0 then
		dr_starter_2=1 
	elseif	phase == 2 then
		dr_starter_2 = 0
	end
end

---TBD: check that using button code works correctly for switches.
cmd_genbus_1	   = create_command("aw109/overhead/genbus1",       "AW109_OVERHEAD_GENBUS1",       handle_genbus_1)
cmd_genbus_2	   = create_command("aw109/overhead/genbus2",       "AW109_OVERHEAD_GENBUS2",       handle_genbus_2)

cmd_inverter_1	   = create_command("aw109/overhead/inverter1",       "AW109_OVERHEAD_INV1",       handle_inverter_1)
cmd_inverter_2	   = create_command("aw109/overhead/inverter2",       "AW109_OVERHEAD_INV2",       handle_inverter_2)

cmd_battery	   = create_command("aw109/overhead/battery",       "AW109_OVERHEAD_BATTERY",       handle_battery_switch)

cmd_starter_button_1 = create_command("aw109/overhead/starter1",       "AW109_OVERHEAD_STARTER_1",       handle_engine_starter_1_button_push)
cmd_starter_button_2 = create_command("aw109/overhead/starter2",       "AW109_OVERHEAD_STARTER_2",       handle_engine_starter_2_button_push)

cmd_generators	   = create_command("aw109/overhead/generators",       "AW109_OVERHEAD_GEN1AND2",       handle_generator_switches)

cmd_avionic_master = create_command("aw109/overhead/avionics_master",       "AW109_OVERHEAD_MASTER_AVNX",  handle_avionics_master_switch)

cmd_pitot_1	   = create_command("aw109/overhead/pitot1_toggle",       "AW109_OVERHEAD_PITOT1_TOGGLE",       handle_pitot_1_toggle)
cmd_pitot_2	   = create_command("aw109/overhead/pitot2_toggle",       "AW109_OVERHEAD_PITOT2_TOGGLE",       handle_pitot_2_toggle)