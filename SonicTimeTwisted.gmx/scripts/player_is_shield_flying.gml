// player_is_shield_flying()
// animate
animation_new = "spin";
timeline_speed = 1;
image_angle = 0;
// states and flags
state = player_state_shield_fly;
spinning = true;
jumping = false;
jump_action = false;
// movement and collision
xspeed = 0;
yspeed = 0;
// set air state
player_in_air();
// other
alarm[0] = 128;
// flight direction
if facing<0 shield.direction = 180; else
shield.direction = 0;
// sound
play_sfx(sndWindFlight, 0);
