///play_boss_intro(song, position)
var song = argument0;
var position = argument1;
stop_all_music(false);
with (objMusic) {
    bossIntroAsset = song;
    bossIntro = audio_play_sound(bossIntroAsset, 20, false);
    audio_sound_gain(bossIntro, bgmGain / 100, 0);
    audio_sound_set_track_position(bossIntro, position);
    state = MUSIC_STATE.BOSS_INTRO;
    priorityMusicState = state;
    currentMusic = bossIntro;
}
