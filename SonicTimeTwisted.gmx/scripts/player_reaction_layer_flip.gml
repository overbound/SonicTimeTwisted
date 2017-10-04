// player_reaction_layer_flip(local_id)

// flip layer based on movement direction
layer = 1+(sign(argument0.image_xscale) xor sign(x-xprevious));

// not a hard collision
return false;
