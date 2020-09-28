// player_state_glide()
// acceleration
if not (abs(glide_angle) mod 180) and glide_speed<16 {glide_speed += glide_acceleration; if glide_speed>16 glide_speed = 16;}
// motion direction
if input_check(cLEFT) glide_direction = -1; else
if input_check(cRIGHT) glide_direction = 1;
// turning
glide_angle = clamp(glide_angle-(2.8125*glide_direction), 0, 180);
// speed
xspeed = glide_speed*cosine[glide_angle];
xspeed = min(abs(xspeed), 12)*sign(xspeed);
// update position
if not player_movement_air() return false;
// glide pressure
if glide_force<0.5 {glide_force += 0.125; if glide_force>0.5 glide_force = 0.5;}
// gravity
if abs(glide_force-yspeed)>0 yspeed += min(abs(glide_force-yspeed), 0.125)*sign(glide_force-yspeed);
// falling
if input_check_released(cACTION) return player_is_glide_falling();
// landing
if landed
{
    if relative_angle>=45 and relative_angle<=315 {if xspeed!=0 return player_is_running(); else return player_is_standing();} else
    return player_is_glide_sliding();
}
// climbing
if (wall_direction != 0) and (wall_direction == glide_direction)
{
    climb_id = player_collision_wall(offset_wall + 1);
    if climb_id > -1 {if climb_id.climbable return player_is_climbing();}
}
// animate
if xspeed!=0 facing = sign(xspeed);
if (abs(glide_angle-90)>67.5) image_index = 0; else
if (abs(glide_angle-90)>22.5) image_index = 1; else
image_index = 2;
