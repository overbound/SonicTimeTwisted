// player_collision_object()
var total_locals, result, i, local_id;

// initialize
total_locals = instance_number(objNonSolid);
result = false;

// evaluate all locals
for (i=0; i<total_locals; i+=1)
{
    // get local id
    local_id = instance_find(objNonSolid, i);

    // if colliding, execute reaction
    if collision_box(offset_x, offset_y, (mask_rotation mod 180), local_id) result |= player_get_reaction(local_id, 0);
}

// return true on hard collision
return result;
