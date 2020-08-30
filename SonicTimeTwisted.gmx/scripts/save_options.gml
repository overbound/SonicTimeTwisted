ini_open(working_directory+"\settings.ini");
if(instance_exists(objScreen))
{
    ini_write_real('video_options', "mode", objScreen.video_mode);
    ini_write_real('video_options', "flashing_reduced", objScreen.flashing_reduced);
    ini_write_real('video_options', 'score_tally_mode', objScreen.score_tally_mode);
}
if(instance_exists(objProgram.inputManager))
{
    ini_write_real('input', 'method', objProgram.inputManager.input_method);
    ini_write_real('smartphone', 'dpadmode', objProgram.inputManager.dpadmode);
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
    ini_write_real('smartphone', 'gg_mode', objProgram.inputManager.gg_mode);
    ini_write_real('smartphone', 'vibration_type', objProgram.inputManager.vibration_type);
}
ini_close();
reinit_input_method();
