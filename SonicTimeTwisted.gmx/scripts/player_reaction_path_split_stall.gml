// player_reaction_path_split_stall(local_id)
argument0.active = true;
argument0.player_id = id;
 x = argument0.x;
 y = argument0.y;        
// animate
animation_new = "spin";
timeline_speed = 1;
image_angle = 0;
// states and flags
state = player_state_path;
rolling_jump = false;
// motion planning
xspeed = 0;
yspeed = 0;
// character values
if character_id==3 glide_falling = false;
// hard collision occured
return true;
