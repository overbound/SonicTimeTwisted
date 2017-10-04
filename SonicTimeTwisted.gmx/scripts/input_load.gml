// input_load()

key_count = 0;
button_count = 0;
axis_count = 0;

var file = 'settings.ini';

if (file_exists(file)) {
    ini_open(file);
    pad = round(ini_read_real('gamepad_controls','padnumber', 0));
    
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
    input_bind_button(pad, round(ini_read_real('gamepad_controls','a',0)), cA);
    input_bind_button(pad, round(ini_read_real('gamepad_controls','b',1)), cB);
    input_bind_button(pad, round(ini_read_real('gamepad_controls','c',2)), cC);
    input_bind_button(pad, round(ini_read_real('gamepad_controls','start',7)), cSTART);
   
    if (string_pos('+',ini_read_string('gamepad_controls','up',6)) or string_pos('-',ini_read_string('gamepad_controls','up',6))) {
        input_bind_axis(pad, abs(round(real(ini_read_string('gamepad_controls','up',6)))),1*sign(real(ini_read_string('gamepad_controls','up',6))),.3, cUP);
    } else {
        input_bind_button(pad, round(real(ini_read_string('gamepad_controls','up',6))), cUP);
    }
    
    if (string_pos('+',ini_read_string('gamepad_controls','down',-6)) or string_pos('-',ini_read_string('gamepad_controls','down',-6))) {
        input_bind_axis(pad, abs(round(real(ini_read_string('gamepad_controls','down',-6)))),1*sign(real(ini_read_string('gamepad_controls','down',-6))),.3,  cDOWN);
    } else {
        input_bind_button(pad, round(real(ini_read_string('gamepad_controls', 'down', -6))), cDOWN);
    }
    
    if (string_pos('+',ini_read_string('gamepad_controls','left',-7)) or string_pos('-',ini_read_string('gamepad_controls','left',-7))) {
        input_bind_axis(pad, abs(round(real(ini_read_string('gamepad_controls','left',-7)))),1*sign(real(ini_read_string('gamepad_controls','left',-7))),.3,  cLEFT);
    } else {
        input_bind_button(pad, round(real(ini_read_string('gamepad_controls','left',-7))), cLEFT);
    }
    
    if (string_pos('+',ini_read_string('gamepad_controls','right',7)) or string_pos('-',ini_read_string('gamepad_controls','right',7))) {
        input_bind_axis(pad, abs(round(real(ini_read_string('gamepad_controls','right',7)))),1*sign(real(ini_read_string('gamepad_controls','right',7))),.3,  cRIGHT);
    } else {
        input_bind_button(pad, round(real(ini_read_string('gamepad_controls','right',7))), cRIGHT);
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
    
    input_bind_key(vk_enter, cSTART);
}
