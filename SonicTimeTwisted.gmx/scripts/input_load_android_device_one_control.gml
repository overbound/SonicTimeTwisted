
var value = ini_read_string('android_input_controls', menu_fn_get_keymap_getkey(argument0), argument1);

show_debug_message("LOAD INPUT: "+string(argument0)+" -> "+string(value));
android_set_mapped_configuration(0, argument0, value);



