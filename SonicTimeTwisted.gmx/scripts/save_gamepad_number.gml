//save_control_map(padNumber)
ini_open(working_directory+"\settings.ini");
ini_write_real('gamepad_controls', 'padnumber', round(argument0));
ini_close();
