/// player_reaction_tubewater(local_id)
if argument0.visible == false exit;
// states and flags
    state = player_state_fall;
    spinning = false;
    jumping = false;
    rolling_jump = false;
    jump_action = true;
    // movement and collision
    yspeed = min(-4,yspeed);
    yspeed -= .2;
    argument0.active = true;
    
    // set air state
    player_in_air();
// hard collision found
return false;
