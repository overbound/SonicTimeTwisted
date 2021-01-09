///play_boss_loop(song, position)
var song = argument0;
var position = argument1;
stop_all_music(false);
with (objMusic) {
    bossLoop = audio_play_sound(song, 20, false);
    audio_sound_gain(bossLoop, bgmGain / 100, 0);
    audio_sound_set_track_position(bossLoop, position);
    state = 4;
    bossLoopAsset = song;
}
