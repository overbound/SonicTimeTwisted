//smartphone_save_configuration()

ini_open("settings.ini");
ini_write_real('smartphone', 'dpadmode', objProgram.inputManager.dpadMode);
ini_write_real('smartphone', 'input', objProgram.inputManager.input);
ini_write_real('smartphone', 'vkalpha', objProgram.inputManager.vkalpha);
ini_write_real('smartphone', 'gyroinss', objProgram.inputManager.gyroinss);
ini_write_real('smartphone', 'vksize', objProgram.inputManager.vksize);
ini_write_real('smartphone', 'dpadx', objProgram.inputManager.dpadx);
ini_write_real('smartphone', 'dpady', objProgram.inputManager.dpady);
ini_write_real('smartphone', 'bax', objProgram.inputManager.bax);
ini_write_real('smartphone', 'bay', objProgram.inputManager.bay);
ini_write_real('smartphone', 'bsx', objProgram.inputManager.bsx);
ini_write_real('smartphone', 'bsy', objProgram.inputManager.bsy);
ini_write_real('smartphone', 'bbx', objProgram.inputManager.bbx);
ini_write_real('smartphone', 'bby', objProgram.inputManager.bby);
ini_write_real('smartphone', 'gyromode', objProgram.inputManager.gyromode);
ini_write_real('smartphone', 'gyro_switch_on_angle_x', objProgram.inputManager.gyro_switch_on_angle_x);
ini_write_real('smartphone', 'gyro_analog_start_x', objProgram.inputManager.gyro_analog_start_x);
ini_write_real('smartphone', 'gyro_analog_end_x', objProgram.inputManager.gyro_analog_end_x);
ini_write_real('smartphone', 'gyro_switch_on_angle_y', objProgram.inputManager.gyro_switch_on_angle_y);
ini_write_real('smartphone', 'gyro_analog_start_y', objProgram.inputManager.gyro_analog_start_y);
ini_write_real('smartphone', 'gyro_analog_end_y', objProgram.inputManager.gyro_analog_end_y);
ini_write_real('smartphone', 'gg_mode', objProgram.inputManager.gg_mode);
ini_close();

