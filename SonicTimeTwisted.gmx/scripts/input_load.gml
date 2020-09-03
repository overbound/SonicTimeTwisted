// input_load()
key_count = 0;
button_count = 0;
axis_count = 0;
var file = 'settings.ini';
if (file_exists(file)) {
    ini_open(file);
    pad = round(ini_read_real('gamepad_controls','padnumber', pad));
    
    // keyboard
    input_bind_key(round(ini_read_real('keyboard_controls','up',vk_up)), cUP);
    input_bind_key(round(ini_read_real('keyboard_controls', 'down', vk_down)), cDOWN);
    input_bind_key(round(ini_read_real('keyboard_controls', 'left', vk_left)), cLEFT);
    input_bind_key(round(ini_read_real('keyboard_controls', 'right', vk_right)), cRIGHT);
    input_bind_key(round(ini_read_real('keyboard_controls','a', ord('A'))), cA);
    input_bind_key(round(ini_read_real('keyboard_controls', 'b', ord('S'))), cB);
    input_bind_key(round(ini_read_real('keyboard_controls', 'c', ord('D'))), cC);
    input_bind_key(round(ini_read_real('keyboard_controls', 'start', vk_enter)), cSTART);
    
    // gamepad inputs
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
    
    ini_close();
    
} else {
    input_bind_key(vk_up, cUP);
    input_bind_key(vk_down, cDOWN);
    input_bind_key(vk_left, cLEFT);
    input_bind_key(vk_right, cRIGHT);
    
    input_bind_key(vk_numpad1, cA);
    input_bind_key(vk_numpad2, cB);
    input_bind_key(vk_numpad3, cC);
    
    input_bind_key(ord('A'), cA);
    input_bind_key(ord('S'), cB);
    input_bind_key(ord('D'), cC);
    
    input_bind_button(pad, gp_face1, cA);
    input_bind_button(pad, gp_face2, cB);
    input_bind_button(pad, gp_face3, cC);
    input_bind_button(pad, gp_start, cSTART);
    
    input_bind_axis(pad, gp_axislv, -1, .3, cUP);
    input_bind_axis(pad, gp_axislv,  1, .3, cDOWN);
    input_bind_axis(pad, gp_axislh, -1, .3, cLEFT);
    input_bind_axis(pad, gp_axislh,  1, .3, cRIGHT);
    
    input_bind_key(vk_enter, cSTART);
}
