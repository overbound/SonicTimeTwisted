// player_state_roll_automatically()
// Lighter script, especially without possible control, used in the VVZ -> DDZ transition

// friction
xspeed -= min(abs(xspeed), roll_friction)*sign(xspeed);
// gimmicks
angle3D = 0;
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
// animate
timeline_speed = 1/max(5-abs(xspeed), 1);
// set facing
facing = sign(xspeed);
