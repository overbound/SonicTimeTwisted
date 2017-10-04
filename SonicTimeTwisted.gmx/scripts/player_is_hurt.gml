// player_is_hurt()

// animate
animation_new = "hurt";
timeline_speed = 1;
image_angle = gravity_angle();

// states and flags
state = player_state_hurt;
spinning = false;
jumping = false;
rolling_jump = false;
spindashing = false;
invulnerable = 120;

// movement and collision
xspeed = argument0*2;
yspeed = -4;
if (xspeed==0) xspeed = 2;
if underwater {xspeed *= 0.5; yspeed *= 0.5;}

// counters and timers
ignore_rings = 64;

// set air state
player_in_air();

// character values
if character_id==3 glide_falling = false;
