// player_reaction_plane(local_id)
if landed == false {
    with argument0 {
        active = true;
    }
    
    x = argument0.x+6;
    argument0.rebound = true;
    
    
    // wall collision
    hit_wall = player_collision_wall(offset_wall);
    
        // handle wall collision
    if hit_wall  
    {
        // eject
        wall_direction = player_wall_eject(hit_wall);
        // get crushed if applicable
        if wall_direction==0 and (hit_wall.harmful or terrain_id.harmful)
        {
            play_sfx(sndHurt, 0);
            return player_is_dead();
        }
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
} else {
    if (!argument0.active)
    {
        if ((x > argument0.x + 3)) && (x < argument0.x + 9)
        {
            argument0.active = true;
            argument0.x = x - 6;        
        }
    }
}


