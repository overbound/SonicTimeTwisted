// player_update_water_running()

landed &= ~2;
var water_level = y;

if (abs(xspeed) >= waterrun_threshold) {
    if (mask_rotation == 0 and not underwater) {
        var total_locals = instance_number(objWater);
        var local_id;
        for (var n = 0; n < total_locals; ++n) {
            local_id = instance_find(objWater, n);
            if (local_id.can_run and y <= local_id.bbox_top and
                collision_ray(offset_x, offset_y + 1, mask_rotation, local_id)) {
                landed |= 2;
                if (y != local_id.bbox_top - offset_y - 1) {
                    y = local_id.bbox_top - offset_y - 1;
                    angle = 0;
                    relative_angle = 0;
                }
                water_level = floor(local_id.bbox_top);
                break;
            }
        }
    }
}

// wave effect
if (landed & 2) {
    if (not instance_exists(wave)) {
        wave = instance_create(x, y, objWaterWave);
        wave.player_id = id;
        wave.image_xscale = facing;
        wave.depth = depth + 1;
        wave.water_level = water_level - 14;
    }
} else {
    if (instance_exists(wave)) {
        instance_destroy(wave);
        wave = noone;
    }
}

/*
var total_locals, i, local_id;

// reset flag
landed &= ~2;

// abort if not enough speed, unless ice shield
if (abs(xspeed)<waterrun_threshold or argument0) return false;

// abort if oriented incorrectly or too far below water surface
if mask_rotation>0 or underwater return false;

// initialize
total_locals = instance_number(objWater);

// evaluate all locals
for (i=0; i<total_locals; i+=1)
{
    // get local id
    local_id = instance_find(objWater, i);

    // ignore if disabled
    if not local_id.can_run continue;

    // need to be right atop
    if y>local_id.bbox_top or not collision_ray(offset_x, offset_y+1, mask_rotation, local_id) continue;

    // confirm water running
    landed |= 2;

    // setup if not already aligned
    if (y!=local_id.bbox_top-offset_y-1)
    {
        // align to water surface
        y = local_id.bbox_top-offset_y-1;

        // neutralize angle
        angle = 0;
        relative_angle = 0;
    }

    // done
    break;
}
