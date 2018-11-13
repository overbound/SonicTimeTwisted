// player_movement_air()
var distance, total_steps, step, hit_floor;
hit_wall = noone;
// reset wall direction
wall_direction = 0;
// clamp speed, if applicable
if limit_xspeed xspeed = min(abs(xspeed), max_xspeed)*sign(xspeed);
if limit_yspeed yspeed = min(abs(yspeed), max_yspeed)*sign(yspeed);
// setup movement loop (horizontal)
distance = min(abs(xspeed), max_xspeed)*sign(xspeed);
total_steps = 1+(abs(distance) div segment_width)*segment_enabled;
// movement loop (horizontal)
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
    // update underwater state
    player_update_water();
    // non-terrain object collision
    if player_collision_object() return false;
    // reset local terrain list
    player_get_terrain_list();
    // wall collision
    hit_wall = player_collision_wall(offset_wall);
    // handle wall collision
    if hit_wall
    {
        // eject
        wall_direction = player_wall_eject(hit_wall);
        // get crushed if applicable
        if wall_direction==0 and hit_wall.harmful
        {
            audio_play_sound(sndHurt, 0, 0);
            return player_is_dead();
        }
        // execute reaction
        if player_get_reaction(hit_wall, wall_direction) return false;
        // cut speed if moving towards wall
        if (sign(xspeed)==wall_direction) xspeed = 0;
    }
}
// setup movement loop (vertical)
distance = min(abs(yspeed), max_yspeed)*sign(yspeed);
total_steps = 1+(abs(distance) div segment_height)*segment_enabled;
// movement loop (vertical)
repeat total_steps
{
    // create movement step
    if not segment_enabled step = distance; else
    step = min(abs(distance), segment_height)*sign(distance);
    if abs(distance)>0 distance -= step;
    // apply movement step
    x += sine[angle]*step;
    y += cosine[angle]*step;
    // keep in bounds
    if not player_update_bounds() return false;
    // update underwater state
    player_update_water();
    // non-terrain object collision
    if player_collision_object() return false;
    // reset local terrain list
    player_get_terrain_list();
    // collide based on velocity
    if yspeed>=0
    {
        // floor collision
        //hit_floor = player_collision_floor_air(offset_y);
        hit_floor = player_collision_floor(offset_y);
        // handle floor collision
        if hit_floor
        {
            // execute reaction
            if player_get_reaction(hit_floor, 2) return false;
            // landing
            player_landing(hit_floor);
            // sliding
            if abs(xspeed)<slide_threshold and relative_angle>45 and relative_angle<315 sliding = 32;
            // exit loop
            //break;
        }
    }
    else
    {
        // ceiling collision
        hit_floor = player_collision_ceiling(offset_y);
        // handle ceiling collision
        if hit_floor
        {
            // execute reaction
            if player_get_reaction(hit_floor, -2) return false;
            // flip rotation to ceiling
            mask_rotation = angle_wrap(mask_rotation+180);
            // get terrain data to move outside collision
            player_get_terrain(hit_floor);
            // abort if rising too slow or relative angle is too flat
            if yspeed>ceiling_threshold or (relative_angle>135 and relative_angle<225)
            {
                // slide against ceiling
                xspeed = (xspeed*cosine[relative_angle])+(yspeed*-sine[relative_angle]);
                yspeed = xspeed*-sine[relative_angle];
                xspeed = xspeed*cosine[relative_angle];
                // reset flight gravity, if applicable
                if character_id==2 flight_force = 0.03125;
                // reset air state
                player_in_air();
            }
            else
            {
                // landing
                player_landing(terrain_id);
            }
            // exit loop
            break;
        }
    }
    // wall collision
    hit_wall = player_collision_wall(offset_wall);
    // handle wall collision
    if hit_wall player_wall_eject(hit_wall);
    // update water running (ice shield only)
    player_update_water_running(true);
}
// finished
return true;
