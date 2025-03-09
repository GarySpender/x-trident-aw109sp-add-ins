----------------------------------- DATAREFS -----------------------------------
xpdr_joy_mapped_axis_avail = find_dataref("sim/joystick/joy_mapped_axis_avail")
xpdr_joy_mapped_axis_value = find_dataref("sim/joystick/joy_mapped_axis_value")

dr_rotor_brake               = find_dataref("aw109/cockpit/lever/rotor/rotor_brake")
dr_park_brake               = find_dataref("aw109/cockpit/lever/gear/emer_brake")
dr_nosewheel_lock               = find_dataref("aw109/cockpit/lever/gear/nosewheel_lock")
----------------------------------- ENUMS -----------------------------------
local joy_use_none          = 00
local joy_use_ptch          = 01
local joy_use_roll          = 02
local joy_use_hdng          = 03
local joy_use_thro          = 04
local joy_use_coll          = 05
local joy_use_lbrk          = 06
local joy_use_rbrk          = 07
local joy_use_prop          = 08
local joy_use_mixt          = 09
local joy_use_heat          = 10
local joy_use_flap          = 11
local joy_use_vect          = 12
local joy_use_swee          = 13
local joy_use_sbrk          = 14
local joy_use_disp          = 15
local joy_use_reverse       = 16
local joy_use_elev_tr       = 17
local joy_use_ailn_tr       = 18
local joy_use_rudd_tr       = 19
local joy_use_thro1         = 20
local joy_use_thro2         = 21
local joy_use_thro3         = 22
local joy_use_thro4         = 23
local joy_use_prop1         = 24
local joy_use_prop2         = 25
local joy_use_prop3         = 26
local joy_use_prop4         = 27
local joy_use_mixt1         = 28
local joy_use_mixt2         = 29
local joy_use_mixt3         = 30
local joy_use_mixt4         = 31
local joy_use_reverse1      = 32
local joy_use_reverse2      = 33
local joy_use_reverse3      = 34
local joy_use_reverse4      = 35
local joy_use_gear          = 36
local joy_use_tiller        = 37
local joy_use_back_thro     = 38
local joy_use_cowl_flaps    = 39
local JOY_OLD_UNUSED        = 40
local joy_use_view_lr       = 41
local joy_use_view_ud       = 42
local joy_use_view_zoom     = 43
local joy_use_camera_lr     = 44
local joy_use_camera_ud     = 45
local joy_use_camera_zoom   = 46
local joy_use_gun_lr        = 47
local joy_use_gun_ud        = 48
local joy_use_vr_touchpad_x = 49
local joy_use_vr_touchpad_y = 50
local joy_use_vr_trigger    = 51
local joy_use_commands      = 52
local joy_use_thro5         = 53  --rotor brake
local joy_use_thro6         = 54 -- park brake
local joy_use_thro7         = 55 -- radio 1 brt
local joy_use_thro8         = 56 -- radio 0 brt 
local joy_use_cowl_flaps1   = 57 -- wxr gain
local joy_use_cowl_flaps2   = 58 -- wxr tilt
local joy_use_cowl_flaps3   = 59 -- nose wheel lock
local joy_use_cowl_flaps4   = 60
local joy_use_cowl_flaps5   = 61
local joy_use_cowl_flaps6   = 62
local joy_use_cowl_flaps7   = 63
local joy_use_cowl_flaps8   = 64
local joy_use_thro_vrt      = 65
local joy_use_thro_hrz      = 66

----------------------------------- RUNTIME CODE -----------------------------------

-- DO THIS EACH FLIGHT START
--function flight_start()
	--none
--end


-- REGULAR RUNTIME
function after_physics()

	if xpdr_joy_mapped_axis_avail[joy_use_thro5] > 0 then
		dr_rotor_brake = xpdr_joy_mapped_axis_value[joy_use_thro5]
	end

	if xpdr_joy_mapped_axis_avail[joy_use_thro6] > 0 then
		dr_park_brake = xpdr_joy_mapped_axis_value[joy_use_thro6]
	end
	
	if xpdr_joy_mapped_axis_avail[joy_use_cowl_flaps_3] > 0 then
		dr_nosewheel_lock = xpdr_joy_mapped_axis_value[joy_use_cowl_flaps_3]
	end
end
