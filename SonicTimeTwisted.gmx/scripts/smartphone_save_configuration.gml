//smartphone_save_configuration()

ini_open("settings.ini");
ini_write_real('smartphone', 'dpadmode', objAndroidInput.dpadMode);
ini_write_real('smartphone', 'input', objAndroidInput.input);
ini_write_real('smartphone', 'vkalpha', objAndroidInput.vkalpha);
ini_write_real('smartphone', 'gyroinss', objAndroidInput.gyroinss);
ini_write_real('smartphone', 'vksize', objAndroidInput.vksize);
ini_write_real('smartphone', 'dpadx', objAndroidInput.dpadx);
ini_write_real('smartphone', 'dpady', objAndroidInput.dpady);
ini_write_real('smartphone', 'bax', objAndroidInput.bax);
ini_write_real('smartphone', 'bay', objAndroidInput.bay);
ini_write_real('smartphone', 'bsx', objAndroidInput.bsx);
ini_write_real('smartphone', 'bsy', objAndroidInput.bsy);
ini_write_real('smartphone', 'bbx', objAndroidInput.bbx);
ini_write_real('smartphone', 'bby', objAndroidInput.bby);
ini_write_real('smartphone', 'gyromode', objAndroidInput.gyromode);
ini_write_real('smartphone', 'gyro_switch_on_angle', objAndroidInput.gyro_switch_on_angle);
ini_write_real('smartphone', 'gyro_analog_start', objAndroidInput.gyro_analog_start);
ini_write_real('smartphone', 'gyro_analog_end', objAndroidInput.gyro_analog_end);
ini_close();

