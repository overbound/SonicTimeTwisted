// player_is_crouching()

// animate
animation_new = "crouch";
timeline_speed = 1;

// states and flags
state = player_state_crouch;

// camera
if camera.offset_y==0 alarm[0] = 120;
