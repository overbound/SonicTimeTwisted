//player_reaction_canon(local_id)
// give control
argument0.active = true;
argument0.player_id = id;
argument0.reaction_script=noone;
with tails_effect hide = true;
// animate
animation_new = "spin";
timeline_speed = 0.25;
image_angle = 0;
// states and flags
state = player_state_object;
spinning = true;
jumping = false;
jump_action = false;
rolling_jump = true;
landed = false;
xspeed=0;
yspeed=0;
 
// character values
if character_id==3 glide_falling = false;
// hard collision found
return true;
