// player_reaction_flipper(local_id, code)

// ignore if already activated
if (argument0.player_id==id) return false;

// check collision
if (argument1!=-1 && argument0.image_xscale != -1) && (argument1!=1 && argument0.image_xscale !=1) && (argument1!=2)
return false;

// give control to flipper
argument0.player_id = id;

// animate
animation_new = "spin";
timeline_speed = 0.2;
image_angle = 0;

// states and flags
state = player_state_object;
spinning = true;
spindashing = false;
jump_action = true;

// counters
chain_multiplier = 0;

// character values
if character_id==3 glide_falling = false;

// hard collision found
return true;

