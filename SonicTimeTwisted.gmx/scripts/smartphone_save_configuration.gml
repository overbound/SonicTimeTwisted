//smartphone_save_configuration()

ini_open("settings.ini");
ini_write_real('smartphone', 'hudmode', objAndroid.hudmode);
ini_write_real('smartphone', 'input', objAndroid.input);
ini_close();

