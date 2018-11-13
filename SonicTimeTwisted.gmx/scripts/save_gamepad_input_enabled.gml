//save_gamepad_input_enabled(enabled)
ini_open(working_directory+"\settings.ini");
ini_write_string('gamepad_controls', 'gamepadEnabled', string(argument0));
ini_close();
