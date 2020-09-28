// player_reaction_knock_ufo(local_id)
var bonus_score;
if !(abs(xspeed)>=6 && character_id==3){
// if not spinning or invincible
    if not (spinning or instashield or spindashing or invincibility or superform or state==player_state_glide)
    {
        // abort if already hit
        if invulnerable or (state==player_state_hurt) return false;
    
        // take hit
        player_hit(sign(x-argument0.x), sndHurt);
    
        // hard collision found
        return true;
    }
}
// rebound in air
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
// destroy enemy
with argument0 {
    if other.y > y {
        if sign(hspeed) == -1 {
            direction = 120;
        } else direction = 60;
    } else {
        if sign(hspeed) == -1 {
            direction = 240;
        } else direction = 300;
    }
    speed = 6;
    reaction_script = noone;
}
// sound
audio_play_sound(sndUFOHit, 0, 0);
// hard collision found
return true;
