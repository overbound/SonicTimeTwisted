// player_is_glide_falling()

// animate
animation_new = "glide_end";
timeline_speed = 1;

// states and flags
state = player_state_fall;
jumping = false;

// movement and collision
xspeed *= 0.25;

// set air state
player_in_air();

// character values
glide_falling = true;
climb_id = noone;
