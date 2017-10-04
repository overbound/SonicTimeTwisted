// player_reaction_egg_walker(local_id)
var bounce_direction;

// fall if hurt
if (state==player_state_hurt) player_is_falling();

// get bounce direction
bounce_direction = angle_wrap(point_direction(argument0.x, argument0.y, x, y)-gravity_angle());

// states and flags
rolling_jump = false;
jump_action = true;

// movement and collision
xspeed = argument0.image_xscale*7;
yspeed = -7;

// character values
if character_id==3 glide_falling = false;

with argument0 {
    if alarm[4]== -1 {
        audio_play_sound(sndAADropBumper, 1, 0);
    }
}

with argument0 {
    image_speed = .5;
    alarm[4]=60;
}

// hard collision found
return true;
