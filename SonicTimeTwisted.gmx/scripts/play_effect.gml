///play_effect(song, resume)
var song = argument0;
var resume = argument1;
with (objMusic) {
    // GitHub #126 "Jingles conflict"
    if (state != MUSIC_STATE.JINGLE
    &&  state != MUSIC_STATE.EFFECT) {
        priorityMusicState = state;
        show_debug_message("priorityMusicState = " + string(priorityMusicState));
    }
    
    if (state == MUSIC_STATE.JINGLE) {
        statePrevious = state;
        previousPosition = 0;
        audio_sound_gain(musicJingle, 0, 200);
    } else if (state == MUSIC_STATE.JINGLE && statePrevious == MUSIC_STATE.EFFECT) { 
        stop_sound(musicEffect);
        musicEffect = -1;
        musicEffectAsset = -1;
    } else {
        stop_all_music(resume);
    }
    
    musicEffectAsset = song;
    musicEffect = audio_play_sound(musicEffectAsset, 20, false);
    audio_sound_gain(musicEffect, bgmGain / 100, 0);
    // because effects stop currentMusic, they should respect the BGM gain.
    state = MUSIC_STATE.EFFECT;
    currentMusic = musicEffect;
}
