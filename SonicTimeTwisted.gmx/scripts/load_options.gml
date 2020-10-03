var file = "settings.ini";
if (stt_file_exists(file)) {
    stt_ini_open(file);
    
    with(objScreen)
    {
        video_mode = ini_read_real('video_options', "mode", 0);
        flashing_reduced = ini_read_real('video_options', "flashing_reduced", 1);
        score_tally_mode = ini_read_real('video_options', "score_tally_mode", 0);
        vsync = ini_read_real('video_options', "vsync", true);
        
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
        
        rumble_enabled = ini_read_real('input', 'rumble', false);
        
        if (rumble_enabled)
            input_rumble_trigger_script = rumble_manage;
        else
            input_rumble_trigger_script = input_method_dummy_script;
    }
    global.TR_lang = ini_read_string('localization', "language", "en");
    if (!ds_map_exists(global.TR_map, global.TR_lang)) global.TR_lang = "en";
    stt_ini_close();
    return true;
}
return false;
