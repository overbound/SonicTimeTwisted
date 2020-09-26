// argument0 - button code
// argument1 - value
ini_open("settings.ini");
ini_write_real('android_input_controls', "mode", round(android_get_input_mode()));
ini_write_string('android_input_controls', menu_fn_get_keymap_getkey(argument0), string(argument1));
ini_close();
