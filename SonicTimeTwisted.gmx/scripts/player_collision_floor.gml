// player_collision_floor(offset)
var total_locals, i, j, local_id;

// initialize
total_locals = ds_list_size(terrain_list);

// scan rectangle within offset
for (i=0; i<argument0; i+=1)
{
    // evaluate all locals
    for (j=0; j<total_locals; j+=1)
    {
        // get local id
        local_id = ds_list_find_value(terrain_list, j);

        // continue if no collision
        if not collision_ray(offset_x, i, mask_rotation, local_id) continue;

        // continue if passing through wall sensor
        if local_id.through and collision_ray(offset_x, 0, mask_rotation, local_id) continue;

        // confirm matching local
        return local_id;
    }
}

// no collision
return noone;
