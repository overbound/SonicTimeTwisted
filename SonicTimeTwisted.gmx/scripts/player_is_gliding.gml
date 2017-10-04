// player_is_gliding()

// animate
animation_new = "glide";
timeline_speed = 1;
image_angle = angle;

// states and flags
state = player_state_glide;
spinning = false;
jumping = false;
jump_action = false;

// movement and collision
if (yspeed<=-8) yspeed *= 0.25; else
if (yspeed<0) yspeed = 0;

// set air state
player_in_air();

// character values
glide_speed = 4;
glide_direction = facing;
glide_angle = 180*(not facing);
glide_force = 0.5;
