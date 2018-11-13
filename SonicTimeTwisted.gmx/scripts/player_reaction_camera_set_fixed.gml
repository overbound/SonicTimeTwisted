// player_reaction_camera_set(local_id)
// abort if not near camera center
//if x<argument0.x return false;
// force camera bounds
camera.left = argument0.left;
camera.top = argument0.top;
camera.right = argument0.right;
camera.bottom = argument0.bottom;
// not a hard collision
return false;
