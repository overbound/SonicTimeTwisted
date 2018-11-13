// player_is_exiting()
// animate
animation_new = "run";
timeline_speed = 1;
// states and flags
state = player_state_exit;
spinning = false;
jumping = false;
rolling_jump = false;
jump_action = true;
spindashing = false;
if superform {
    objProgram.temp_superform = true;
}
objProgram.temp_shield = shield_type;
// movement and collision
xspeed = 12*facing;
// counters
chain_multiplier = 0;
// camera
camera.ground_mode = false;
