// player_state_wall_run()

// get soft collisions

// animate
animation_new = "wallrun";
timeline_speed = 1;
image_angle = 0;
    
if x > wallRunCenter && x < xprev {
     path_speed +=.15;
} else if x < wallRunCenter && x < xprev { 
     path_speed -=.15;
} else if x < wallRunCenter && x > xprev {
    path_speed +=.15;
} else if x > wallRunCenter && x > xprev {
     path_speed -=.15;
}

//path_speed=8+sin(objScreen.image_index/4)*1.5;
// loop 11,12,13,14,3,4,5,6,7,8,9,10     

if path_position < .01 {
image_index = 0;
} else if path_position < .02 {
image_index = 1;
} else if path_position < .03 {
image_index = 2;
} else if path_position < .04 {
image_index = 3;
} else if path_position < .05 {
image_index = 4;
} else if path_position < .06 {
image_index = 5;
} else if path_position < .1 {
image_index = 6;
} else if path_position < .13 {
image_index = 7;
} else if path_position < .16 {
image_index = 8;
} else if path_position < .175 {
image_index = 9;
}

// second bend finish .20
else if path_position < .20 {
image_index = 10;
} else if path_position < .24 {
image_index = 11;
} else if path_position < .26 {
image_index = 12;
} else if path_position < .32 {
image_index = 13;
} else if path_position < .34 {
image_index = 14;
} else if path_position < .36 {
image_index = 3;
} else if path_position < .37 {
image_index = 4;

// third bend finish .38
} else if path_position < .38 {
image_index = 5;
} else if path_position < .41 {
image_index = 6;
} else if path_position < .43 {
image_index = 7;
} else if path_position < .45 {
image_index = 8;
} else if path_position < .47 {
image_index = 9;
}
// fourth bend finish .51
else if path_position < .51 {
image_index = 10;
}
else if path_position < .55 {
image_index = 11;
} else if path_position < .57 {
image_index = 12;
} else if path_position < .63 {
image_index = 13;
} else if path_position < .65 {
image_index = 14;
} else if path_position < .66 {
image_index = 3;
} else if path_position < .67 {
image_index = 4;
}
// fifth bend finish .67
else if path_position < .68 {
image_index = 5;
} else if path_position < .71 {
image_index = 6;
} else if path_position < .73 {
image_index = 7;
} else if path_position < .75 {
image_index = 8;
} else if path_position < .77 {
image_index = 9;
}
// fourth bend finish .51
else if path_position < .81 {
image_index = 10;
} else if path_position < .83 {
image_index = 11;
} else if path_position < .85 {
image_index = 12;
} else if path_position < .91 {
image_index = 13;
} else if path_position < .96 {
image_index = 2;
} else if path_position < .97 {
image_index = 1;
} else if path_position < .98 {
image_index = 0;
}

if input_check_pressed(cACTION) {
        
            other.active = false;
            other.player_id = noone;
            
            var ground_speed;

            // animate
            animation_new = "spin";
            timeline_speed = 1/max(5-abs(xspeed), 1);
            image_angle = 0;
            
            // states and flags
            state = player_state_fall;
            spinning = true;
            jumping = true;
            jump_action = true;
            spindashing = false;
            
            // movement and collision
            ground_speed = xspeed;
            var v_sine = dsin(relative_angle);
            var v_cosine = dcos(relative_angle);
            xspeed = (v_cosine * ground_speed) - (v_sine * jump_constant)*.75;
            yspeed = -(v_sine * ground_speed) - (v_cosine * jump_constant)*.75;

            path_end();
            // set air state
            player_in_air();
        
        }
if !input_check_pressed(cRIGHT) && alarm[0] == -1 {
    alarm[0] = 32;
} else if !input_check(cRIGHT) && alarm[0] == 0 {
    path_end();
    player_is_falling();
    // animate
    animation_new = "spin";
    timeline_speed = 1/max(5-abs(xspeed), 1);
    image_angle = 0;
}

xprev=x;
//player_update_water();
/* AUTHOR NOTE: Check the end of path event for more ... */
