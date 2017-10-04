// player_reaction_skydive(local_id)

// player_reaction_fan(local_id)

if state == player_state_climb || landed return false;
// enable the fan
argument0.enabled = true;

// cancel jumping
rolling_jump = false;
jumping = false;

if yspeed > 0.1
yspeed-=.05*yspeed;

animation_new = "float";
/*if input_check_pressed(cACTION) {
    // player_is_jumping()
    var ground_speed;
    
    // animate
    animation_new = "spin";
    timeline_speed = 1/max(5-abs(xspeed), 1);
    image_angle = 0;
    
    // states and flags
    state = player_state_fall;
    spinning = true;
    jumping = true;
    jump_action = false;
    spindashing = false;
    
    // movement and collision
    ground_speed = xspeed;
    xspeed = (cosine[relative_angle]*ground_speed)-(sine[relative_angle]*jump_constant);
    yspeed = -(sine[relative_angle]*ground_speed)-(cosine[relative_angle]*jump_constant);
    
    // set air state
    player_in_air();
    
    // sound
    audio_play_sound(sndJump, false, 0);
}*/

// fall if not already falling
if (yspeed >= 0) or (state != player_state_fall)
{
    // states and flags
    state = player_state_fall; // player_state_fan
    jumping = false;
    spinning = false;
    rolling_jump = false;
    jump_action = false;

    // set air state
    player_in_air();
}

// not a hard collision
return false;
