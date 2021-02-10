// player_movement_ground()
var distance, total_steps, step, hit_wall, hit_floor;
// handle terrain movement
if instance_exists(terrain_id)
{
    // horizontal terrain motion
    if (terrain_id.hspeed!=0)
    {
        x += cosine[relative_angle]*terrain_id.hspeed;
        y -= sine[relative_angle]*terrain_id.hspeed;
    }
    else if (terrain_id.x-terrain_id.xprevious!=0)
    {
        x += cosine[relative_angle]*(terrain_id.x-terrain_id.xprevious);
        y -= sine[relative_angle]*(terrain_id.x-terrain_id.xprevious);
    }
    // vertical terrain motion
    if (terrain_id.vspeed!=0)
    {
        x += sine[relative_angle]*terrain_id.vspeed;
        y += cosine[relative_angle]*terrain_id.vspeed;
    }
    else if (terrain_id.y-terrain_id.yprevious!=0)
    {
        x += sine[relative_angle]*(terrain_id.y-terrain_id.yprevious);
        y += cosine[relative_angle]*(terrain_id.y-terrain_id.yprevious);
    }
}
else
{
    // release terrain
    landed &= ~1;
}
// reset wall direction
wall_direction = 0;
// clamp speed, if applicable
if limit_xspeed xspeed = min(abs(xspeed), max_xspeed)*sign(xspeed);
// setup movement loop
var temp_speed = xspeed;
temp_speed *= abs(cos(angle3D));
distance = temp_speed;//min(abs(xspeed), max_xspeed)*sign(xspeed);
total_steps = 1+(abs(distance) div segment_width)*segment_enabled;
// movement loop
repeat total_steps
{
    // create movement step
    if not segment_enabled step = distance; else
    step = min(abs(distance), segment_width)*sign(distance);
    if abs(distance)>0 distance -= step;
    // apply movement step
    x += cosine[angle]*step;
    y -= sine[angle]*step;
    // keep in bounds
    if not player_update_bounds() return false;
    // reset landing; keep terrain tag
    landed &= ~254;
    // non-solid object collision
    if player_collision_object() return false;
    // update underwater state
    player_update_water();
    // reset local terrain list
    player_get_terrain_list();
    // wall collision
    hit_wall = player_collision_wall(offset_wall);
    // handle wall collision
    if hit_wall  
    {
        // eject
        wall_direction = player_wall_eject(hit_wall);
        //if instance_exists(hit_wall.harmful) && instance_exists(terrain_id.harmful) {
            // get crushed if applicable
            if wall_direction==0 and (hit_wall.harmful or terrain_id.harmful)
            {
                play_sfx(sndHurt);
                return player_is_dead();
            }
        //}
        // execute reaction
        if player_get_reaction(hit_wall, wall_direction) return false;
        // if moving towards wall
        if wall_direction!=0 and sign(xspeed)==wall_direction
        {
            // cut speed
            xspeed = 0;
            // push against wall
            
            if facing==wall_direction && boarding == false player_wall_push(hit_wall, wall_direction);
        }
    }
    // floor collision
    hit_floor = player_collision_floor(offset_y+1+((offset_y-1)*!(landed&4)));
    // check for ramps and walls
    if hit_floor {if (hit_floor==hit_wall) or player_update_ramp(hit_floor) hit_floor = false;}
    // handle floor collision
    if hit_floor
    {
        // execute reaction
        if player_get_reaction(hit_floor, 2) return false;
        // confirm terrain landing; cancel water running
        landed |= 1;
        // get terrain data
        player_get_terrain(hit_floor);
    }
    else
    {
        // release terrain
        landed &= ~1;
    }
    // handle mask rotation
    if player_floor_transfer() landed |= 1;
    // update water running
    player_update_water_running(false);
}
// update cliff direction
if landed&1 {if (xspeed==0) player_update_cliff(); else cliff = 0;}
// finished
return true;
