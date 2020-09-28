/// player_floor_transfer()

var result = false;

var diff = angle_difference(angle, mask_rotation);
if (abs(diff) >= 45 and abs(diff) < 90)
{
    if (collision_box(offset_y * 2, offset_x, mask_rotation, terrain_id))
    {
        var new_rotation = angle_wrap(mask_rotation + 90 * sign(diff));
        var new_dir = player_get_terrain_angle(terrain_id, new_rotation);
        var new_diff = angle_difference(new_dir, mask_rotation);
        if (angle != new_dir and diff != new_diff and sign(diff) == sign(new_diff) and
            abs(new_diff) >= 45 and abs(new_diff) < 90)
        {
            mask_rotation = new_rotation;
            player_get_terrain(terrain_id); // forces remapping
            result = true;
        }
    }
}

return result;
