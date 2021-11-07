///play_previous(statePrevious)
var sp = argument0;
var position = music_get_previous_position(sp);
with (objMusic) {
    switch (sp) {
        case MUSIC_STATE.SILENCE: // silence
            // Do nothing.
            break;
        case MUSIC_STATE.MUSIC_INTRO: // Play Music Intro
            play_music_intro(musicIntroAsset, position);
            break;
        case MUSIC_STATE.MUSIC_LOOP: // Play Music Loop
            play_music_loop(musicLoopAsset, position);
            break;
        case MUSIC_STATE.BOSS_INTRO: // Play Boss Intro
            play_boss_intro(bossIntroAsset, position);
            break;
        case MUSIC_STATE.BOSS_LOOP: // Play Boss Loop
            play_boss_loop(bossLoopAsset, position);
            break;
        case MUSIC_STATE.JINGLE: // Play Jingle
            play_jingle(musicJingleAsset, true);
            break;
        case MUSIC_STATE.EFFECT: // Play Effect
            play_effect(musicEffectAsset, true);
            break;
    }
}
