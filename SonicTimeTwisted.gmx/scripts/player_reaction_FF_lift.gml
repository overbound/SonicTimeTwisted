// player_reaction_FF_lift(local_id, code)
// check collision code
if (argument1 != 2) or (mask_rotation != 0) return false;
// Set the tracking speed
argument0.tracking_speed = xspeed;
argument0.remove = 0;
// not a hard collision
return false;
