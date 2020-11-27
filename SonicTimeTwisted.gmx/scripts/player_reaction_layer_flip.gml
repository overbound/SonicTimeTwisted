/// player_reaction_layer_flip(local_id)
var local_id = argument0;

// flip depth_mask based on movement direction
if (sign(local_id.image_xscale) == sign(x - xprevious))
    depth_mask = 1;
else
    depth_mask = 2;

// not a hard collision
return false;
