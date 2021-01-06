///play_effect(song, resume)
var song = argument0;
var resume = argument1;
with objMusic {
    if state == 5 {
        statePrevious = state;
        previousPosition = 0;
        audio_sound_gain(musicJingle, 0, 200);
    } else if state == 6 && statePrevious == 5 { 
        audio_stop_sound(musicEffect);
    } else {
        stop_all_music(resume);
    }
    musicEffect = song;
    state = 6;
    currentMusic = audio_play_sound(musicEffect,20,false);
    audio_sound_gain(currentMusic, objMusic.bgmGain / 100, 0);
    // because effects stop currentMusic, they should respect the BGM gain.
}
