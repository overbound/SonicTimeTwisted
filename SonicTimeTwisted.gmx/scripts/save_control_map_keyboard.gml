//save_control_map()
stt_ini_open("settings.ini");

var label, setting_to_save;
label = menu_fn_get_keymap_getkey(cUP);
setting_to_save = get_control_map_keyboard_value(cUP);
ini_write_string('keyboard_controls', label, setting_to_save);

label = menu_fn_get_keymap_getkey(cDOWN);
setting_to_save = get_control_map_keyboard_value(cDOWN);
ini_write_string('keyboard_controls', label, setting_to_save);

label = menu_fn_get_keymap_getkey(cLEFT);
setting_to_save = get_control_map_keyboard_value(cLEFT);
ini_write_string('keyboard_controls', label, setting_to_save);

label = menu_fn_get_keymap_getkey(cRIGHT);
setting_to_save = get_control_map_keyboard_value(cRIGHT);
ini_write_string('keyboard_controls', label, setting_to_save);

label = menu_fn_get_keymap_getkey(cA);
setting_to_save = get_control_map_keyboard_value(cA);
ini_write_string('keyboard_controls', label, setting_to_save);

label = menu_fn_get_keymap_getkey(cB);
setting_to_save = get_control_map_keyboard_value(cB);
ini_write_string('keyboard_controls', label, setting_to_save);

label = menu_fn_get_keymap_getkey(cC);
setting_to_save = get_control_map_keyboard_value(cC);
ini_write_string('keyboard_controls', label, setting_to_save);

label = menu_fn_get_keymap_getkey(cSTART);
setting_to_save = get_control_map_keyboard_value(cSTART);
ini_write_string('keyboard_controls', label, setting_to_save);

stt_ini_close();
