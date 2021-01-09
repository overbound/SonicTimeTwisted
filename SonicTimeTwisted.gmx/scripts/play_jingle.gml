///play_jingle(song, resume)
var song = argument0;
var resume = argument1;
with (objMusic) {
    audio_stop_sound(musicJingle);
    musicJingle = noone;
    
    if (state == 6) {
        statePrevious = 5;
        previousPosition = 0;
        musicJingle = audio_play_sound(song, 20, false);
        audio_sound_gain(musicJingle, 0, 0); // silence the jingle.
    } else if (state == 5) {
        musicJingle = audio_play_sound(song, 20, false);
        audio_sound_gain(musicJingle, bgmGain / 100, 200);
    } else {
        stop_all_music(resume);
        state = 5;
        musicJingle = audio_play_sound(song, 20, false);
        audio_sound_gain(musicJingle, bgmGain / 100, 200);
    }
    
    musicJingleAsset = song;
}

