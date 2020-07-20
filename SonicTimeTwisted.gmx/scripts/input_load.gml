// input_load()
key_count = 0;
button_count = 0;
axis_count = 0;
var file = 'settings.ini';
if (eas_file_exists(file)) {
    eas_ini_open(file);
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
   
    var up, down, left, right, dz;
    up = ini_read_string('gamepad_controls', 'up', string(-gp_axislv));
    down = ini_read_string('gamepad_controls', 'down', '+' + string(gp_axislv));
    left = ini_read_string('gamepad_controls', 'left', string(-gp_axislh));
    right = ini_read_string('gamepad_controls', 'right', '+' + string(gp_axislh));
    dz = ini_read_real('gamepad_controls', 'deadzone', 0.3);
    
    if (string_pos('+', up) or string_pos('-', up)) {
        input_bind_axis(pad, abs(round(real(up))), sign(real(up)), dz, cUP);
    } else {
        input_bind_button(pad, round(real(up)), cUP);
    }
    
    if (string_pos('+', down) or string_pos('-', down)) {
        input_bind_axis(pad, abs(round(real(down))), sign(real(down)), dz, cDOWN);
    } else {
        input_bind_button(pad, round(real(down)), cDOWN);
    }
    
    if (string_pos('+', left) or string_pos('-', left)) {
        input_bind_axis(pad, abs(round(real(left))), sign(real(left)), dz, cLEFT);
    } else {
        input_bind_button(pad, round(real(left)), cLEFT);
    }
    
    if (string_pos('+', right) or string_pos('-', right)) {
        input_bind_axis(pad, abs(round(real(right))), sign(real(right)), dz, cRIGHT);
    } else {
        input_bind_button(pad, round(real(right)), cRIGHT);
    }
    
    eas_ini_close();
    
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
    
    input_bind_key(vk_enter, cSTART);
    
    input_bind_button(pad, gp_face1, cA);
    input_bind_button(pad, gp_face2, cB);
    input_bind_button(pad, gp_face3, cC);
    input_bind_button(pad, gp_start, cSTART);
    
    var dz = 0.3;
    
    input_bind_axis(pad, gp_axislv, -1, dz, cUP);
    input_bind_axis(pad, gp_axislv,  1, dz, cDOWN);
    input_bind_axis(pad, gp_axislh, -1, dz, cLEFT);
    input_bind_axis(pad, gp_axislh,  1, dz, cRIGHT);
}
