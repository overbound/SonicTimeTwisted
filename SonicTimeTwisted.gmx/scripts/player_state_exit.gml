// player_state_exit()
var distance, total_steps, step, hit_floor;

// stop if we're leaving
if persistent return false;

// clamp speed, if applicable
if limit_xspeed xspeed = min(abs(xspeed), max_xspeed)*sign(xspeed);

// setup movement loop
distance = min(abs(xspeed), max_xspeed)*sign(xspeed);
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

    // reset landing; keep terrain tag
    landed &= ~254;

    // update underwater state
    player_update_water();

    // reset local terrain list
    player_get_terrain_list();

    // floor collision
    hit_floor = player_collision_floor(offset_y*2);

    // handle floor collision
    if hit_floor
    {
        // confirm terrain landing
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

// transition if out of view
if not in_view(camera.view_id, 32) && camera != noone
{
    // persist and wait
    persistent = true;
    camera = noone;
    with shield persistent = true;
    with invincibility persistent = true;

    // time travel
    level_time_travel(); 
    return false;
}

// animate
image_angle = angle;
