///play_boss_loop(song, position)
var song = argument0;
var position = argument1;
stop_all_music(false);
with objMusic {
    bossLoop = song;
    currentMusic = audio_play_sound(song,20,false);
    audio_sound_set_track_position(currentMusic, position);
    state = 4;
}
