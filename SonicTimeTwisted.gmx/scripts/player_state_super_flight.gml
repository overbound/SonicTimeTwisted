// player_state_floating()

if objLevel.started == false exit;

if player_collision_object() return false;

    if input_check(cUP) && view_yview < y {
        if yspeed > -4 {
            yspeed-=acceleration;
        }
    } 

    if input_check(cDOWN) && view_yview + view_hview > y {
        if yspeed < 4 {
            yspeed+=acceleration;
        }
    } 

    if !input_check(cUP) && !input_check(cDOWN) {
        if yspeed < 0 {
            yspeed += deceleration;
        } else if yspeed > 0  {
             yspeed -= deceleration;
        }
        if abs(yspeed) < 1 {
            yspeed=0;
        }

    }
    
    if alarm[0] == -1 {
        if input_check(cLEFT){
    
            if xspeed > -4 {
                xspeed-=acceleration;
            }
            facing = -1;
    
        } 
    
        if input_check(cRIGHT) {
            if xspeed < 4 {
                xspeed+=acceleration;
            }
            facing = 1;
            
        } 
    
        if !input_check(cLEFT) && !input_check(cRIGHT)  && view_xview < x {
    
            if xspeed > -2 {
                xspeed -=deceleration;
            } if xspeed < -2 {
                xspeed=-2;
            }
    
        } 
        
        if image_angle > 4 {
        
            image_angle = angle_wrap(image_angle+12)
        } else image_angle = 0;
    }

    if alarm[0] > 0 {
    
        if view_xview < x {
            xspeed +=.05;
            image_angle+=12;
        } else alarm[0] = 0;
    } 
    
    if alarm[0] == 76 && super_lose_rings == true {
    
        // initialize Drop Rings
        rings = min(objGameData.rings[0]-10, 10);
        offset = 0;
        objGameData.rings[0] = max(objGameData.rings[0]-10,0)
        // loop until no rings remain
        while rings
        {
            // increase direction
            if not (rings mod 2) offset += 36;
            if offset>360 offset -= 360;
        
            // create dropped ring
            with instance_create(x-16, y, objRingDroppedFinalBoss)
            {
                // speed
                if (other.rings>16) speed = 2; else speed = 4;
        
                // direction
                direction = gravity_direction+180;
                if (other.rings mod 2) direction -= other.offset; else direction += other.offset;
            }
        
            // reduce ring count
            rings -= 1;
        }
        super_lose_rings = false;
    }
    
    x=clamp(x+xspeed,8,room_width-8);
    y=clamp(y+yspeed,8,room_height-8);

    
   // reset local terrain list
    player_get_terrain_list();
    
 

        if !superform {
        
            player_is_falling();
            animation_new = "float";
        
        }
