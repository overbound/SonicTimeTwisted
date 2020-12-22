// player_reaction_galanik_nose(local_id)
var bonus_score;
// ignore if already hit
if argument0.alarm[0] return false;
// if not spinning or invincible
if argument0.invulnerable or not (spinning or instashield or instashield or spindashing or invincibility or superform or state==player_state_glide)
{
    // abort if already hit
    if invulnerable or (state==player_state_hurt) return false;
    // take hit
    player_hit(sign(x-argument0.x), sndHurt);
    // hard collision found
    return true;
}
// rebound
xspeed = -xspeed;
if not landed
{
    
    jump_action = true;
    // if bottom collision or moving upward, weigh down velocity
    if collision_ray(offset_x, -offset_y, mask_rotation, argument0) or yspeed<0 yspeed -= sign(yspeed); else
    //  if top collision and moving downward, bounce
    if collision_ray(offset_x, offset_y, mask_rotation, argument0) and yspeed>0
    {
        // increase force while holding jump or not jumping
        if input_check(cACTION) yspeed = -yspeed; else yspeed = max(-jump_release, -yspeed);
    }
}
// curl if gliding
if state==player_state_glide
{
    // animate
    animation_new = "spin";
    timeline_speed = 1;
    // states and flags
    state = player_state_fall;
    spinning = true;
}
// hit boss
argument0.alarm[0] = 30;
if argument0.life>0
{
    argument0.life -= 1;
    if argument0.life<=0 
        with argument0 {
            event_user(0);
            audio_play_sound(sndGalanikKnockBack,2,false);
        }
}
with argument0.parentId {
    flash = true;
    alarm[11] = 30;
    
}
with argument0 {
    if moveOff == false {
        moveOff = true;
    } else {
        moveOff = false;
        parentId.state = 4;
    }
}
// sound
audio_play_sound(sndBossHit, 1, 0);
audio_play_sound(sndGalanikHit, 1, 0);
// rumble
rumble(rumble_short_strong_double);
// hard collision found
return true;
