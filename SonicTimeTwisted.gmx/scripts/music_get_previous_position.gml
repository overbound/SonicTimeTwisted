///music_get_previous_position(musicState)
var musicState = argument0;
with (objMusic) {
    switch (musicState) {
        case MUSIC_STATE.SILENCE: {
            show_debug_message("get_previous_position cannot operate with SILENCE");
            return previousPosition;
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
    }
}
