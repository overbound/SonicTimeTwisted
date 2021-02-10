// player_is_air_dashing()
// animate
animation_new = "spin";
timeline_speed = 1;
image_angle = 0;
// states and flags
spinning = true;
jumping = false;
jump_action = false;
// movement and collision
xspeed = 8*facing;
yspeed = 0;
// set air state
player_in_air();
// camera
camera.alarm[0] = 12;
// shield animation
shield.image_xscale = facing;
shield.image_angle = 0;
shield.depth = depth-2;
shield.timeline_index = animShieldFlameAction;
shield.timeline_loop = true;
shield.timeline_position = 0;
// rumble
rumble(rumble_short_mid);
// sound
play_sfx(sndFlameDash, 0);
