///music_set_previous_position([state])

with (objMusic) {
    var _arg_state = statePrevious;
    if (argument_count > 0) _arg_state = argument[0];
    
    switch (_arg_state) {
        case MUSIC_STATE.SILENCE: {
            if (debug_mode) {
                show_debug_message("music_set_previous_position CANNOT GET POS OF SILENCE STATE.");
                print_callstack();
            }
            break;
        }
        
        case MUSIC_STATE.MUSIC_INTRO: {
            previousPositionIntro = audio_sound_get_track_position(musicIntro);
            break;
        }
        
        case MUSIC_STATE.MUSIC_LOOP: {
            previousPositionLoop = audio_sound_get_track_position(musicLoop);
            break;
        }
        
        case MUSIC_STATE.BOSS_INTRO: {
            previousPositionBossIntro = audio_sound_get_track_position(bossIntro);
            break;
        }
        
        case MUSIC_STATE.BOSS_LOOP: {
            previousPositionBossLoop = audio_sound_get_track_position(bossLoop);
            break;
        }
        
        case MUSIC_STATE.JINGLE: {
            previousPositionJingle = audio_sound_get_track_position(musicJingle);
            break;
        }
        
        case MUSIC_STATE.EFFECT: {
            previousPositionEffect = audio_sound_get_track_position(musicEffect);
            break;
        }
        
        default: {
            show_error("MUSIC_STATE enum argument out of range.", true);
            break;
        }
    }
}
