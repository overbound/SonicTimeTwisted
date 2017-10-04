// player_get_terrain(local_id)

// confirm terrain id
terrain_id = argument0;

// calculate terrain angle
angle = player_get_terrain_angle(terrain_id, mask_rotation);
relative_angle = angle_wrap(angle-gravity_angle());

// upward terrain height
while collision_box(offset_x, offset_y, (mask_rotation mod 180), terrain_id)
{
    x -= sine[mask_rotation];
    y -= cosine[mask_rotation];
}

// downward terrain height
while not collision_ray(offset_x, offset_y+1, mask_rotation, terrain_id)
//while not collision_box(offset_x, offset_y+1, mask_rotation, terrain_id)
{
    x += sine[mask_rotation];
    y += cosine[mask_rotation];
}
