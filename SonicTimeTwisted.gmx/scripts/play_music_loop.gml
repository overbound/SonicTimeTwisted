///play_music_loop(song, position)
var song = argument0;
var position = argument1;
stop_all_music(false);
with (objMusic) {
    musicLoopAsset = song;
    musicLoop = audio_play_sound(musicLoopAsset, 20, false);
    audio_sound_gain(musicLoop, bgmGain / 100, 0);
    audio_sound_set_track_position(musicLoop, position);
    state = MUSIC_STATE.MUSIC_LOOP;
    currentMusic = musicLoop;
}
