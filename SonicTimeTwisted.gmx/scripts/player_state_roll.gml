// player_state_roll()

// ground motion
if not sliding && angle3D == 0
{
    // decelerate if moving in opposite direction
    if input_check(cLEFT) and xspeed>0 {xspeed -= roll_deceleration; if xspeed<0 xspeed = 0;} 
    if input_check(cRIGHT) and xspeed<0 {xspeed += roll_deceleration; if xspeed>0 xspeed = 0;} 
}

// friction
xspeed -= min(abs(xspeed), roll_friction)*sign(xspeed);

// gimmicks
if (gimmick_id != noone)
{
    switch (gimmick_id.object_index)
    {
        case obj3dLayerFlip:
            var distance;
            
             if abs(xspeed) > 28 {
                xspeed = 28*sign(xspeed);
            }
            
            if (gimmick_id.type == 1) distance = x - (gimmick_id.bbox_right + 1);
            else distance = x - gimmick_id.bbox_left;
            
            distance = clamp(distance / (gimmick_id.sprite_width + 8), -1, 1);
            
            angle3D = arcsin(distance);
            
            var slope3D = sin(degtorad(angle));
            
            /*bottom to top */
            if (sign(slope3D) == sign(xspeed)) or (slope3D == 0 && uphill3D == true) {
            
            uphill3D = true;
            }
            else {
            /*top to bottom*/
            
            uphill3D=false;
            
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
if sign(sine[relative_angle])==sign(xspeed) xspeed -= player_slope_factor(slope_friction_up, roll_friction); else
xspeed -= player_slope_factor(slope_friction_down, roll_friction);

// jumping
if input_check_pressed(cACTION) and not player_collision_ceiling(offset_y+5)
{
    rolling_jump = true;
    return player_is_jumping();
}

// uncurl
if abs(xspeed)<unroll_threshold return player_is_running();

// animate
timeline_speed = 1/max(5-abs(xspeed), 1);

// set facing
facing = sign(xspeed);
