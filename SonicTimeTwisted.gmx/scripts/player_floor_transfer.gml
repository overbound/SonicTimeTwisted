// player_floor_transfer()
var hit_transfer, offset, transfer_rotation, transfer_angle, transfer_offset;

// transfer collision
hit_transfer = collision_ray(offset_y*2, offset_x, mask_rotation, terrain_id);

// handle transfer collision
if not hit_transfer return false

// get degree offset from mask rotation to current angle
offset = angle_distance(mask_rotation, angle);

// set desired rotation
transfer_rotation = angle_wrap(mask_rotation+90*sign(offset));

// get terrain angle using desired rotation
transfer_angle = player_get_terrain_angle(hit_transfer, transfer_rotation);

// get degree offset from mask rotation to transfer angle
transfer_offset = angle_distance(mask_rotation, transfer_angle);

// abort if transfer direction is incorrect
if sign(offset)!=sign(transfer_offset) return false;

// abort if angles are too steep or shallow
if abs(offset)<45 or abs(transfer_offset)<45 or abs(transfer_offset)>=90 return false;

// abort if angles are the same
if (angle==transfer_angle) or (offset==transfer_offset) return false;

// transfer rotation
mask_rotation = transfer_rotation;

// calculate terrain angle
angle = transfer_angle;
relative_angle = angle_wrap(angle-gravity_angle());

// upward terrain height
while collision_box(offset_x, offset_y, (mask_rotation mod 180), terrain_id)
{
    x -= sine[mask_rotation];
    y -= cosine[mask_rotation];
}

// downward terrain height
while not collision_ray(offset_x, offset_y+1, mask_rotation, terrain_id)
{
    x += sine[mask_rotation];
    y += cosine[mask_rotation];
}

// transfer successful
return true;
