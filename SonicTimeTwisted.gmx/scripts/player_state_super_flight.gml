// player_state_floating()
if (not objLevel.started) return false;
if (player_collision_object()) return false;

var analog_applied = objProgram.inputManager.analog_applied;    

if (analog_applied) {

    var analog_y = objProgram.inputManager.analog_y;
    var used_speed_cap_y = speed_cap * abs(analog_y);

    if abs(yspeed) > used_speed_cap_y {
        if yspeed < 0 {
            yspeed += deceleration;
        } else if yspeed > 0  {
             yspeed -= deceleration;
        }
        if abs(yspeed) < 1 {
            yspeed=0;
        }
    } else {
        if analog_y < 0 && view_yview < y {
            if yspeed > -used_speed_cap_y {
                yspeed-=acceleration;
            }
        } else {
            if analog_y > 0 && view_yview + view_hview > y {
                if yspeed < used_speed_cap_y {
                    yspeed+=acceleration;
                }
            }         
        }
    }
} else {
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
}

switch (alarm[0])
{
    case -1:
        if (analog_applied) {

            var analog_x = objProgram.inputManager.analog_x;
            var used_speed_cap_x = speed_cap * abs(analog_x);
            
            if analog_x == 0 || abs(xspeed) > used_speed_cap_x  {
        
                if xspeed > -2 {
                   xspeed -=deceleration;
                } if xspeed < -2 {
                    xspeed=-2;
                }
            } else {
                if analog_x < 0 {
            
                    if xspeed > -used_speed_cap_x {
                        xspeed-=acceleration;
                    }
                    facing = -1;
            
                } else {
                    if analog_x > 0 {
                        if xspeed < used_speed_cap_x {
                            xspeed+=acceleration;
                        }
                        facing = 1;
                    } 
                }
            }     
        } else {
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
        }
        
        if image_angle > 4 {
        
            image_angle = angle_wrap(image_angle+12)
        } else image_angle = 0;
    case 76:
        if (super_lose_rings)
        {
            var ring_count = objGameData.rings[0] - 10;
            var dir = 0;
            for (var total = min(ring_count, 10); total > 0; --total)
            {
                dir = angle_wrap(dir + (36 * ((total + 1) mod 2)));
                with (instance_create(x - 16, y, objRingDroppedFinalBoss))
                {
                    speed = 4;
                    direction = gravity_direction + 180 + (sign(1.5 - ((total mod 2) * 3)) * dir);
                }
            }
            objGameData.rings[0] = max(ring_count, 0);
            if (objGameData.rings[0] == 0)
            {
                player_transform(false);
            }
            super_lose_rings = false;
        }
    break;
    default:
        if (view_xview < x)
        {
            xspeed += 0.05;
            image_angle += 12;
        }
        else
        {
            alarm[0] = 0;
        }
} 

x = clamp(x + xspeed, 8, room_width - 8);
y = clamp(y + yspeed, 8, room_height - 8);

player_get_terrain_list();

if (!superform)
{
    player_is_falling();
    animation_new = "float";
}
