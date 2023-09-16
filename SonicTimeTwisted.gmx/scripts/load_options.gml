var file = "settings.ini";
if (stt_file_exists(file)) {
    stt_ini_open(file);
    
    with(objScreen)
    {
        if (objProgram.device_info & DEVICE_TYPE_COMPUTER) {
            video_mode = ini_read_real('video_options', "mode", 2);
        } else {
            video_mode = ini_read_real('video_options', "mode", 0);
        }
        interpolation = ini_read_real('video_options', "interpolation", 0);
        flashing_reduced = ini_read_real('video_options', "flashing_reduced", 1);
        score_tally_mode = ini_read_real('video_options', "score_tally_mode", 0);
        vsync = ini_read_real('video_options', "vsync", true);
        timer_mode = ini_read_real('video_options', "timer_mode", 0);
        show_shield = ini_read_real('video_options', "show_shield", 1);
        var this_fmt = ini_read_real('video_options', "format_version", options_format_none);
        if (this_fmt == options_format_none) {
            /* need to convert videomode */
            switch (video_mode) {
                /* window 1x (very tiny) */
                case 0: video_mode = 1; break;
                /* window 2x (default) */
                default:
                case 1: video_mode = 2; break;
                /* window 3x */
                case 2: video_mode = 3; break;
                /* fullscreen */
                case 3:
                case 4: video_mode = 0; break;
            }
            
            show_debug_message("Upgrading video settings from old format...");
        }
        
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
        set_input_method(input_method, false);
        
        rumble_enabled = ini_read_real('input', 'rumble', false);
        
        if (rumble_enabled)
            input_rumble_trigger_script = rumble_manage;
        else
            input_rumble_trigger_script = input_method_dummy_script;
            
        deadzone_int = ini_read_real('input','deadzone',30);
        deadzone = deadzone_int/100;
    }
    
    with (objMusic)
    {
        sfxGain = ini_read_real('sound_settings', "sfx_volume", 100);
        bgmGain = ini_read_real('sound_settings', "bgm_volume", 100);
        masterGain = ini_read_real('sound_settings', "master_volume", 75);
        event_user(0);
    }
    
    global.TR_lang = ini_read_string('localization', "language", "en");
    if (!ds_map_exists(global.TR_map, global.TR_lang)) global.TR_lang = "en";
    stt_ini_close();
    return true;
}
return false;
