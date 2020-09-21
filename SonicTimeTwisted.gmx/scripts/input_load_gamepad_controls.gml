// gamepad inputs
if(argument0) // argument0 - from INI, default values if false
{
    pad = round(ini_read_real('gamepad_controls','padnumber', pad));
    input_bind_button(pad, round(ini_read_real('gamepad_controls','a', gp_face1)), cA);
    input_bind_button(pad, round(ini_read_real('gamepad_controls','b', gp_face2)), cB);
    input_bind_button(pad, round(ini_read_real('gamepad_controls','c', gp_face3)), cC);
    input_bind_button(pad, round(ini_read_real('gamepad_controls','start', gp_start)), cSTART);
    
    var _up, _down, _left, _right;
    _up = ini_read_string('gamepad_controls', 'up', string(-gp_axislv));
    _down = ini_read_string('gamepad_controls', 'down', '+' + string(gp_axislv));
    _left = ini_read_string('gamepad_controls', 'left', string(-gp_axislh));
    _right = ini_read_string('gamepad_controls', 'right', '+' + string(gp_axislh));
    
    if (string_pos('+',_up) or string_pos('-',_up)) {
        input_bind_axis(pad, abs(round(real(_up))), 1*sign(real(_up)), .3, cUP);
    } else {
        input_bind_button(pad, round(real(_up)), cUP);
    }
    
    if (string_pos('+',_down) or string_pos('-',_down)) {
        input_bind_axis(pad, abs(round(real(_down))), 1*sign(real(_down)), .3, cDOWN);
    } else {
        input_bind_button(pad, round(real(_down)), cDOWN);
    }
    
    if (string_pos('+',_left) or string_pos('-',_left)) {
        input_bind_axis(pad, abs(round(real(_left))), 1*sign(real(_left)), .3, cLEFT);
    } else {
        input_bind_button(pad, round(real(_left)), cLEFT);
    }
    
    if (string_pos('+',_right) or string_pos('-',_right)) {
        input_bind_axis(pad, abs(round(real(_right))), 1*sign(real(_right)), .3, cRIGHT);
    } else {
        input_bind_button(pad, round(real(_right)), cRIGHT);
    }
}
else
{
    input_bind_button(pad, gp_face1, cA);
    input_bind_button(pad, gp_face2, cB);
    input_bind_button(pad, gp_face3, cC);
    input_bind_button(pad, gp_start, cSTART);
    
    input_bind_axis(pad, gp_axislv, -1, .3, cUP);
    input_bind_axis(pad, gp_axislv,  1, .3, cDOWN);
    input_bind_axis(pad, gp_axislh, -1, .3, cLEFT);
    input_bind_axis(pad, gp_axislh,  1, .3, cRIGHT);
}
