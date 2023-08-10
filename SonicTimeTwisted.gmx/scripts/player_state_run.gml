// player_state_run()
var motion_direction = input_axis_x();
// if flag for reversing motion direction is set (used by vertical corkscrew gimmick, etc.)
if (reverse_control)
{
    if (motion_direction == 0) // if motion direction is neutral
        reverse_control = false; // clear reverse control flag 
    else
        motion_direction *= -1; // else reverse motion direction
}
// ground motion
if motion_direction!=0
{
    // moving in opposite direction
    if xspeed!=0 and sign(xspeed)!=motion_direction
    {
        // ignore if sliding
        if not sliding
        {
            // braking
            if abs(xspeed)>brake_threshold and mask_rotation==gravity_angle() {animation_new = "brake"; timeline_speed = 1;}
            // decelerate and reverse direction
            
            xspeed += deceleration*motion_direction;
            if xspeed!=0 and sign(xspeed)==motion_direction xspeed = deceleration*motion_direction;
        }
    } 
    else
    {
        // accelerate
        if abs(xspeed)<used_speed_cap
        {
            xspeed += acceleration*motion_direction;
            if abs(xspeed)>used_speed_cap xspeed = used_speed_cap*motion_direction;
        } else {
            if (objProgram.inputManager.analog_applied) {
                // decelerate with analog controls
                if (objProgram.inputManager.analog_x != 0 && abs(objProgram.inputManager.analog_x) < 1) {
                    if xspeed > used_speed_cap xspeed = xspeed - deceleration;
                    if xspeed < used_speed_cap xspeed = xspeed + deceleration;
                }
            }
        }
    }
}
else
{
    // decelerate
    xspeed -= min(abs(xspeed), ground_friction)*sign(xspeed);
}
// gimmicks
if (gimmick_id != noone)
{
    switch (gimmick_id.object_index)
    {
        case obj3dLayerFlip:
            var distance;
            
            xspeed *= 1.0015
            if abs(xspeed) > 20 {
                xspeed = (20)*sign(xspeed);
            }
            
            if (gimmick_id.type == 1) distance = x - (gimmick_id.bbox_right + 1);
            else distance = x - gimmick_id.bbox_left;
            
            distance = clamp(distance / (gimmick_id.sprite_width + 8), -1, 1);
            
            angle3D = arcsin(distance);
            
                        
            //animation hack
            animation_new = "3DTurn";
            timeline_speed = 1;
            /*bottom to top */
            //if sin(degtorad(angle)) != 0
            
            var slope3D = sin(degtorad(angle));
            
            if (sign(slope3D) == sign(xspeed)) or (slope3D == 0 && uphill3D == true) {
            
            uphill3D = true;
            
            if angle3D < 0.276 and angle3D > -0.276 {
            image_index = 3;
            }
            else if angle3D < -0.833 {
            image_index = 6;
            }
            else if angle3D < -0.555 {
            image_index = 5;
            }
            else if angle3D < -0.277 {
            image_index = 4;
            }
            else if angle3D > 0.833 {
            image_index = 0;
            }
            else if angle3D > 0.555 {
            image_index = 1;
            }
            else if angle3D > 0.277 {
            image_index = 2;
            }
            }
            
            else {
            /*top to bottom*/
            
            uphill3D=false;
            
            if angle3D < 0.276 and angle3D > -0.276 {
            image_index = 3;
            }
            else if angle3D < -0.833 {
            image_index = 0;
            }
            else if angle3D < -0.555 {
            image_index = 1;
            }
            else if angle3D < -0.277 {
            image_index = 2;
            }
            else if angle3D > 0.833 {
            image_index = 6;
            }
            else if angle3D > 0.555 {
            image_index = 5;
            }
            else if angle3D > 0.277 {
            image_index = 4;
            }
            }
             
            break;
    }
    
    gimmick_id = noone;
}
else
{
    angle3D = 0;
}
// update position
if not player_movement_ground() return false;
// falling
if not landed return player_is_falling();
// slide if moving too slow
if abs(xspeed)<slide_threshold and relative_angle>=45 and relative_angle<=315
{
    // if not at gravity angle, fall instead
    if relative_angle>=90 and relative_angle<=270 return player_is_falling(); else
    if not sliding sliding = 32;
}

// slope factor
if abs(xspeed)>used_speed_cap xspeed -= player_slope_factor(slope_friction_cap, ground_friction); else
xspeed -= player_slope_factor(slope_friction, ground_friction);
// standing
if motion_direction==0 and xspeed==0 return player_is_standing();
// jumping
if input_check_pressed(cACTION) and not player_collision_ceiling(offset_y+5) return player_is_jumping();
// rolling (ignore if holding forward/backward)
if (input_check(cDOWN) && input_axis_x() == 0 && abs(xspeed) >= roll_threshold) && terrain_id != objPlaneGimmick
{
    play_sfx(sndSpin, 0);
    return player_is_rolling();
}
// animate
if not ((animation_new=="push" and facing==motion_direction) or (animation_new=="brake" and facing!=motion_direction) or angle3D != 0)
{
    // running
    if (character_id==1 and abs(xspeed)>=10) or (character_id==2 and abs(xspeed)>=8) animation_new = "sprint"; else
    if abs(xspeed)>=6 animation_new = "run"; else
    animation_new = "walk";
    timeline_speed = 1/max(8-abs(xspeed), 1);
}
image_angle = angle;
// set facing
if motion_direction!=0 and sign(xspeed)==motion_direction facing = motion_direction;
