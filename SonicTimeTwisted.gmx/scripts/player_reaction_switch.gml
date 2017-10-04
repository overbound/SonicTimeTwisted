// player_reaction_switch(local_id, code)

// check collision code
if (argument1!=2) or (mask_rotation!=0) return false;

// trigger switch
argument0.image_index = 1;

// activate
if not argument0.activated {argument0.activated = true; with argument0.parent_id event_user(0);}

// not a hard collision
return false;
