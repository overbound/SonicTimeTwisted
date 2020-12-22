// player_reaction_golem_hand_target(local_id, code)
if invulnerable || state==player_state_hurt || state==player_state_dead  || argument0.image_alpha != 1 {
    if argument0.alarm[0] == -1
        argument0.alarm[0] = 25;
    return false;
}
if collision_rectangle(argument0.bbox_left, argument0.bbox_bottom-4, argument0.bbox_right, argument0.bbox_bottom, self, true, false)  { //&& argument0.y > argument0.yprevious
    player_hit(facing*-1, sndHurt);
    argument0.alarm[0] = 25;
    return true;
} 
if (spinning or state==player_state_glide or state==player_state_glide_slide) && argument0.hit == 0
{
    xspeed = -xspeed;
    
    if not landed {
    jump_action = true;
        // get bounce direction
        bounce_direction = angle_wrap(point_direction(argument0.x, argument0.y, x, y)-gravity_angle());
        // movement and collision
        xspeed = cosine[bounce_direction]*4;
        yspeed = -sine[bounce_direction]*4;
    }
    
    with objGolem life -=1;
    
        with argument0 {
            hit = sign(x-other.x);
            if (hit == 0) 
            {
                hit = other.facing;
            }
            else
            {
                // rumble
                rumble(rumble_short_strong_double);            
            }
        }
    return true;
} else {
    player_hit(facing*-1, sndHurt);
    argument0.alarm[0] = 25;
    
}
return true;
