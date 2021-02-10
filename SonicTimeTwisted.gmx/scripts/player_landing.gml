// player_landing(local_id)
// get terrain data
player_get_terrain(argument0);
// confirm terrain landing
landed |= 1;
// handle mask rotation
//player_floor_transfer();
if relative_angle > 45 and relative_angle < 315 {if not player_floor_transfer() mask_rotation = angle_wrap(mask_rotation + 90 * sign(angle_distance(mask_rotation, angle)));}
// calculate landing speed
if abs(xspeed)<=abs(yspeed) and relative_angle>=22.5 and relative_angle<=337.5
{
    // scale speed to incline
    xspeed = -yspeed*sign(sine[relative_angle]);
    if (relative_angle<45 or relative_angle>315) xspeed *= 0.5;
}
// stop falling
yspeed = 0;
