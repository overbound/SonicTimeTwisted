// player_is_standing()

// states and flags
state = player_state_stand;
spinning = false;
jumping = false;
rolling_jump = false;
jump_action = true;
spindashing = false;

// counters
chain_multiplier = 0;

// camera
camera.ground_mode = true;

// animate
if (character_id==2) {if (cliff!=0) animation_new = "cliff"; else animation_new = "idle";} else
if (cliff==facing) animation_new = "cliff"; else
if (cliff==-facing) animation_new = "cliff_b"; else
animation_new = "idle";
timeline_speed = 1;
image_angle = gravity_angle();
