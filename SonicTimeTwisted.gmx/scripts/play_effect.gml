///play_effect(song, resume)
var song = argument0;
var resume = argument1;
with (objMusic) {
    if (state == 5) { // Play Jingle
        statePrevious = state;
        previousPosition = 0;
        audio_sound_gain(musicJingle, 0, 200);
    } else if (state == 6 && statePrevious == 5) { 
        audio_stop_sound(musicEffect);
        musicEffect = noone;
    } else {
        stop_all_music(resume);
    }
    state = 6;
    musicEffect = audio_play_sound(song, 20, false);
    audio_sound_gain(musicEffect, bgmGain / 100, 0);
    // because effects stop currentMusic, they should respect the BGM gain.
    musicEffectAsset = -1;
}
