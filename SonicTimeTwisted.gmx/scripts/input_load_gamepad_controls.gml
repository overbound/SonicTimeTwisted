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
}
if(!loaded)
{
    input_bind_button(pad, gp_face1, cA);
    input_bind_button(pad, gp_face2, cB);
    input_bind_button(pad, gp_face3, cC);
    input_bind_button(pad, gp_start, cSTART);
    
    input_bind_axis(pad, gp_axislv, -1, .3, cUP);
    input_bind_axis(pad, gp_axislv,  1, .3, cDOWN);
    input_bind_axis(pad, gp_axislh, -1, .3, cLEFT);
    input_bind_axis(pad, gp_axislh,  1, .3, cRIGHT);
    
    input_bind_button(pad, gp_padu, cUP);
    input_bind_button(pad, gp_padd, cDOWN);
    input_bind_button(pad, gp_padl, cLEFT);
    input_bind_button(pad, gp_padr, cRIGHT);
}
