///play_boss_loop(song, position)
var song = argument0;
var position = argument1;
stop_all_music(false);
with (objMusic) {
    bossLoopAsset = song;
    bossLoop = audio_play_sound(bossLoopAsset, 20, false);
    audio_sound_gain(bossLoop, bgmGain / 100, 0);
    audio_sound_set_track_position(bossLoop, position);
    state = MUSIC_STATE.BOSS_LOOP;
    currentMusic = bossLoop;
}
