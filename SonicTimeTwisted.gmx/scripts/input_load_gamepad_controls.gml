// gamepad inputs
input_reset_gamepad_bindings();
var loaded = false;
if(argument0) // argument0 - from INI, default values if false
{    
    input_bind_buttons_or_axes(ini_read_string('gamepad_controls', 'up', string(-gp_axislv)), pad, cUP);
    input_bind_buttons_or_axes(ini_read_string('gamepad_controls', 'down', '+' + string(gp_axislv)), pad, cDOWN);
    input_bind_buttons_or_axes(ini_read_string('gamepad_controls', 'left', string(-gp_axislh)), pad, cLEFT);
    input_bind_buttons_or_axes(ini_read_string('gamepad_controls', 'right', '+' + string(gp_axislh)), pad, cRIGHT);
    
    input_bind_buttons_or_axes(ini_read_string('gamepad_controls','a', gp_face1), pad, cA);
    input_bind_buttons_or_axes(ini_read_string('gamepad_controls','b', gp_face1), pad, cB);
    input_bind_buttons_or_axes(ini_read_string('gamepad_controls','c', gp_face1), pad, cC);
    input_bind_buttons_or_axes(ini_read_string('gamepad_controls','start', gp_face1), pad, cSTART);
        
    rumble_strength = ini_read_real('gamepad_controls', 'rumble', 100);

    loaded = input_check_gamepad_bindings_complete();
    if(!loaded)
    {
        input_reset_gamepad_bindings();
    }
    
    gpanalog_in_zones = ini_read_real('input', 'analog_in_zones', 0);
    gpanalog_in_ss = ini_read_real('input', 'analog_in_ss', 0);
    gpanalog_in_gg = ini_read_real('input', 'analog_in_gg', 0);
    gpanalog_deadzone_min = ini_read_real('input', 'analog_deadzone_min', 0.2);
    gpanalog_deadzone_max = ini_read_real('input', 'analog_deadzone_max', 0.95);
    gpanalog_ss_min_angle = ini_read_real('input', 'analog_ss_min_angle', 15);
    gpanalog_ss_max_angle = ini_read_real('input', 'analog_ss_max_angle', 30);
}
if(!loaded)
{
    input_bind_button(pad, gp_face1, cA);
    input_bind_button(pad, gp_face2, cB);
    input_bind_button(pad, gp_face3, cC);
    input_bind_button(pad, gp_start, cSTART);
    
    input_bind_axis(pad, gp_axislv, -1, cUP);
    input_bind_axis(pad, gp_axislv,  1, cDOWN);
    input_bind_axis(pad, gp_axislh, -1, cLEFT);
    input_bind_axis(pad, gp_axislh,  1, cRIGHT);
    
    input_bind_button(pad, gp_padu, cUP);
    input_bind_button(pad, gp_padd, cDOWN);
    input_bind_button(pad, gp_padl, cLEFT);
    input_bind_button(pad, gp_padr, cRIGHT);
    
    gpanalog_in_zones = 0;
    gpanalog_in_ss = 0;
    gpanalog_in_gg = 0;
    gpanalog_deadzone_min = 0.2;
    gpanalog_deadzone_max = 0.95;
    gpanalog_ss_min_angle = 15;
    gpanalog_ss_max_angle = 30;
}
