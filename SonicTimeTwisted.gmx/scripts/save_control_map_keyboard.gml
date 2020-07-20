///save_control_map(control,inputButton)
eas_ini_open("settings.ini");
ini_write_real('keyboard_controls', argument0, round(argument1));
eas_ini_close();
