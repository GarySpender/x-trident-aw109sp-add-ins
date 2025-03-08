--Script to handle transmit selector swtich with individual contacts for each position 

dr_p1_audio_panel_transmit_selector = find_dataref("aw109/cockpit/knob/acp/transmit_sel");

function handle_p1_xmit1(phase,duration)
	dr_p1_audio_panel_transmit_selector = 1;
end

function handle_p1_xmit2(phase,duration)
	dr_p1_audio_panel_transmit_selector = 2;
end

function handle_p1_xmit3(phase,duration)
	dr_p1_audio_panel_transmit_selector = 3;
end

function handle_p1_xmit4(phase,duration)
	dr_p1_audio_panel_transmit_selector = 4;
end

function handle_p1_xmit5(phase,duration)
	dr_p1_audio_panel_transmit_selector = 5;
end

cmd_p1_xmit_1	   = create_command("aw109/intercom/xmit1",       "P1_XMIT1",       handle_p1_xmit1)
cmd_p1_xmit_2	   = create_command("aw109/intercom/xmit2",       "P1_XMIT2",       handle_p1_xmit2)
cmd_p1_xmit_3      = create_command("aw109/intercom/xmit3",       "P1_XMIT3",       handle_p1_xmit3)
cmd_p1_xmit_4	   = create_command("aw109/intercom/xmit4",       "P1_XMIT4",       handle_p1_xmit4)
cmd_p1_xmit_5	   = create_command("aw109/intercom/xmit5",       "P1_XMIT5",       handle_p1_xmit5)