///save_gamepad_input_enabled(enabled)
eas_ini_open("settings.ini");
ini_write_string('gamepad_controls', 'gamepadEnabled', string(argument0));
eas_ini_close();
