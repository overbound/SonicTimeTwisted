// player_reaction_final_boss_face(local_id)
var bonus_score;
// ignore if already hit
if argument0.alarm[0] return false;
// if not spinning or invincible
if argument0.invulnerable or not (spinning or instashield or spindashing or invincibility or superform or state==player_state_glide)
{
    // abort if already hit
    if invulnerable or (state==player_state_hurt) return false;
    // take hit
    player_hit(sign(x-argument0.x), sndHurt);
    // hard collision found
    return true;
}
// rebound
if argument0.life>1
{
    xspeed = -18;
    alarm[0] = 100;

// if bottom collision or moving upward, weigh down velocity
if collision_ray(offset_x, -offset_y, mask_rotation, argument0) or yspeed<0 yspeed -= sign(yspeed); else
//  if top collision and moving downward, bounce
if collision_ray(offset_x, offset_y, mask_rotation, argument0) and yspeed>0
{
    // increase force while holding jump or not jumping
    if input_check(cACTION) yspeed = -yspeed; else yspeed = max(-jump_release, -yspeed);
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
}
// hit boss
argument0.alarm[0] = 30;
if argument0.life>0
{
    argument0.life -= 1;
    if argument0.life<=0 with argument0 event_user(0);
}
with argument0.parentId {
    flash = true;
    alarm[11] = 30;
}
// sound
audio_play_sound(sndBossHit, 1, 0);
// rumble
rumble(rumble_short_strong_double);
// hard collision found
return true;
