// player_reaction_AA_boost(local_id)
// ignore if not on the ground
if not landed return false;
// adjust speed based on facing
if objProgram.in_past
    xspeed = 12;
else xspeed = 16;
facing = 1;
if landed
{
    sliding = 16;
    if (state == player_state_glide_slide) player_is_running();
}
// sound
if !audio_is_playing(sndSpin) {
    audio_play_sound(sndSpin, 1, 0);
}
//with argument0 instance_destroy();
player_is_rolling()
// hard collision found
return true;
