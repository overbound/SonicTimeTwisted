// player_get_shield(kind)

// remove previous shield
if shield_type!=argument0 with shield instance_destroy();

// create new shield
switch argument0
{
case 1:
    if shield_type!=argument0 shield = instance_create(floor(x), floor(y), objShieldBubble);
        if objLevel.started && objProgram.cutscene == false
            audio_play_sound(sndShieldBubble, 2,0);

    // clear underwater timer
    underwater_count = -1;
    // reset music
    if audio_is_playing(bgmDrowning) {
        play_previous(objMusic.priorityMusicState, objMusic.previousPosition);
    }

    break;
case 2:
        if shield_type!=argument0 shield = instance_create(floor(x), floor(y), objShieldLightning);
            if objLevel.started && objProgram.cutscene == false
                audio_play_sound(sndShieldLightning, 2,0);
    break;
case 3:
        if shield_type!=argument0 shield = instance_create(floor(x), floor(y), objShieldFlame);
            if objLevel.started && objProgram.cutscene == false
            audio_play_sound(sndShieldFlame, 2,0);
    break;
case 4:
        if shield_type!=argument0 shield = instance_create(floor(x), floor(y), objShieldIce);
            if objLevel.started && objProgram.cutscene == false
                audio_play_sound(sndShieldIce, 2,0);
    break;
case 5:
        if shield_type!=argument0 shield = instance_create(floor(x), floor(y), objShieldWind);
            if objLevel.started && objProgram.cutscene == false
                audio_play_sound(sndShieldWind, 2,0);
    break;
case 0:
    if shield_type!=argument0 shield = instance_create(floor(x), floor(y), objShieldEarth);
        if objLevel.started && objProgram.cutscene == false
            audio_play_sound_on(audio, sndRockSmash, false, 0);
}

// modify shield properties
if shield_type!=argument0
{
    shield_type = argument0;
    shield.image_xscale = facing;
    shield.depth = depth-1;
    shield.player_id = id;
    if invincibility && !superform shield.visible = false;
}
