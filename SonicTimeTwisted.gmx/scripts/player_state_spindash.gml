// player_state_spindash()
// update position
if not player_movement_ground() return false;
// falling
if not landed return player_is_falling();
// slide if moving too slow
if relative_angle>=45 and relative_angle<=315
{
    // if not at gravity angle, fall
    if relative_angle>=90 and relative_angle<=270 return player_is_falling(); else return player_is_running();
}
// abort on releasing down
if input_check_released(cDOWN)
{
    // release charge
    xspeed = facing*(8+(spindash_charge div 2));
    spindash_charge = 0;
    // camera
    camera.alarm[0] = floor(24-abs(xspeed));
    // spindash sound
    spindash_pitch = 0;
    if audio_is_playing(reserved_sound) audio_stop_sound(reserved_sound);
    audio_play_sound(sndSpinDash, 0, 0);
    // roll
    return player_is_rolling();
}
// charging
if input_check_pressed(cACTION) and spindash_charge<8
{
    spindash_charge += 2;
    if spindash_charge>8 spindash_charge = 8;
    // spindash pitch bending
    if not audio_is_playing(reserved_sound) spindash_pitch = 0; else
    if spindash_pitch<11 spindash_pitch += 1;
    // spindash sound
    if audio_is_playing(reserved_sound) audio_stop_sound(reserved_sound);
    reserved_sound = audio_play_sound(sndSpinRev, 0, 0);
   // audio_sound_pitch(reserved_sound, 1+(spindash_pitch*0.075));
   audio_sound_pitch(reserved_sound, 1+(spindash_pitch*0.075));
}
// atrophy
if spindash_charge>0 spindash_charge *= spindash_friction;
//rumble
rumble(RUMBLE_EVENT_SPINDASH);
