// player_reaction_bubbles_badnik(local_id)
// ignore if already activated
if (argument0.allow_collision == false || argument0.active==true) return false;
// give control to bubbles
argument0.active = true;
argument0.player_id = id;
// animate
animation_new = "spin";
timeline_speed = 0.25;
image_angle = 0;
// states and flags
state = player_state_object;
spinning = true;
jumping = false;
jump_action = true;
rolling_jump = true;
landed = false;

// Angle and Distance for orbiting
//argument0.angle=point_direction(x,y,argument0.x,argument0.y);
argument0.radius=point_distance(x,y,argument0.x,argument0.y);
    
// character values
if character_id==3 glide_falling = false;
// hard collision found
return true;
