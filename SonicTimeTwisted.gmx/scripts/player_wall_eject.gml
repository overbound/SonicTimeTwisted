// player_wall_eject(local_id)
var i;
// get collision offset
for (i=offset_wall; i>-1; i-=1) if not collision_ray(i, 0, mask_rotation, argument0) break;

if argument0.object_index == objCurveConcave || argument0.object_index == objCurveConcaveSlim || argument0.object_index == objSlant {
    
    if sign(argument0.image_xscale) == 1 && sign(argument0.image_yscale) == 1 {
        x-=max(abs(xspeed),4);
        y-=max(abs(yspeed),4);
        return 1;
    }
    else if sign(argument0.image_xscale) == -1 && sign(argument0.image_yscale) == 1 {
        x+=max(abs(xspeed),4);
        y-=max(abs(yspeed),4);
        return -1;
    }
    else if sign(argument0.image_xscale) == 1 && sign(argument0.image_yscale) == -1 {
        x-=max(abs(xspeed),4);
        y+=max(abs(yspeed),4);
        return 1;
    }
    else if sign(argument0.image_xscale) == -1 && sign(argument0.image_yscale) == -1 {
        x+=max(abs(xspeed),4);
        y+=max(abs(yspeed),4);
        return -1;
    }
}
// if offset is negative, we're stuck inside the wall
else  if (i<0)
{
    // abort if harmful
    with argument0 if harmful return 0;
    with terrain_id if harmful return 0;
    // find closest edge outside of collision
    for (i=offset_wall; i<offset_wall*2; i+=1)
    {
        // right side
        if not collision_ray_vertical(i, 0, mask_rotation, argument0)
        {
            x += cosine[mask_rotation]*(offset_wall+i);
            y -= sine[mask_rotation]*(offset_wall+i);
            return -1;
        }
        // left side
        if not collision_ray_vertical(-i, 0, mask_rotation, argument0)
        {
            x -= cosine[mask_rotation]*(offset_wall+i);
            y += sine[mask_rotation]*(offset_wall+i);
            return 1;
        }
    }
}
else if collision_ray_vertical(i+1, 0, mask_rotation, argument0)
{
    // right wall only
    x -= cosine[mask_rotation]*(offset_wall-i);
    y += sine[mask_rotation]*(offset_wall-i);
    return 1;
}
else if collision_ray_vertical(-(i+1), 0, mask_rotation, argument0)
{
    // left wall only
    x += cosine[mask_rotation]*(offset_wall-i);
    y -= sine[mask_rotation]*(offset_wall-i);
    return -1;
}
// ejection failed
return 0;
