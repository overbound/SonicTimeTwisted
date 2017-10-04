// player_reaction_ring(local_id)

// ignore if layer mismatch
if not (layer&argument0.layer) return false;

// abort if ignoring
if ignore_rings return false;

// collect ring
player_get_rings(1);

// ring sparkle
part_particles_create(objLevel.particles, argument0.x, argument0.y, objResources.sparkle, 1);

// destroy ring
with argument0 instance_destroy();

// not a hard collision
return false;
