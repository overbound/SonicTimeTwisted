eas_ini_open("settings.ini");
objScreen.video_mode = real(ini_read_string('video_options', "mode", "0"));
objScreen.framerate = real(ini_read_string('video_options', "30fps", "0"));
ini_write_string('video_options', "mode", string(objScreen.video_mode));
eas_ini_close();
