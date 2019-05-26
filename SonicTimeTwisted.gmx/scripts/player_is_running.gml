// player_is_running()
// states and flags
state = player_state_run;
spinning = false;
jumping = false;
rolling_jump = false;
jump_action = true;
spindashing = false;
if boarding && animation == "boarding" {
    instance_create(x,y,objBoardExit);
}
boarding = false;
// counters
chain_multiplier = 0;
// camera
camera.ground_mode = true;

