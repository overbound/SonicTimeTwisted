/// player_get_terrain(local_id)

var local_id = argument0;

terrain_id = local_id;
angle = player_get_terrain_angle(local_id, mask_rotation);
relative_angle = angle_wrap(angle - gravity_angle());

var s = sine[mask_rotation];
var c = cosine[mask_rotation];

// rise up
repeat (offset_y)
{
    if (collision_box_lower(offset_x, offset_y, mask_rotation, terrain_id))
    {
        x -= s;
        y -= c;
    }
    else
    {
        break;
    }
}

// snap down
repeat (offset_y + 1)
{
    if (not collision_box_lower(offset_x, offset_y + 1, mask_rotation, terrain_id))
    {
        x += s;
        y += c;
    }
    else
    {
        break;
    }
}
