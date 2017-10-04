// player_reaction_trampoline(local_id)

// ignore if already activated
if (argument0.player_id==id) return false;

// check collision
if yprevious>=argument0.bbox_top or yspeed<=0 or (mask_rotation!=0) return false;

// give control to trampoline
argument0.active = true;
argument0.player_id = id;

// calculate impact
argument0.force_x = xspeed;
argument0.force_y = clamp(-(yspeed+1), -16, -9);

// animate
animation_new = "spin";
timeline_speed = 0.2;
image_angle = 0;

// states and flags
state = player_state_object;
spinning = true;
jumping = false;
jump_action = true;
rolling_jump = false;

// movement and collision
y = argument0.bbox_top-offset_y;
xspeed = 0;
yspeed = 4;

// set air state
player_in_air();

// character values
if character_id==3 glide_falling = false;

// hard collision found
return true;
