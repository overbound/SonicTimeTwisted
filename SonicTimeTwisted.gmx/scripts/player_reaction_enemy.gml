// player_reaction_enemy(local_id)
var bonus_score;
if !(abs(xspeed)>=6 && character_id==3){
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
// scoring
if chain_multiplier>15 bonus_score = 10000; else
if chain_multiplier>3 bonus_score = 1000; else
if chain_multiplier>2 bonus_score = 500; else
if chain_multiplier>1 bonus_score = 200; else
bonus_score = 100;
player_add_score(bonus_score);
with instance_create(argument0.x, argument0.y, objScorePopup)
{
    if other.chain_multiplier>1 image_index = 2; else
    image_index = 1;
}
// destroy enemy
with argument0 instance_destroy();
// sound
play_sfx(sndPop, 1);
// rumble
rumble(rumble_short_strong);
// hard collision found
return true;
