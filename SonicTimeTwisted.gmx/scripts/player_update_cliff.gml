// player_update_cliff()
var total_locals, left, right, center, i, local_id;

// initialize
total_locals = ds_list_size(terrain_list);
left = noone;
right = noone;
center = noone;

// evaluate all locals
for (i=0; i<total_locals; i+=1)
{
    // get local id
    local_id = ds_list_find_value(terrain_list, i);

    // continue if passing through wall sensor
    if local_id.through and collision_ray(offset_x, 0, mask_rotation, local_id) continue;

    // check sensors
    if collision_ray_vertical(-offset_x, offset_y+16, mask_rotation, local_id) left = terrain_id;
    if collision_ray_vertical(offset_x, offset_y+16, mask_rotation, local_id) right = terrain_id;
    if collision_ray_vertical(0, offset_y+16, mask_rotation, local_id) center = terrain_id;
}

// if two adjecent edges collide, we're not on a cliff
if (center and left) or (center and right) cliff = 0; else

// if no edges are colliding, use current direction
if not (left or right) cliff = facing; else

// get cliff direction
if not left cliff = -1; else
if not right cliff = 1;
