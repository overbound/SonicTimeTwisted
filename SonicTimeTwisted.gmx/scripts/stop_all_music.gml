///stop_all_music(resume, stopEffects)
if (argument_count <= 0) {
    show_error("stop_all_music: Not enough arguments, expected at least one.", false);
    return false;
}

var resume = argument[0];
var stopEffects = true; if (argument_count > 1) stopEffects = argument[1];
with (objMusic) {
    if (resume) {
        statePrevious = state;
        music_set_previous_position();
    }
    else {
        statePrevious = MUSIC_STATE.SILENCE;
        music_reset_previous_position();
        queuedState = statePrevious;
    }
    state = MUSIC_STATE.SILENCE;
    
    switch (statePrevious) {
        case MUSIC_STATE.SILENCE: // silence
            stop_sound(currentMusic);
            currentMusic = -1;
            stop_sound(musicIntro);
            musicIntro = -1;
            stop_sound(musicLoop);
            musicLoop = -1;
            stop_sound(bossIntro);
            bossIntro = -1;
            stop_sound(bossLoop);
            bossLoop = -1;
            stop_sound(musicJingle);
            musicJingle = -1;
            
            if (stopEffects) {
                stop_sound(musicEffect);
                musicEffect = -1;
            }
            break;
        case MUSIC_STATE.MUSIC_INTRO: // Play Music Intro
            stop_sound(musicIntro);
            musicIntro = -1;
            break;
        case MUSIC_STATE.MUSIC_LOOP: // Play Music Loop
            stop_sound(musicLoop);
            musicLoop = -1;
            break;
        case MUSIC_STATE.BOSS_INTRO: // Play Boss Intro
            stop_sound(bossIntro);
            bossIntro = -1;
            break;
        case MUSIC_STATE.BOSS_LOOP: // Play Boss Loop
            stop_sound(bossLoop);
            bossLoop = -1;
            break;
        case MUSIC_STATE.JINGLE: // Play Jingle
            stop_sound(musicJingle);
            musicJingle = -1;
            break;
        case MUSIC_STATE.EFFECT: // Play Effect
            if (stopEffects) {
                stop_sound(musicEffect);
                musicEffect = -1;
            }
            break;
    }
}
