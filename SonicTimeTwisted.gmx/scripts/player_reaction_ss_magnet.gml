// player_reaction_ss_magnet(local_id)
if state == player_state_climb || landed return false;
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
if  (state != player_state_fall)
{
    // states and flags
    //state = player_state_fall; // player_state_fan
    jumping = false;
    spinning = false;
    rolling_jump = false;
    jump_action = true;
    landed = false;
    player_is_falling();
    // set air state
    player_in_air();
}
// rumble
rumble(rumble_short_weakest);
// not a hard collision
return false;
