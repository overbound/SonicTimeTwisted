// player_reaction_collapsing_platform(local_id, code)
// check collision code
if (argument1!=2) or (mask_rotation!=gravity_angle()) return false;
// ignore if already activated
if argument0.alarm[0]>0 return false;
// trigger platform
argument0.alarm[0] = 32;
argument0.remove = 0;
// not a hard collision
return true;
