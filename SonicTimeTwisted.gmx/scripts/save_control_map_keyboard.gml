//save_control_map(control,inputButton)
ini_open(working_directory+"\settings.ini");
ini_write_real('keyboard_controls', argument0, round(argument1));
ini_close();
