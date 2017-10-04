// player_is_looking()

// animate
animation_new = "look";
timeline_speed = 1;

// states and flags
state = player_state_look;

// camera
if camera.offset_y==0 alarm[0] = 120;
