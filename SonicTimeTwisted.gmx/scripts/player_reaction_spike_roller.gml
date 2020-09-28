// player_reaction_spike_roller(local_id)
// ignore if already activated
if (argument0.player_id==id || argument0.allow_collision == false) return false;
// check collision
if yprevious>=argument0.bbox_top or yspeed<=0 or (mask_rotation!=0) return false;
// give control to Spike Roller
argument0.active = true;
argument0.player_id = id;

// animate
animation_new = "stand_rotate";
timeline_speed = 0.25;
image_angle = 0;
// states and flags
state = player_state_object;
spinning = false;
jumping = false;
jump_action = false;
rolling_jump = false;
landed = true;
// movement and collision
y = argument0.bbox_top-offset_y;
xspeed = 0;
yspeed = 4;
// character values
if character_id==3 glide_falling = false;
// hard collision found
return true;
