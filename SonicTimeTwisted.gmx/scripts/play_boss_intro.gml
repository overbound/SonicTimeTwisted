///play_boss_intro(song, position)
var song = argument0;
var position = argument1;
stop_all_music(false);
with objMusic {
    bossIntro = song;
    currentMusic = audio_play_sound(bossIntro,20,false);
    audio_sound_set_track_position(currentMusic, position);
    state = 3;
    priorityMusicState = state;
}
