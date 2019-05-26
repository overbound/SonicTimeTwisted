//player_is_super_flying()
// transform
player_transform(true);
    
// animate
animation_new = "run";
timeline_speed = 1;
image_angle = 0;
xspeed=0;
yspeed=0;
// states and flags
state = player_state_super_flight;
spinning = false;
jumping = false;
jump_action = false;
rolling_jump = true;
landed = false;
terrain_id = noone;
return true;
