/// player_reaction_FF_orb(local_id)

// ignore if already activated
if (argument0.player_id[player_id] == id) or argument0.alarm[player_id] return false;

// give control to trampoline
argument0.player_id[player_id] = id;

// animate
animation_new = "spin";
timeline_speed = 0.2;
image_angle = 0;

// states and flags
state = player_state_object;
spinning = true;
jumping = false;
jump_action = true;
rolling_jump = false;

// get starting position
argument0.angle[player_id] = point_direction(argument0.x, argument0.y, x, y);
argument0.z_pos[player_id] = (point_direction(0, abs(argument0.y-y), abs(x-argument0.x), 0) + 45) mod 360;

// movement and collision
xspeed = 0;
yspeed = 0;

// set air state
//player_in_air();

// character values
if (character_id == 3) glide_falling = false;

// hard collision found
return true;
