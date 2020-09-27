var file = "settings.ini";
if (file_exists(file)) {
    ini_open(file);
    
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

    }
    global.TR_lang = ini_read_string('localization', "language", "en");
    ini_close();
    return true;
}
return false;
