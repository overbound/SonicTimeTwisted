///play_music_loop(song, position)
var song = argument0;
var position = argument1;
stop_all_music(false);
with (objMusic) {
    musicLoop = audio_play_sound(song, 20, false);
    audio_sound_gain(musicLoop, bgmGain / 100, 0);
    audio_sound_set_track_position(musicLoop, position);
    state = 2;
    musicLoopAsset = song;
}
