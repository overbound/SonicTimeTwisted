///music_reset_previous_position([state])

with (objMusic) {
    var _arg_state = statePrevious;
    if (argument_count > 0) _arg_state = argument[0];
    
    switch (_arg_state) {
        case MUSIC_STATE.SILENCE: {
            previousPositionIntro = 0;
            previousPositionLoop = 0;
            previousPositionBossIntro = 0;
            previousPositionBossLoop = 0;
            previousPositionJingle = 0;
            previousPositionEffect = 0;
            break;
        }
        
        case MUSIC_STATE.MUSIC_INTRO: {
            previousPositionIntro = 0;
            break;
        }
        
        case MUSIC_STATE.MUSIC_LOOP: {
            previousPositionLoop = 0;
            break;
        }
        
        case MUSIC_STATE.BOSS_INTRO: {
            previousPositionBossIntro = 0;
            break;
        }
        
        case MUSIC_STATE.BOSS_LOOP: {
            previousPositionBossLoop = 0;
            break;
        }
        
        case MUSIC_STATE.JINGLE: {
            previousPositionJingle = 0;
            break;
        }
        
        case MUSIC_STATE.EFFECT: {
            previousPositionEffect = 0;
            break;
        }
        
        default: {
            show_error("MUSIC_STATE enum argument out of range.", true);
            break;
        }
    }
}

