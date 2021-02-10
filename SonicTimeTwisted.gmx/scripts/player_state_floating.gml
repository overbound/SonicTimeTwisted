// player_state_floating()
    // non-solid object collision
    if player_collision_object() return false;
    
    if input_check(cUP){
    yspeed=-2;
    }
    if input_check(cDOWN){
        yspeed=2;
    }
    if !input_check(cUP) && !input_check(cDOWN) {
        if abs(yspeed) <> .25 && yspeed != 0 {
            yspeed += 0.125*-sign(yspeed);
        } else yspeed = 0;
    }
    x+=xspeed;
    y+=yspeed;
   // reset local terrain list
    player_get_terrain_list();
    // wall collision
    hit_wall = player_collision_wall(offset_wall);
        if hit_wall player_wall_eject(hit_wall);
    hit_floor = player_collision_ceiling(offset_y);
        if hit_floor  while collision_box(offset_x, offset_y, mask_rotation mod 180, hit_floor) {x += sine[angle]; y += cosine[angle];}
    hit_floor = player_collision_floor(offset_y);
        if hit_floor  while collision_box(offset_x, offset_y, mask_rotation mod 180, hit_floor) {x += sine[angle]; y -= cosine[angle];}
// rumble
rumble(rumble_short_weakest);
