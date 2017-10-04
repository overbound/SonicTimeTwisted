// player_is_rolling()

// animate
animation_new = "spin";
timeline_speed = 1/max(5-abs(xspeed), 1);
image_angle = 0;

// states and flags
state = player_state_roll;
spinning = true;
spindashing = false;

// counters
chain_multiplier = 0;
