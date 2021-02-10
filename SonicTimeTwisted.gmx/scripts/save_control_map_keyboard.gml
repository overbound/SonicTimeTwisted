//save_control_map()
stt_ini_open("settings.ini");

ini_write_string('keyboard_controls', menu_fn_get_keymap_getkey(cUP), get_control_map_keyboard_value(cUP));
ini_write_string('keyboard_controls', menu_fn_get_keymap_getkey(cDOWN), get_control_map_keyboard_value(cDOWN));
ini_write_string('keyboard_controls', menu_fn_get_keymap_getkey(cLEFT), get_control_map_keyboard_value(cLEFT));
ini_write_string('keyboard_controls', menu_fn_get_keymap_getkey(cRIGHT), get_control_map_keyboard_value(cRIGHT));
ini_write_string('keyboard_controls', menu_fn_get_keymap_getkey(cA), get_control_map_keyboard_value(cA));
ini_write_string('keyboard_controls', menu_fn_get_keymap_getkey(cB), get_control_map_keyboard_value(cB));
ini_write_string('keyboard_controls', menu_fn_get_keymap_getkey(cC), get_control_map_keyboard_value(cC));
ini_write_string('keyboard_controls', menu_fn_get_keymap_getkey(cSTART), get_control_map_keyboard_value(cSTART));

stt_ini_close();
