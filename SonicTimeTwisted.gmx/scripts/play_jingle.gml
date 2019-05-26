///play_jingle(song, resume)
var song = argument0;
var resume = argument1;
with objMusic {
    audio_stop_sound(musicJingle);
    musicJingle = song;
    
    if state == 6 {
        audio_play_sound(musicJingle,20,false);
        audio_sound_gain(musicJingle, 0, 0);
        statePrevious = 5;
        previousPosition = 0;
    } else if state == 5 {
        currentMusic=audio_play_sound(musicJingle,20,false);
        audio_sound_gain(musicJingle, 1, 200);
      } else {
        stop_all_music(resume);
        currentMusic=audio_play_sound(musicJingle,20,false);
        audio_sound_gain(musicJingle, 1, 200);
        state = 5;
    }
}

