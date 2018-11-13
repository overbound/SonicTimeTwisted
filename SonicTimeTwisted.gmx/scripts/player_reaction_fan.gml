// player_reaction_fan(local_id)
if state == player_state_climb || landed return false;
//if (state==player_state_glide) {player_is_glide_falling(); return true;}
if (state==player_state_glide) || (state==player_state_fly)
player_is_falling();
// enable the fan
argument0.enabled = true;
// cancel jumping
rolling_jump = false;
jumping = false;
// rise so long as we're colliding
if (yspeed > -8)
{
    xspeed += (sine[relative_angle] * argument0.x_force); 
    yspeed += (cosine[relative_angle] * argument0.y_force);
}
// fall if not already falling
if (yspeed >= 0) or (state != player_state_fall)
{
    // states and flags
    state = player_state_fall; // player_state_fan
    jumping = false;
    spinning = false;
    rolling_jump = false;
    jump_action = true;
    // set air state
    player_in_air();
}
// animate
animation_new = "float";
timeline_speed = 0.2;
image_angle = 0;
// not a hard collision
return false;
