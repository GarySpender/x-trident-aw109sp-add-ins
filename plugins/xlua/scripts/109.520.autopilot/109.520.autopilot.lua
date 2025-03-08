--See Github for my unofficial explanation of naming conventions
----------------------------------- DATAREFS -----------------------------------
dr_button_apms_ap1 = find_dataref("aw109/cockpit/button/apms/ap1")
dr_button_apms_ap2 = find_dataref("aw109/cockpit/button/apms/ap2")

dr_ap1_status = find_dataref("aw109/autopilot/status/ap1")
dr_ap2_status = find_dataref("aw109/autopilot/status/ap2")

dr_apms_alt_push = find_dataref("aw109/cockpit/button/apms/alt_push")
dr_apms_hdg = find_dataref("aw109/cockpit/button/apms/hdg")
dr_apms_nav = find_dataref("aw109/cockpit/button/apms/nav")
dr_apms_ias_push = find_dataref("aw109/cockpit/button/apms/ias_push")

dr_apms_hov_button = find_dataref("aw109/cockpit/button/apms/hov")

dr_apms_rht_push = find_dataref("aw109/cockpit/button/apms/rht_push")

dr_autopilot_heading = find_dataref("aw109/cockpit/autopilot/heading")
dr_autopilot_heading_delta = find_dataref("aw109/autopilot_heading_delta")
dr_autopilot_altitude = find_dataref("sim/cockpit/autopilot/altitude")
dr_autopilot_vs = find_dataref("aw109/autopilot/vertical_velocity_att_hold")
dr_vertical_delta = find_dataref("aw109/autopilot_vertical_delta")

dr_autopilot_vertical_velocity = find_dataref("sim/cockpit/autopilot/vertical_velocity") -- this is change to current setting. 

IAS_KNOB = 0
NAV_KNOB = 1
HDG_KNOB = 2
VS_KNOB = 3
ALT_KNOB = 4

honeycomb_function = HDG_KNOB

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

function handle_ap_1_on(phase,duration)
	if  dr_ap1_status == 0 then
		dr_ap1_status = 1
	end
end

function handle_ap_1_off(phase,duration)
	if  dr_ap1_status == 1 then
		dr_ap1_status = 0
	end
end

function handle_ap_2_on(phase,duration)
	if  dr_ap2_status == 0 then
		dr_ap2_status = 1 
		end
end

function handle_ap_2_off(phase,duration)
	if dr_ap2_status == 1 then
		dr_ap2_status = 0
	end
end

function handle_ap_1and2(phase,duration)
	handle_ap_1_toggle(phase,duration)
	handle_ap_2_toggle(phase,duration)
end

function handle_ap_1_toggle(phase,duration)
	if phase == 0 then
		dr_button_apms_ap1 =1 
		
	elseif	phase == 2 then
		dr_button_apms_ap1 = 0
	end
end

function handle_ap_2_toggle(phase,duration)
	if phase == 0 then
		dr_button_apms_ap2 = 1
	elseif	phase == 2 then
		dr_button_apms_ap2 = 0
	end
end

function handle_ap_alt_toggle(phase,duration)
	if phase == 0 then
		dr_apms_alt_push = 1
	elseif	phase == 2 then
		dr_apms_alt_push = 0
	end
end

function handle_ap_ias_toggle(phase,duration)
	if phase == 0 then
		dr_apms_ias_push = 1
	elseif	phase == 2 then
		dr_apms_ias_push = 0
	end
end

function handle_ap_hdg_toggle(phase,duration)
	if phase == 0 then
		dr_apms_hdg = 1
	elseif	phase == 2 then
		dr_apms_hdg = 0
	end
end

function handle_ap_nav_toggle(phase,duration)
	if phase == 0 then
		dr_apms_nav = 1
	elseif	phase == 2 then
		dr_apms_nav = 0
	end
end

function handle_ap_hov_toggle(phase,duration)
	if phase == 0 then
		dr_apms_hov_button = 1
	elseif	phase == 2 then
		dr_apms_hov_button = 0
	end
end

function handle_ap_rht_toggle(phase,duration)
	if phase == 0 then
		dr_apms_rht_push = 1
	elseif	phase == 2 then
		dr_apms_rht_push= 0
	end
end

function handle_honeycomb_alt(phase,duration)
	honeycomb_function = ALT_KNOB;
end

function handle_honeycomb_vs(phase,duration)
	honeycomb_function = VS_KNOB;
end

function handle_honeycomb_hdg(phase,duration)
	honeycomb_function = HDG_KNOB;
end

function handle_honeycomb_crs(phase,duration)
	honeycomb_function = HDG_CRS;
end

function handle_honeycomb_ias(phase,duration)
	honeycomb_function = HDG_IAS;
end

