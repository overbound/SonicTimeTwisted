// argument0 - button code
// argument1 - value
stt_ini_open("settings.ini");

ini_write_real('android_input_controls', "mode", round(sttandroid_mode_get()));

var configValue = string(sttandroid_gamepad_swmap_get_both(0, cUP));
ini_write_string('android_gamepad_controls', menu_fn_get_keymap_getkey(cUP), configValue);
show_debug_message("SAVE GAMEPAD INPUT: UP <- "+configValue);

configValue = string(sttandroid_gamepad_swmap_get_both(0, cDOWN));
ini_write_string('android_gamepad_controls', menu_fn_get_keymap_getkey(cDOWN), configValue);
show_debug_message("SAVE GAMEPAD INPUT: DOWN <- "+configValue);

configValue = string(sttandroid_gamepad_swmap_get_both(0, cLEFT));
ini_write_string('android_gamepad_controls', menu_fn_get_keymap_getkey(cLEFT), configValue);
show_debug_message("SAVE GAMEPAD INPUT: LEFT <- "+configValue);

configValue = string(sttandroid_gamepad_swmap_get_both(0, cRIGHT));
ini_write_string('android_gamepad_controls', menu_fn_get_keymap_getkey(cRIGHT), configValue);
show_debug_message("SAVE GAMEPAD INPUT: RIGHT <- "+configValue);

configValue = string(sttandroid_gamepad_swmap_get_both(0, cA));
ini_write_string('android_gamepad_controls', menu_fn_get_keymap_getkey(cA), configValue);
show_debug_message("SAVE GAMEPAD INPUT: A <- "+configValue);

configValue = string(sttandroid_gamepad_swmap_get_both(0, cB));
ini_write_string('android_gamepad_controls', menu_fn_get_keymap_getkey(cB), configValue);
show_debug_message("SAVE GAMEPAD INPUT: B <- "+configValue);

configValue = string(sttandroid_gamepad_swmap_get_both(0, cC));
ini_write_string('android_gamepad_controls', menu_fn_get_keymap_getkey(cC), configValue);
show_debug_message("SAVE GAMEPAD INPUT: C <- "+configValue);

configValue = string(sttandroid_gamepad_swmap_get_both(0, cSTART));
ini_write_string('android_gamepad_controls', menu_fn_get_keymap_getkey(cSTART), configValue);
show_debug_message("SAVE GAMEPAD INPUT: START <- "+configValue);





configValue = string(sttandroid_keyboard_swmap_get_both(0, cUP));
ini_write_string('android_keyboard_controls', menu_fn_get_keymap_getkey(cUP), configValue);
show_debug_message("SAVE KEYBOARD INPUT: UP <- "+configValue);

configValue = string(sttandroid_keyboard_swmap_get_both(0, cDOWN));
ini_write_string('android_keyboard_controls', menu_fn_get_keymap_getkey(cDOWN), configValue);
show_debug_message("SAVE KEYBOARD INPUT: DOWN <- "+configValue);

configValue = string(sttandroid_keyboard_swmap_get_both(0, cLEFT));
ini_write_string('android_keyboard_controls', menu_fn_get_keymap_getkey(cLEFT), configValue);
show_debug_message("SAVE KEYBOARD INPUT: LEFT <- "+configValue);

configValue = string(sttandroid_keyboard_swmap_get_both(0, cRIGHT));
ini_write_string('android_keyboard_controls', menu_fn_get_keymap_getkey(cRIGHT), configValue);
show_debug_message("SAVE KEYBOARD INPUT: RIGHT <- "+configValue);

configValue = string(sttandroid_keyboard_swmap_get_both(0, cA));
ini_write_string('android_keyboard_controls', menu_fn_get_keymap_getkey(cA), configValue);
show_debug_message("SAVE KEYBOARD INPUT: A <- "+configValue);

configValue = string(sttandroid_keyboard_swmap_get_both(0, cB));
ini_write_string('android_keyboard_controls', menu_fn_get_keymap_getkey(cB), configValue);
show_debug_message("SAVE KEYBOARD INPUT: B <- "+configValue);

configValue = string(sttandroid_keyboard_swmap_get_both(0, cC));
ini_write_string('android_keyboard_controls', menu_fn_get_keymap_getkey(cC), configValue);
show_debug_message("SAVE KEYBOARD INPUT: C <- "+configValue);

configValue = string(sttandroid_keyboard_swmap_get_both(0, cSTART));
ini_write_string('android_keyboard_controls', menu_fn_get_keymap_getkey(cSTART), configValue);
show_debug_message("SAVE KEYBOARD INPUT: START <- "+configValue);

stt_ini_close();

