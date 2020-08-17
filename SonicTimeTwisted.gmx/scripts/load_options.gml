var file = working_directory+"\settings.ini";
if (file_exists(file)) {
    ini_open(file);
    
    with(objScreen)
    {
        video_mode = ini_read_real('video_options', "mode", 0);
        flashing_reduced = ini_read_real('video_options', "flashing_reduced", 1);
        score_tally_mode = ini_read_real('video_options', "score_tally_mode", 0);
        
        // apply settings
        apply_video_settings();
    }
    
    with(objProgram.inputManager)
    {
        input_method = ini_read_real('input','method',-1);
        if(input_method == -1)
        {
            input_method = input_method_fallback;
        }
        dpadmode = ini_read_real('smartphone','dpadmode',0);
        vkalpha = ini_read_real('smartphone','vkalpha',0.8);
        gyroinss = ini_read_real('smartphone','gyroinss',1);
        vksize = ini_read_real('smartphone','vksize',0);
        dpadx = ini_read_real('smartphone','dpadx',64);
        dpady = ini_read_real('smartphone','dpady',178);
        bax = ini_read_real('smartphone','bax',364);
        bay = ini_read_real('smartphone','bay',178);
        bsx = ini_read_real('smartphone','bsx',200);
        bsy = ini_read_real('smartphone','bsy',16);
        bbx = ini_read_real('smartphone','bbx',324);
        bby = ini_read_real('smartphone','bby',88);
        gyromode = ini_read_real('smartphone','gyromode',1);
        gyro_switch_on_angle_x = ini_read_real('smartphone','gyro_switch_on_angle_x',0.15);
        gyro_analog_start_x = ini_read_real('smartphone','gyro_analog_start_x',0.1);
        gyro_analog_end_x = ini_read_real('smartphone','gyro_analog_end_x',0.6);
        gg_mode = ini_read_real('smartphone','gg_mode',1);
    }
    
    return true;
}
return false;
