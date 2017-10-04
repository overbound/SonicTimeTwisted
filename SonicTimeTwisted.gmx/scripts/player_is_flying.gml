// player_is_flying()

// animate
if underwater animation_new = "swim"; else animation_new = "flight";
timeline_speed = 1;
image_angle = angle;

// states and flags
state = player_state_fly;
spinning = false;
jumping = false;
jump_action = false;

// set air state
player_in_air();

// character values
alarm[0] = 480;
flight_force = 0.03125;
