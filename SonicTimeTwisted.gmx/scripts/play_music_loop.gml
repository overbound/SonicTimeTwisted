///play_music_loop(song, position)
var song = argument0;
var position = argument1;
stop_all_music(false);
with objMusic {
    musicLoop = song;
    currentMusic = audio_play_sound(musicLoop,20,false);
    audio_sound_gain(currentMusic, objMusic.bgmGain, 0);
    audio_sound_set_track_position(currentMusic, position);
    state = 2;
}
