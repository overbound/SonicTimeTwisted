//save_control_map(control,inputButton)
ini_open("settings.ini");
ini_write_string('gamepad_controls', string(argument0), string(argument1));
ini_close();
