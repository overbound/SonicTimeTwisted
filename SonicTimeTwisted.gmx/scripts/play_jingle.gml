///play_jingle(song, resume)
var song = argument0;
var resume = argument1;
with (objMusic) {
    stop_sound(musicJingle);
    musicJingle = -1;
    musicJingleAsset = song;
    
    if (state == MUSIC_STATE.EFFECT) {
        if (resume && statePrevious != MUSIC_STATE.EFFECT && statePrevious != MUSIC_STATE.JINGLE) {
            queuedState = statePrevious;
        }
        
        musicJingle = audio_play_sound(musicJingleAsset, 20, false);
        audio_sound_gain(musicJingle, 0, 0);
        statePrevious = MUSIC_STATE.JINGLE;
        music_reset_previous_position();
    } else if (state == MUSIC_STATE.JINGLE) {
        musicJingle = audio_play_sound(musicJingleAsset, 20, false);
        audio_sound_gain(musicJingle, bgmGain / 100, 200);
        currentMusic = musicJingle;
    } else {
        stop_all_music(resume);
        musicJingle = audio_play_sound(musicJingleAsset, 20, false);
        audio_sound_gain(musicJingle, bgmGain / 100, 200);
        state = MUSIC_STATE.JINGLE;
        currentMusic = musicJingle;
    }
}

