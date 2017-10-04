// player_collision_wall(offset)
var total_locals, i, local_id;

// initialize
total_locals = ds_list_size(terrain_list);

// evaluate all locals
for (i=0; i<total_locals; i+=1)
{
    // get local id
    local_id = ds_list_find_value(terrain_list, i);

    // continue if passing through
    if not collision_ray(argument0, 0, mask_rotation, local_id) or local_id.through continue;

    // confirm matching local
    return local_id;
}

// no collision
return noone;
