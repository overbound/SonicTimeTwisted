// player_collision_floor(offset)

var offset = argument0;

var result = noone;
var total = ds_list_size(terrain_list);
var n, local_id;

for (var oy = 0; oy < offset; ++oy)
{
    for (n = 0; n < total; ++n)
    {
        local_id = terrain_list[| n];
        if (collision_box_lower(offset_x, oy, mask_rotation, local_id))
        {
            if (not (local_id.through and 
                collision_ray(offset_x, 0, mask_rotation, local_id)))
            {
                result = local_id;
                break;
            }
        }
    }
    if (result != noone)
    {
        break;
    }
}

return result;
