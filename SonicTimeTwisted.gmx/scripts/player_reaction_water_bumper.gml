// player_reaction_water_bumper(local_id)
var bounce_direction;
// stop if active
if argument0.active == true return false;
argument0.active = true;
argument0.alarm[0]=20;

// fall if hurt
if (state==player_state_hurt) player_is_falling();
// get bounce direction
bounce_direction = angle_wrap(point_direction(argument0.x, argument0.y, x, y)-gravity_angle());
// states and flags
rolling_jump = false;
if landed && argument1 == 2 {
    // states and flags
    state = player_state_fall;
    spinning = true;
    jumping = true;
    jump_action = true;
    spindashing = false;
    
    bounce_direction = 90;
    yspeed = -7;
    //player_is_jumping();
    }
    // movement and collision
    xspeed = cosine[bounce_direction]*7;
    yspeed = -sine[bounce_direction]*7;

// character values
if character_id==3 glide_falling = false;
if !audio_is_playing(sndWaterBumper)
audio_play_sound(sndWaterBumper, 2, 0);
// hard collision found
return true;
