ini_open(working_directory+"\settings.ini");
ini_write_string('video_options', "mode", string(objScreen.video_mode));
ini_write_string('video_options', "30fps", string(objScreen.framerate));
ini_close();

