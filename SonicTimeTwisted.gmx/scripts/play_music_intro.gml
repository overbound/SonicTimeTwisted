///play_music_intro(song, position)
var song = argument0;
var position = argument1;
stop_all_music(false);
with objMusic {
    musicIntro = song;
    currentMusic = audio_play_sound(musicIntro,20,false);
    audio_sound_set_track_position(currentMusic, position);
    state = 1;
    priorityMusicState = state;
}
