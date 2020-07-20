eas_ini_open("settings.ini");
ini_write_string('video_options', "mode", string(objScreen.video_mode));
ini_write_string('video_options', "30fps", string(objScreen.framerate));
eas_ini_close();
