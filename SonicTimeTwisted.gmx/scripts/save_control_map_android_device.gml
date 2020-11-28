// argument0 - button code
// argument1 - value
stt_ini_open("settings.ini");

ini_write_real('android_input_controls', "mode", round(android_get_input_mode()));
var configValue = string(android_get_mapped_configuration(0, argument0));
ini_write_string('android_input_controls', menu_fn_get_keymap_getkey(argument0), configValue);
stt_ini_close();

show_debug_message("SAVE INPUT: "+menu_fn_get_keymap_getkey(argument0)+" -> "+configValue);
