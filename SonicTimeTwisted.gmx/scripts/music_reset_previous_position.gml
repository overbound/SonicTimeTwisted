///music_reset_previous_position(musicState)
var musicState = argument0;
with (objMusic) {
    switch (musicState) {
        case MUSIC_STATE.SILENCE: {
            show_debug_message("reset_previous_position resetting for ALL");
            print_callstack();
            previousPosition = 0;
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
    }
}
