// player_state_fly()
// aerial acceleration
if input_check(cLEFT)
{
    // set facing
    facing = -1;
    // accelerate
    if xspeed>-speed_cap {xspeed -= air_acceleration; if xspeed<-speed_cap xspeed = -speed_cap;}
}
if input_check(cRIGHT)
{
    // set facing
    facing = 1;
    // accelerate
    if xspeed<speed_cap {xspeed += air_acceleration; if xspeed>speed_cap xspeed = speed_cap;}
}
// update position
if not player_movement_air() {if audio_is_playing(reserved_sound) audio_stop_sound(reserved_sound); return false;}
// air friction
if yspeed<0 and yspeed>-jump_release xspeed *= air_friction;
// flight gravity
if yspeed<flight_threshold flight_force = 0.03125;
// gravity
yspeed += flight_force;
// landing
if landed {if audio_is_playing(reserved_sound) audio_stop_sound(reserved_sound); return player_is_running();}
// flight height
if input_check_pressed(cACTION) and alarm[0] and yspeed>=flight_threshold flight_force = -0.125;
// animate
if not alarm[0] {if underwater animation_new = "swim_end"; else animation_new = "flight_end";}
if underwater and yspeed>=0 timeline_speed = 0.5; else timeline_speed = 1;
// sound
if underwater {if audio_is_playing(reserved_sound) audio_stop_sound(reserved_sound);} else
{
// rumble
rumble(rumble_short_weakest);
if not alarm[0] {if not audio_is_playing(sndFlightEnd) {audio_stop_sound(reserved_sound); reserved_sound = play_sfx(sndFlightEnd, 1);}} else
if not audio_is_playing(sndFlight) {audio_stop_sound(reserved_sound); reserved_sound = play_sfx(sndFlight, 1);}
}
