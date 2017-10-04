// player_reaction_falling_platform(local_id, code)

// check collision code
if (argument1 != 2) return false;

// abort if already triggered
if argument0.alarm[0] or argument0.falling return false;

// push downward
if argument0.y < argument0.ystart + 4 argument0.y += 1; else
argument0.alarm[0] = 30;

// not a hard collision
return false;
