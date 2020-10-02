//save_control_map(control,inputButton)
stt_ini_open("settings.ini");
ini_write_real('keyboard_controls', argument0, round(argument1));
stt_ini_close();
