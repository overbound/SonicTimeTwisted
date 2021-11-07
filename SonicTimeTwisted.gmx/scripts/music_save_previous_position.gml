///music_save_previous_position(musicState)
var musicState = argument0;
with (objMusic) {
    switch (musicState) {
        case MUSIC_STATE.SILENCE: {
            previousPosition = 0;
            show_debug_message("save_previous_position cannot operate with SILENCE");
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
    }
}