function handle_honeycomb_up(phase,duration)
	if phase == 0 then 
		if honeycomb_function == ALT_KNOB then
			dr_autopilot_altitude = dr_autopilot_altitude + 100
		elseif honeycomb_function == HDG_KNOB then 
			dr_autopilot_heading_delta =  1
		elseif honeycomb_function == VS_KNOB then 
				dr_autopilot_vertical_velocity = 	dr_autopilot_vertical_velocity + 100
		elseif honeycomb_function == IAS_KNOB then 
				
		elseif honeycomb_function == CRS_KNOB then
		
		end
	end
		
	if phase == 2 then 
		if honeycomb_function == ALT_KNOB then
			dr_autopilot_altitude = dr_autopilot_altitude +0
		elseif honeycomb_function == HDG_KNOB then 
			dr_autopilot_heading_delta =  0
		elseif honeycomb_function == VS_KNOB then 
			--	dr_autopilot_vertical_velocity = 0
		elseif honeycomb_function == IAS_KNOB then 
				
		elseif honeycomb_function == CRS_KNOB then
		
		
		end
	end
	
end

function handle_honeycomb_down(phase,duration)
	if phase == 0 then 
		if honeycomb_function == ALT_KNOB then
			dr_autopilot_altitude = dr_autopilot_altitude - 100
			
		elseif honeycomb_function == HDG_KNOB then 
			dr_autopilot_heading_delta =  -1
			
		elseif honeycomb_function == VS_KNOB then 
				dr_autopilot_vertical_velocity = 	dr_autopilot_vertical_velocity- 100
				
		elseif honeycomb_function == IAS_KNOB then 
				
		elseif honeycomb_function == CRS_KNOB then
				
		end
	end
		
	if phase == 2 then 
		if honeycomb_function == ALT_KNOB then
			dr_autopilot_altitude = dr_autopilot_altitude +0
		elseif honeycomb_function == HDG_KNOB then 
			dr_autopilot_heading_delta =  0
		elseif honeycomb_function == VS_KNOB then 
	--		dr_autopilot_vertical_velocity = 0
		elseif honeycomb_function == IAS_KNOB then 
				
		elseif honeycomb_function == CRS_KNOB then
		
		end
	end
	
end

---TBD: check that using button code works correctly for switches.

cmd_ap_1_toggle	   = create_command("aw109/apms/ap1",       "AW109_APMS_AP1",       handle_ap_1_toggle)
cmd_ap_2_toggle	   = create_command("aw109/apms/ap2",       "AW109_APMS_AP2",       handle_ap_2_toggle)

cmd_ap_1_on	   = create_command("aw109/apms/ap1_on",       "AW109_APMS_AP1_ON",       handle_ap_1_on)
cmd_ap_1_off	   = create_command("aw109/apms/ap1_off",       "AW109_APMS_AP1_OFF",       handle_ap_1_off)

cmd_ap_2_on	   = create_command("aw109/apms/ap2_on",       "AW109_APMS_AP2_ON",       handle_ap_2_on)
cmd_ap_2_off	   = create_command("aw109/apms/ap2_off",       "AW109_APMS_AP2_OFF",       handle_ap_2_off)

cmd_ap_1and2	   = create_command("aw109/apms/ap1and2",       "AW109_APMS_AP1AND2",       handle_ap_1and2)

cmd_ap_alt	   = create_command("aw109/apms/ap_alt",       "AW109_APMS_ALT",       handle_ap_alt_toggle)
cmd_ap_ias   = create_command("aw109/apms/ap_ias",       "AW109_APMS_IAS",       handle_ap_ias_toggle)

cmd_ap_hdg	   = create_command("aw109/apms/ap_hdg",       "AW109_APMS_HDG",       handle_ap_hdg_toggle)
cmd_ap_nav	   = create_command("aw109/apms/ap_nav",       "AW109_APMS_NAV",       handle_ap_nav_toggle)

cmd_ap_hov	   = create_command("aw109/apms/ap_hov",       "AW109_APMS_HOV",       handle_ap_hov_toggle)
cmd_ap_rht	   = create_command("aw109/apms/ap_rht",       "AW109_APMS_RHT",       handle_ap_rht_toggle)


cmd_honeycomb_alt_mode	   = create_command("aw109/honeycomb/alt",       "HONEYCOMB_ALT_KNOB",       handle_honeycomb_alt)
cmd_honeycomb_hdg_mode	   = create_command("aw109/honeycomb/hdg",       "HONEYCOMB_HDG_KNOB",       handle_honeycomb_hdg)
cmd_honeycomb_vs_mode	   = create_command("aw109/honeycomb/vs",       "HONEYCOMB_VS_KNOB",       handle_honeycomb_vs)
cmd_honeycomb_ias_mode	   = create_command("aw109/honeycomb/ias",       "HONEYCOMB_IAS_KNOB",       handle_honeycomb_ias)
cmd_honeycomb_crs_mode	   = create_command("aw109/honeycomb/crs",       "HONEYCOMB_CRS_KNOB",       handle_honeycomb_crs)

cmd_honeycomb_up	   = create_command("aw109/honeycomb/up",       "HONEYCOMB_UP_KNOB",       handle_honeycomb_up)
cmd_honeycomb_dn	   = create_command("aw109/honeycomb/dn",       "HONEYCOMB_DN_KNOB",       handle_honeycomb_down)