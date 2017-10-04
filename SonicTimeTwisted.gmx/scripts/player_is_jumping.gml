// player_is_jumping()
var ground_speed;
var v_cosine = dcos(relative_angle);
var v_sine = dsin(relative_angle);
// animate
animation_new = "spin";
timeline_speed = 1/max(5-abs(xspeed), 1);
image_angle = 0;

// states and flags
state = player_state_fall;
spinning = true;
jumping = true;
jump_action = true;
spindashing = false;

// movement and collision
ground_speed = xspeed;
xspeed = (v_cosine * ground_speed) - (v_sine * jump_constant);
yspeed = -(v_sine * ground_speed) - (v_cosine * jump_constant);

// set air state
player_in_air();

// sound
audio_play_sound(sndJump, 0, 0);
