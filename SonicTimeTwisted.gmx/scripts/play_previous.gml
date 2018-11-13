///play_previous(statePrevious,position);
var sp = argument0;
with objMusic {
    switch sp {
    case 0: // silence
    
        break;
    case 1: // Play Music Intro
        play_music_intro(musicIntro,argument1);
        break;
    case 2: // Play Music Loop
        play_music_loop(musicLoop,argument1);
        break;
    case 3: // Play Boss Intro
        play_boss_intro(bossIntro,argument1);
        break;
    case 4: // Play Boss Loop
        play_boss_loop(bossLoop,argument1);
        break;
    case 5: // Play Jingle
        play_jingle(musicJingle,true);
        break;
    case 6: // Play Effect
        play_effect(musicEffect,true);
        break;
    }
}
