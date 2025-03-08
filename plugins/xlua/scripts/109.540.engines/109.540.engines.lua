----------------------------------- DATAREFS -----------------------------------

dr_switch_engine1_eng_mode= find_dataref("aw109/cockpit/switch/engine/1_eng_mode");
dr_switch_engine2_eng_mode= find_dataref("aw109/cockpit/switch/engine/2_eng_mode");

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

function handle_engine1_mode_decrease(phase,duration)
	if phase == 0 then
		if dr_switch_engine1_eng_mode >0 then
			dr_switch_engine1_eng_mode = dr_switch_engine1_eng_mode -1
		end
		
	elseif	phase == 2 then
	
	end
end

function handle_engine1_mode_increase(phase,duration)
	if phase == 0 then
		if dr_switch_engine1_eng_mode <2 then
			dr_switch_engine1_eng_mode = dr_switch_engine1_eng_mode +1
		end
		
	elseif	phase == 2 then

	end
end

function handle_engine2_mode_decrease(phase,duration)
	if phase == 0 then
		if dr_switch_engine2_eng_mode >0 then
			dr_switch_engine2_eng_mode = dr_switch_engine2_eng_mode -1
		end
		
	elseif	phase == 2 then
	
	end
end

function handle_engine2_mode_increase(phase,duration)
	if phase == 0 then
		if dr_switch_engine2_eng_mode <2 then
			dr_switch_engine2_eng_mode = dr_switch_engine2_eng_mode +1
		end
		
	elseif	phase == 2 then

	end
end

---TBD: check that using button code works correctly for switches.

cmd_engine_1_mode_increase	   = create_command("aw109/engine_1/mode_increase",       "AW109_ENG1_MODE_INCREASE",       handle_engine1_mode_increase)
cmd_engine_1_mode_decrease	   = create_command("aw109/engine_1/mode_decrease",       "AW109_ENG1_MODE_DECREASE",       handle_engine1_mode_decrease)

cmd_engine_2_mode_increase	   = create_command("aw109/engine_2/mode_increase",       "AW109_ENG2_MODE_INCREASE",       handle_engine2_mode_increase)
cmd_engine_2_mode_decrease	   = create_command("aw109/engine_2/mode_decrease",       "AW109_ENG2_MODE_DECREASE",       handle_engine2_mode_decrease)
