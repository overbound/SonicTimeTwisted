//save_control_map(control,inputButton)
ini_open("settings.ini");
ini_write_real('keyboard_controls', argument0, round(argument1));
ini_close();
