stt_ini_open("settings.ini");
if(instance_exists(objScreen))
{
    ini_write_real('video_options', "mode", objScreen.video_mode);
    ini_write_real('video_options', 'interpolation', objScreen.interpolation);
    ini_write_real('video_options', "flashing_reduced", objScreen.flashing_reduced);
    ini_write_real('video_options', 'score_tally_mode', objScreen.score_tally_mode);
    ini_write_real('video_options', "vsync", objScreen.vsync);
    ini_write_real('video_options', "timer_mode", objScreen.timer_mode);
    ini_write_real('video_options', "show_shield", objScreen.show_shield);
    ini_write_real('video_options', "format_version", objScreen.options_format);
}
if(instance_exists(objProgram.inputManager))
{
    ini_write_real('input', 'method', objProgram.inputManager.input_method);
    ini_write_real('input', 'rumble', objProgram.inputManager.rumble_enabled);
    ini_write_real('input', 'deadzone', objProgram.inputManager.deadzone_int);
    ini_write_real('input', 'analog_in_zones', objProgram.inputManager.gpanalog_in_zones);
    ini_write_real('input', 'analog_in_ss', objProgram.inputManager.gpanalog_in_ss);
    ini_write_real('input', 'analog_in_gg', objProgram.inputManager.gpanalog_in_gg);
    ini_write_real('input', 'analog_deadzone_min', objProgram.inputManager.gpanalog_deadzone_min);
    ini_write_real('input', 'analog_deadzone_max', objProgram.inputManager.gpanalog_deadzone_max);
    ini_write_real('input', 'analog_ss_min_angle', objProgram.inputManager.gpanalog_ss_min_angle);
    ini_write_real('input', 'analog_ss_max_angle', objProgram.inputManager.gpanalog_ss_max_angle);
    ini_write_real('smartphone', 'dpadmode', objProgram.inputManager.dpadmode);
    ini_write_real('smartphone', 'vkalpha', objProgram.inputManager.vkalpha);
    ini_write_real('smartphone', 'gyroinss', objProgram.inputManager.gyroinss);
    ini_write_real('smartphone', 'gyroinss_axis', objProgram.inputManager.gyroinss_axis);
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
    ini_write_real('smartphone', 'haptics_strength', objProgram.inputManager.haptics_strength);
    ini_write_real('smartphone', 'haptics_duration', objProgram.inputManager.haptics_duration);
    ini_write_real('smartphone', 'rumble_strength', objProgram.inputManager.rumble_strength);
    ini_write_real('smartphone', 'vkdeadzone', objProgram.inputManager.vkdeadzone);
    ini_write_real('smartphone', 'vkdeadzoness', objProgram.inputManager.vkdeadzoness);
    ini_write_real('smartphone', 'vkdetection', objProgram.inputManager.vkdetection);
    ini_write_real('smartphone', 'touchanalog_in_zones', objProgram.inputManager.touchanalog_in_zones);
    ini_write_real('smartphone', 'touchanalog_in_ss', objProgram.inputManager.touchanalog_in_ss);
    ini_write_real('smartphone', 'touchanalog_in_gg', objProgram.inputManager.touchanalog_in_gg);
    ini_write_real('smartphone', 'touchanalog_deadzone_min', objProgram.inputManager.touchanalog_deadzone_min);
    ini_write_real('smartphone', 'touchanalog_deadzone_max', objProgram.inputManager.touchanalog_deadzone_max);
    ini_write_real('smartphone', 'touchanalog_ss_min_angle', objProgram.inputManager.touchanalog_ss_min_angle);
    ini_write_real('smartphone', 'touchanalog_ss_max_angle', objProgram.inputManager.touchanalog_ss_max_angle);
}
if (instance_exists(objMusic))
{
    ini_write_real('sound_settings', "sfx_volume", objMusic.sfxGain);
    ini_write_real('sound_settings', "bgm_volume", objMusic.bgmGain);
    ini_write_real('sound_settings', "master_volume", objMusic.masterGain);
}
ini_write_string('localization', "language", global.TR_lang);
stt_ini_close();
stt_save_files();
reinit_input_method();
