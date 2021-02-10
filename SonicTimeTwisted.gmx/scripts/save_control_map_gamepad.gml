//save_control_map_gamepad()
stt_ini_open("settings.ini");

ini_write_string('gamepad_controls', menu_fn_get_keymap_getkey(cUP), get_control_map_gamepad_value(cUP));
ini_write_string('gamepad_controls', menu_fn_get_keymap_getkey(cDOWN), get_control_map_gamepad_value(cDOWN));
ini_write_string('gamepad_controls', menu_fn_get_keymap_getkey(cLEFT), get_control_map_gamepad_value(cLEFT));
ini_write_string('gamepad_controls', menu_fn_get_keymap_getkey(cRIGHT), get_control_map_gamepad_value(cRIGHT));
ini_write_string('gamepad_controls', menu_fn_get_keymap_getkey(cA), get_control_map_gamepad_value(cA));
ini_write_string('gamepad_controls', menu_fn_get_keymap_getkey(cB), get_control_map_gamepad_value(cB));
ini_write_string('gamepad_controls', menu_fn_get_keymap_getkey(cC), get_control_map_gamepad_value(cC));
ini_write_string('gamepad_controls', menu_fn_get_keymap_getkey(cSTART), get_control_map_gamepad_value(cSTART));

stt_ini_close();
