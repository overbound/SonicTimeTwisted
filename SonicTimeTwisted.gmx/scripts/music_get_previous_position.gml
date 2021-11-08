///music_get_previous_position([state])

with (objMusic) {
    var _arg_state = statePrevious;
    if (argument_count > 0) _arg_state = argument[0];
    
    switch (_arg_state) {
        case MUSIC_STATE.SILENCE: {
            if (debug_mode) {
                show_debug_message("music_get_previous_position CANNOT GET POS OF SILENCE STATE.");
                print_callstack();
            }
            return 0;
        }
        
        case MUSIC_STATE.MUSIC_INTRO: {
            return previousPositionIntro;
        }
        
        case MUSIC_STATE.MUSIC_LOOP: {
            return previousPositionLoop;
        }
        
        case MUSIC_STATE.BOSS_INTRO: {
            return previousPositionBossIntro;
        }
        
        case MUSIC_STATE.BOSS_LOOP: {
            return previousPositionBossLoop;
        }
        
        case MUSIC_STATE.JINGLE: {
            return previousPositionJingle;
        }
        
        case MUSIC_STATE.EFFECT: {
            return previousPositionEffect;
        }
        
        default: {
            show_error("MUSIC_STATE enum argument out of range.", true);
            return 0;
        }
    }
}
