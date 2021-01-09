///play_previous(statePrevious,position);
var sp = argument0;
var prevpos = argument1;
with (objMusic) {
    switch (sp) {
        case 0: // Silence
            // TODO: figure out why.
            // show_debug_message("play_previous: trying to play silence?!");
            break;
        case 1: // Play Music Intro
            play_music_intro(musicIntroAsset, prevpos);
            break;
        case 2: // Play Music Loop
            play_music_loop(musicLoopAsset, prevpos);
            break;
        case 3: // Play Boss Intro
            play_boss_intro(bossIntroAsset, prevpos);
            break;
        case 4: // Play Boss Loop
            play_boss_loop(bossLoopAsset, prevpos);
            break;
        case 5: // Play Jingle
            play_jingle(musicJingleAsset, true);
            break;
        case 6: // Play Effect
            play_effect(musicEffectAsset, true);
            break;
    }
}
