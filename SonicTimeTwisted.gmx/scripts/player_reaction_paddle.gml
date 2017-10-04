//player_reaction_paddle

if (bbox_bottom < argument0.y && argument0.top == false) || (bbox_top > argument0.y && argument0.top == true) {
    gravity_force = 0;
    jump_action = false;
    
    // get bounce direction
    var bounce_direction = angle_wrap(point_direction(argument0.x, argument0.y, x, y)-gravity_angle());
    
    // Set Speed
    xspeed = cosine[bounce_direction]*8;
    yspeed = -sine[bounce_direction]*8;
    
    //y = yprevious;
    
    // move outside
    while collision_box(offset_x, offset_y, (mask_rotation mod 180), argument0) {/*x += sign(xspeed); */ y += sign(yspeed);}
    
    
    if !audio_is_playing(sndAADropBumper) {
    
            audio_play_sound(sndAADropBumper,1,0);
        
        }
    
    // animate
    animation_new = "spin";
    timeline_speed = 1/max(5-abs(xspeed), 1);
    image_angle = 0;
    
    if state == player_state_glide or state == player_state_fly {
        player_is_falling();
    }
    
    argument0.remove = 0;
    
    with argument0.parent.paddle[1] {
        if object_index == objPaddleTop && alarm[1] == -1 {
            alarm[1] = 2;
        }
    }
}
