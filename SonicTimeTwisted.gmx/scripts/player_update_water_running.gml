// player_update_water_running()
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
