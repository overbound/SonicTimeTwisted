// player_reaction_sand_lift
/*
if !landed && alarm[0] == -1 {

// player_reaction_fan(local_id)
alarm[0]=10;
if state == player_state_climb return false;
// enable the fan
//argument0.enabled = true;
// cancel jumping
rolling_jump = false;
jumping = false;
// rise so long as we're colliding
if (yspeed > -4)
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
*/
if (yspeed >= 0) && (state != player_state_fall)
{
    if input_check_pressed(cACTION) {
        player_is_jumping();
    }
}
// not a hard collision
return false;
